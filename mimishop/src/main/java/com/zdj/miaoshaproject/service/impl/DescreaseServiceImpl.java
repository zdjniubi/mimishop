package com.zdj.miaoshaproject.service.impl;

import com.zdj.miaoshaproject.controller.viewobject.DecreaseVO;
import com.zdj.miaoshaproject.dao.DecreaseLogMapper;
import com.zdj.miaoshaproject.dao.FriendDOMapper;
import com.zdj.miaoshaproject.dataobject.DecreaseLog;
import com.zdj.miaoshaproject.dataobject.FriendDO;
import com.zdj.miaoshaproject.service.ItemService;
import com.zdj.miaoshaproject.service.UserService;
import com.zdj.miaoshaproject.service.model.ItemModel;
import com.zdj.miaoshaproject.service.model.UserModel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
@Service
public class DescreaseServiceImpl {
    @Autowired
    private DecreaseLogMapper decreaseLogMapper;

    @Autowired
    private ItemService itemService;

    @Autowired
    private FriendDOMapper friendService;

    @Autowired
    private UserService userService;
    public List<DecreaseVO> getDecreaseLog(int userId) {
        List<DecreaseLog> decreaseLogs = decreaseLogMapper.selectByUserId(userId);

        List<DecreaseVO> decreaseVOS = new ArrayList<>();
        if (decreaseLogs.size() == 0) return decreaseVOS;
        decreaseLogs.stream().forEach(decreaseLog -> {
            ItemModel itemModel = itemService.getItemById(decreaseLog.getItemId());
            DecreaseVO decreaseVO = new DecreaseVO();
            decreaseVO.setItemId(decreaseLog.getItemId());
            decreaseVO.setDiscount(decreaseLog.getDiscount());
            decreaseVO.setTitle(itemModel.getDescription());
            decreaseVO.setItemImg(itemModel.getImgUrl());
            decreaseVO.setItemOriginalPrice(itemModel.getPrice().doubleValue());
            List<FriendDO> friendDOS = friendService.selectByUserIdItemId(userId, itemModel.getId());
            Map<String, Double> discountMap = new HashMap<>();
            friendDOS.stream().forEach(friendDO -> {
                UserModel user = userService.getUserById(friendDO.getFriendId());
                discountMap.put("用户："+ user.getName() , friendDO.getStatus());
            });
            decreaseVO.setDiscountMap(discountMap);
            decreaseVOS.add(decreaseVO);
        });
        return decreaseVOS;
    }




}
