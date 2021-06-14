package com.zdj.miaoshaproject.controller;

import com.google.common.util.concurrent.RateLimiter;
import com.zdj.miaoshaproject.controller.viewobject.OrderVO;
import com.zdj.miaoshaproject.mq.MqProducer;
import com.zdj.miaoshaproject.service.ItemService;
import com.zdj.miaoshaproject.service.OrderService;
import com.zdj.miaoshaproject.error.BusinessException;
import com.zdj.miaoshaproject.error.EmBusinessError;
import com.zdj.miaoshaproject.response.CommonReturnType;
import com.zdj.miaoshaproject.service.PromoService;
import com.zdj.miaoshaproject.service.model.UserModel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;

import javax.annotation.PostConstruct;
import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.concurrent.*;


@Controller("order")
@RequestMapping("/order")
@CrossOrigin(origins = {"*"},allowCredentials = "true")
public class OrderController extends BaseController {
    @Autowired
    private OrderService orderService;

    @Autowired
    private HttpServletRequest httpServletRequest;

    @Autowired
    private RedisTemplate redisTemplate;

    @Autowired
    private MqProducer mqProducer;

    @Autowired
    private ItemService itemService;

    @Autowired
    private PromoService promoService;

    private ExecutorService executorService;

    private RateLimiter orderCreateRateLimiter;

    @PostConstruct
    public void init(){
        executorService = Executors.newFixedThreadPool(20);

        orderCreateRateLimiter = RateLimiter.create(300);

    }

//    //生成验证码
//    @RequestMapping(value = "/generateverifycode",method = {RequestMethod.GET,RequestMethod.POST})
//    @ResponseBody
//    public void generateverifycode(HttpServletResponse response) throws BusinessException, IOException {
//        String token = httpServletRequest.getParameterMap().get("token")[0];
//        if(StringUtils.isEmpty(token)){
//            throw new BusinessException(EmBusinessError.USER_NOT_LOGIN,"用户还未登陆，不能生成验证码");
//        }
//        UserModel userModel = (UserModel) redisTemplate.opsForValue().get(token);
//        if(userModel == null){
//            throw new BusinessException(EmBusinessError.USER_NOT_LOGIN,"用户还未登陆，不能生成验证码");
//        }
//
//        Map<String,Object> map = CodeUtil.generateCodeAndPic();
//
//        redisTemplate.opsForValue().set("verify_code_"+userModel.getId(),map.get("code"));
//        redisTemplate.expire("verify_code_"+userModel.getId(),10,TimeUnit.MINUTES);
//
//        ImageIO.write((RenderedImage) map.get("codePic"), "jpeg", response.getOutputStream());
//
//
//    }


    //生成秒杀令牌
    @RequestMapping(value = "/generatetoken",method = {RequestMethod.POST},consumes={CONTENT_TYPE_FORMED})
    @ResponseBody
    public CommonReturnType generatetoken(@RequestParam(name="itemId")Integer itemId,
                                        @RequestParam(name="promoId")Integer promoId,
                                          @RequestParam(name="token")String token) throws BusinessException {
        //根据token获取用户信息
        //获取用户的登陆信息
        UserModel userModel = (UserModel) redisTemplate.opsForValue().get(token);
        if(userModel == null){
            throw new BusinessException(EmBusinessError.USER_NOT_LOGIN,"用户还未登陆，不能下单");
        }

        if (promoId != null) {
            //获取秒杀访问令牌
            String promoToken = promoService.generateSecondKillToken(promoId,itemId,userModel.getId());

            if(promoToken == null){
                throw new BusinessException(EmBusinessError.PARAMETER_VALIDATION_ERROR,"生成令牌失败");
            }
            //返回对应的结果
            return CommonReturnType.create(promoToken);
        }
        return CommonReturnType.create(11);
    }
        //封装下单请求
    @RequestMapping(value = "/createorder",method = {RequestMethod.POST},consumes={CONTENT_TYPE_FORMED})
    @ResponseBody
    public CommonReturnType createOrder(@RequestParam(name="itemId")Integer itemId,
                                        @RequestParam(name="amount")Integer amount,
                                        @RequestParam(name="promoId",required = false)Integer promoId,
                                        @RequestParam(name="promoToken",required = false)String promoToken) throws BusinessException {

        if(!orderCreateRateLimiter.tryAcquire()){
            throw new BusinessException(EmBusinessError.RATELIMIT);
        }

        String token = httpServletRequest.getParameterMap().get("token")[0];
        if(StringUtils.isEmpty(token)){
            throw new BusinessException(EmBusinessError.USER_NOT_LOGIN,"用户还未登陆，不能下单");
        }
        //获取用户的登陆信息
        UserModel userModel = (UserModel) redisTemplate.opsForValue().get(token);
        if(userModel == null){
            throw new BusinessException(EmBusinessError.USER_NOT_LOGIN,"用户还未登陆，不能下单");
        }
        //校验秒杀令牌是否正确
        if(promoId != null && promoToken != "11"){
            String inRedisPromoToken = (String) redisTemplate.opsForValue().get("promo_token_"+promoId+"_userid_"+userModel.getId()+"_itemid_"+itemId);
            if(inRedisPromoToken == null){
                throw new BusinessException(EmBusinessError.PARAMETER_VALIDATION_ERROR,"秒杀令牌校验失败");
            }
            if(!org.apache.commons.lang3.StringUtils.equals(promoToken,inRedisPromoToken)){
                throw new BusinessException(EmBusinessError.PARAMETER_VALIDATION_ERROR,"秒杀令牌校验失败");
            }
        }

        //同步调用线程池的submit方法
        //拥塞窗口为20的等待队列，用来队列化泄洪
        Future<Object> future = executorService.submit(new Callable<Object>() {

            @Override
            public Object call() throws Exception {
                //加入库存流水init状态
                String stockLogId = itemService.initStockLog(itemId,amount);


                //再去完成对应的下单事务型消息机制
                if(!mqProducer.transactionAsyncReduceStock(userModel.getId(),itemId,promoId,amount,stockLogId)){
                    throw new BusinessException(EmBusinessError.UNKNOWN_ERROR,"下单失败");
                }
                return null;
            }
        });

        try {
            future.get();
        } catch (InterruptedException e) {
            throw new BusinessException(EmBusinessError.UNKNOWN_ERROR);
        } catch (ExecutionException e) {
            throw new BusinessException(EmBusinessError.STOCK_NOT_ENOUGH);
        }

        return CommonReturnType.create(null);
    }
    //商品列表页面浏览
    @RequestMapping(value = "/getOrders",method = {RequestMethod.GET})
    @ResponseBody
    public CommonReturnType listOrders(@RequestParam("token") String token) throws BusinessException {
        UserModel userModel = (UserModel) redisTemplate.opsForValue().get(token);
        if(userModel == null){
            throw new BusinessException(EmBusinessError.USER_NOT_LOGIN,"用户还未登陆，不能下单");
        }
        List<OrderVO> orders = orderService.getOrder(userModel.getId());
        return CommonReturnType.create(orders);
    }

}
