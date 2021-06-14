package com.zdj.miaoshaproject.controller;

import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.TimeUnit;
import java.util.stream.Collectors;


import com.zdj.miaoshaproject.controller.viewobject.DecreaseVO;
import com.zdj.miaoshaproject.controller.viewobject.ItemVO;
import com.zdj.miaoshaproject.dao.DecreaseLogMapper;
import com.zdj.miaoshaproject.dataobject.DecreaseLog;
import com.zdj.miaoshaproject.dataobject.PromoDO;
import com.zdj.miaoshaproject.error.BusinessException;
import com.zdj.miaoshaproject.response.CommonReturnType;
import com.zdj.miaoshaproject.service.CacheService;
import com.zdj.miaoshaproject.service.PromoService;
import com.zdj.miaoshaproject.service.impl.DescreaseServiceImpl;
import com.zdj.miaoshaproject.service.model.ItemModel;
import org.apache.commons.lang3.RandomStringUtils;
import org.joda.time.format.DateTimeFormat;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import com.zdj.miaoshaproject.service.ItemService;


@Controller("/item")
@RequestMapping("/item")
@CrossOrigin(origins = {"*"},allowCredentials = "true")
public class ItemController extends BaseController {

    @Autowired
    private ItemService itemService;

    @Autowired
    private RedisTemplate redisTemplate;

    @Autowired
    private CacheService cacheService;

    @Autowired
    private PromoService promoService;

    @Autowired
    private DecreaseLogMapper decreaseLogMapper;

    @Autowired
    private DescreaseServiceImpl descreaseService;

    //创建商品的controller
    @RequestMapping(value = "/create",method = {RequestMethod.POST},consumes={CONTENT_TYPE_FORMED})
    @ResponseBody
    public CommonReturnType createItem(@RequestParam(name = "title")String title,
                                       @RequestParam(name = "description")String description,
                                       @RequestParam(name = "price")BigDecimal price,
                                       @RequestParam(name = "stock")Integer stock,
                                       @RequestParam(name = "imgUrl")String imgUrl,
                                       @RequestParam(name = "detailImage1")String detailImage1,
                                       @RequestParam(name = "detailImage2")String detailImage2,
                                       @RequestParam(name = "detailImage3")String detailImage3
                                       ) throws BusinessException {
        //封装service请求用来创建商品
        ItemModel itemModel = new ItemModel();
        itemModel.setTitle(title);
        itemModel.setDescription(description);
        itemModel.setPrice(price);
        itemModel.setStock(stock);
        itemModel.setImgUrl(imgUrl);
        List<String> detailImages = new ArrayList<>();
        detailImages.add(detailImage1);
        detailImages.add(detailImage2);
        detailImages.add(detailImage3);
        itemModel.setDetailImages(detailImages);
        ItemModel itemModelForReturn = itemService.createItem(itemModel);

        itemService.addItemDetailImage(itemModelForReturn.getId(), detailImages);
        ItemVO itemVO = convertVOFromModel(itemModelForReturn);

        return CommonReturnType.create(itemVO);
    }

    // 创建秒杀活动
    @RequestMapping(value = "/create_promo",method = {RequestMethod.POST},consumes={CONTENT_TYPE_FORMED})
    @ResponseBody
    public CommonReturnType createItem(@RequestParam(name = "promoName")String promoName,
                                       @RequestParam(name = "startDate")String startDate,
                                       @RequestParam(name = "endDate")String endDate,
                                       @RequestParam(name = "itemId")Integer itemId,
                                       @RequestParam(name = "promoItemPrice")Double promoItemPrice) throws BusinessException, ParseException {
        PromoDO promoDO = new PromoDO();
        promoDO.setPromoName(promoName);
        promoDO.setItemId(itemId);
        promoDO.setStartDate(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(startDate));
        promoDO.setEndDate(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(endDate));
        promoDO.setPromoItemPrice(promoItemPrice);

        promoService.createPromo(promoDO);

        return CommonReturnType.create(null);
    }

    @RequestMapping(value = "/getPromos",method = {RequestMethod.GET})
    @ResponseBody
    public CommonReturnType getPromos(){
        return CommonReturnType.create(promoService.listPromo());
    }

    @RequestMapping(value = "/publishpromo",method = {RequestMethod.GET})
    @ResponseBody
    public CommonReturnType publishpromo(@RequestParam(name = "id")Integer id){
        promoService.publishPromo(id);
        return CommonReturnType.create(null);

    }

    @RequestMapping(value = "/deletePromo",method = {RequestMethod.GET})
    @ResponseBody
    public CommonReturnType deletePromo(@RequestParam(name = "id")Integer id){
        promoService.deletePromo(id);
        return CommonReturnType.create(null);

    }

    //商品详情页浏览
    @RequestMapping(value = "/get",method = {RequestMethod.GET})
    @ResponseBody
    public CommonReturnType getItem(@RequestParam(name = "id")Integer id){
        ItemModel itemModel = null;

        //先取本地缓存
        itemModel = (ItemModel) cacheService.getFromCommonCache("item_"+id);

        if(itemModel == null){
            //根据商品的id到redis内获取
            itemModel = (ItemModel) redisTemplate.opsForValue().get("item_"+id);

            //若redis内不存在对应的itemModel,则访问下游service
            if(itemModel == null){
                itemModel = itemService.getItemById(id);
                //设置itemModel到redis内
                redisTemplate.opsForValue().set("item_"+id,itemModel);
                redisTemplate.expire("item_"+id,10, TimeUnit.SECONDS);
            }
            //填充本地缓存
            cacheService.setCommonCache("item_"+id,itemModel);
        }


        ItemVO itemVO = convertVOFromModel(itemModel);

        return CommonReturnType.create(itemVO);

    }

    //商品列表页面浏览
    @RequestMapping(value = "/list",method = {RequestMethod.GET})
    @ResponseBody
    public CommonReturnType listItem(){
        List<ItemModel> itemModelList = itemService.listItem();
        itemModelList = itemModelList.stream().filter(itemModel -> itemModel.getPromoModel() == null).collect(Collectors.toList());
        //使用stream apiJ将list内的itemModel转化为ITEMVO;
        List<ItemVO> itemVOList =  itemModelList.stream().map(itemModel -> {
            ItemVO itemVO = this.convertVOFromModel(itemModel);
            return itemVO;
        }).collect(Collectors.toList());
        return CommonReturnType.create(itemVOList);
    }

    //商品列表页面浏览
    @RequestMapping(value = "/list_promo",method = {RequestMethod.GET})
    @ResponseBody
    public CommonReturnType listPromoItem(){
        List<ItemModel> itemModelList = itemService.listPromoItem();

        //使用stream apiJ将list内的itemModel转化为ITEMVO;
        List<ItemVO> itemVOList =  itemModelList.stream().map(itemModel -> {
            ItemVO itemVO = this.convertVOFromModel(itemModel);
            return itemVO;
        }).collect(Collectors.toList());
        return CommonReturnType.create(itemVOList);
    }
    // 生成砍价码
    @RequestMapping(value = "/gendiscount",method = {RequestMethod.POST})
    @ResponseBody
    public CommonReturnType gendiscount(@RequestParam(name = "userId")Integer userId,
                                        @RequestParam(name = "itemId")Integer itemId){
        DecreaseLog decreaseLog = new DecreaseLog();
        decreaseLog.setItemId(itemId);
        decreaseLog.setUserId(userId);
        decreaseLog.setDiscount(0.0);
        String token = "";
        try {
            // 生成砍价码
            if (redisTemplate.opsForValue().get(userId + itemId + "") == null) {


                decreaseLogMapper.insert(decreaseLog);
                token = RandomStringUtils.randomAlphanumeric(6).toLowerCase();
                redisTemplate.opsForValue().set(token, decreaseLog);
                redisTemplate.opsForValue().set(userId + itemId + "", token);
                redisTemplate.expire(token,2, TimeUnit.HOURS);
            } else {
                token = (String) redisTemplate.opsForValue().get(userId + itemId + "");
                redisTemplate.opsForValue().set(token, decreaseLog);

            }


        } catch (Exception e) {
            e.printStackTrace();
            return CommonReturnType.create(token, "failure");
        }
        return CommonReturnType.create(token, "success");
    }
    @RequestMapping(value = "/getDecrease",method = {RequestMethod.GET})
    @ResponseBody
    public CommonReturnType getDecreaseByUserId(@RequestParam(name = "userId")Integer userId){

        List<DecreaseVO> decreaseLog = descreaseService.getDecreaseLog(userId);
        return CommonReturnType.create(decreaseLog);

    }
    private ItemVO convertVOFromModel(ItemModel itemModel){
        if(itemModel == null){
            return null;
        }
        ItemVO itemVO = new ItemVO();
        BeanUtils.copyProperties(itemModel,itemVO);
        if(itemModel.getPromoModel() != null){
            //有正在进行或即将进行的秒杀活动
            itemVO.setPromoStatus(itemModel.getPromoModel().getStatus());
            itemVO.setPromoId(itemModel.getPromoModel().getId());
            itemVO.setStartDate(itemModel.getPromoModel().getStartDate().toString(DateTimeFormat.forPattern("yyyy-MM-dd HH:mm:ss")));
            itemVO.setEndDate(itemModel.getPromoModel().getEndDate().toString(DateTimeFormat.forPattern("yyyy-MM-dd HH:mm:ss")));
            itemVO.setPromoPrice(itemModel.getPromoModel().getPromoItemPrice());
            itemVO.setDetailImages(itemModel.getDetailImages());
        }else{
            itemVO.setPromoStatus(0);
        }
        return itemVO;
    }

}
