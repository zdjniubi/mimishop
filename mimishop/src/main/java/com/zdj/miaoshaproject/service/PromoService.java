package com.zdj.miaoshaproject.service;

import com.zdj.miaoshaproject.dataobject.PromoDO;
import com.zdj.miaoshaproject.service.model.PromoModel;

import java.util.List;


public interface PromoService {
    //根据itemid获取即将进行的或正在进行的秒杀活动
    PromoModel getPromoByItemId(Integer itemId);

    //活动发布
    void publishPromo(Integer promoId);

    //活动删除
    void deletePromo(Integer promoId);

    //创建活动
    void createPromo(PromoDO promoDO);
    //活动列表
    List<PromoModel> listPromo();
    //生成秒杀用的令牌
    String generateSecondKillToken(Integer promoId,Integer itemId,Integer userId);
}
