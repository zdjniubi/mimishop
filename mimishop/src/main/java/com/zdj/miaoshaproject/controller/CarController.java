package com.zdj.miaoshaproject.controller;

import com.zdj.miaoshaproject.controller.viewobject.CarRecordVO;
import com.zdj.miaoshaproject.dataobject.CarRecord;
import com.zdj.miaoshaproject.error.BusinessException;
import com.zdj.miaoshaproject.error.EmBusinessError;
import com.zdj.miaoshaproject.response.CommonReturnType;
import com.zdj.miaoshaproject.service.ItemService;
import com.zdj.miaoshaproject.service.impl.CarServiceImpl;
import com.zdj.miaoshaproject.service.model.ItemModel;
import com.zdj.miaoshaproject.service.model.UserModel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@Controller("/car")
@RequestMapping("/car")
@CrossOrigin(origins = {"*"},allowCredentials = "true")
public class CarController {

    @Autowired
    private CarServiceImpl carService;

    @Autowired
    private ItemService itemService;

    @Autowired
    private RedisTemplate redisTemplate;

    @RequestMapping(value = "/create",method = {RequestMethod.POST},consumes={BaseController.CONTENT_TYPE_FORMED})
    @ResponseBody
    public CommonReturnType createItem(@RequestParam(name = "userId")int uid,
                                       @RequestParam(name = "itemId")int itemId,
                                       @RequestParam(name = "count") int count) throws BusinessException {

        CarRecord carRecord = carService.insertCarRecord(uid, itemId, 0, count);
        return CommonReturnType.create(null, "添加成功");

    }
    @RequestMapping(value = "/getRecord", method = {RequestMethod.GET})
    @ResponseBody
    public CommonReturnType getRecord(@RequestParam(name = "token")String token) {
        UserModel userModel = (UserModel)redisTemplate.opsForValue().get(token);
        if (userModel == null) {
            return CommonReturnType.create(null, "un_login");
        }
        List<CarRecord> carRecord = carService.getCarRecord(userModel.getId());
        List<CarRecordVO> carRecordVOS = new ArrayList<>();
        carRecord.stream().forEach(c -> {
            carRecordVOS.add(convertViewObject(c));
        });
        if (carRecord == null || carRecord.size() == 0) {
            return CommonReturnType.create(null, "未购买任何商品");
        } else {
            return CommonReturnType.create(carRecordVOS, "success");
        }
    }
    @RequestMapping(value = "/delete", method = {RequestMethod.GET})
    @ResponseBody
    public CommonReturnType delete(@RequestParam(name = "carId") int id,
                                   @RequestParam(name = "token") String token) throws BusinessException {
        UserModel userModel = (UserModel) redisTemplate.opsForValue().get(token);
        if(userModel == null){
            throw new BusinessException(EmBusinessError.USER_NOT_LOGIN,"用户还未登陆，不能下单");
        }
        CarRecord carRecord = carService.getById(id);
        if (carRecord.getUid() != userModel.getId()) {
            throw new BusinessException(EmBusinessError.USER_NOT_LOGIN,"用户id不同");
        }
        carService.delete(carRecord.getId());
        return CommonReturnType.create(null, "success");
    }
    private CarRecordVO convertViewObject(CarRecord carRecord) {
        CarRecordVO carRecordVO = new CarRecordVO();
        carRecordVO.setId(carRecord.getId());
        carRecordVO.setCount(carRecord.getCount());
        carRecordVO.setItemId(carRecord.getItemId());
        carRecordVO.setStatus(carRecord.getStatus());
        ItemModel item = itemService.getItemById(carRecord.getItemId());
        if (item.getPromoModel() == null) {
            carRecordVO.setPrice(item.getPrice());
        } else {
            carRecordVO.setPromoId(item.getPromoModel().getId());
            carRecordVO.setPrice(item.getPromoModel().getPromoItemPrice());
        }
        carRecordVO.setImgUrl(item.getImgUrl());
        carRecordVO.setTitle(item.getTitle());
        return carRecordVO;
    }


}
