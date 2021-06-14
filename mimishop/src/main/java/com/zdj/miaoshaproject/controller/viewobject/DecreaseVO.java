package com.zdj.miaoshaproject.controller.viewobject;

import java.util.Map;

public class DecreaseVO {
    int itemId;

    String itemImg;

    double itemOriginalPrice;

    double nowPrice;

    double discount;

    String title;
   // key : user value : 打折数目
    Map<String, Double> discountMap;

    public double getDiscount() {
        return discount;
    }

    public void setDiscount(double discount) {
        this.discount = discount;
    }

    public int getItemId() {
        return itemId;
    }

    public void setItemId(int itemId) {
        this.itemId = itemId;
    }

    public String getItemImg() {
        return itemImg;
    }

    public void setItemImg(String itemImg) {
        this.itemImg = itemImg;
    }

    public double getItemOriginalPrice() {
        return itemOriginalPrice;
    }

    public void setItemOriginalPrice(double itemOriginalPrice) {
        this.itemOriginalPrice = itemOriginalPrice;
    }

    public double getNowPrice() {
        return nowPrice;
    }

    public void setNowPrice(double nowPrice) {
        this.nowPrice = nowPrice;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Map<String, Double> getDiscountMap() {
        return discountMap;
    }

    public void setDiscountMap(Map<String, Double> discountMap) {
        this.discountMap = discountMap;
    }
}
