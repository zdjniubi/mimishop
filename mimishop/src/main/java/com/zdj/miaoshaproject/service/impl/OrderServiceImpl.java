package com.zdj.miaoshaproject.service.impl;

import com.zdj.miaoshaproject.controller.viewobject.OrderVO;
import com.zdj.miaoshaproject.dao.*;
import com.zdj.miaoshaproject.dataobject.*;
import com.zdj.miaoshaproject.error.BusinessException;
import com.zdj.miaoshaproject.error.EmBusinessError;
import com.zdj.miaoshaproject.service.ItemService;
import com.zdj.miaoshaproject.service.OrderService;
import com.zdj.miaoshaproject.service.UserService;
import com.zdj.miaoshaproject.service.model.ItemModel;
import com.zdj.miaoshaproject.service.model.OrderModel;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;


@Service
public class OrderServiceImpl implements OrderService {

    @Autowired
    private SequenceDOMapper sequenceDOMapper;

    @Autowired
    private ItemService itemService;

    @Autowired
    private UserService userService;

    @Autowired
    private OrderDOMapper orderDOMapper;

    @Autowired
    private StockLogDOMapper stockLogDOMapper;

    @Autowired
    private DecreaseLogMapper decreaseLogMapper;

    @Autowired
    private OrderDiscountRelMapper orderDiscountRelMapper;



    @Override
    @Transactional
    public OrderModel createOrder(Integer userId, Integer itemId, Integer promoId, Integer amount, String stockLogId) throws BusinessException {
        //1.校验下单状态,下单的商品是否存在，用户是否合法，购买数量是否正确
        //ItemModel itemModel = itemService.getItemById(itemId);
        ItemModel itemModel = itemService.getItemByIdInCache(itemId);
        if(itemModel == null){
            throw new BusinessException(EmBusinessError.PARAMETER_VALIDATION_ERROR,"商品信息不存在");
        }

//
//        UserModel userModel = userService.getUserByIdInCache(userId);
//        if(userModel == null){
//            throw new BusinessException(EmBusinessError.PARAMETER_VALIDATION_ERROR,"用户信息不存在");
//        }
        if(amount <= 0 || amount > 99){
            throw new BusinessException(EmBusinessError.PARAMETER_VALIDATION_ERROR,"数量信息不正确");
        }


        //2.落单减库存
        boolean result = itemService.decreaseStock(itemId,amount);
        if(!result){
            throw new BusinessException(EmBusinessError.STOCK_NOT_ENOUGH);
        }

        //3.订单入库
        OrderModel orderModel = new OrderModel();
        orderModel.setUserId(userId);
        orderModel.setItemId(itemId);
        orderModel.setAmount(amount);

        // 扣除砍价的价格
        BigDecimal discount = new BigDecimal(0);
        DecreaseLog decreaseLog = decreaseLogMapper.selectByUserIdItemId(userId, itemId);
        int primaryKey = 0;
        OrderDiscountRel orderDiscountRel = new OrderDiscountRel();
        if (decreaseLog != null) {
            primaryKey = decreaseLog.getId();
            discount = BigDecimal.valueOf(decreaseLog.getDiscount());
        }

        if(promoId != null){
            orderModel.setItemPrice(itemModel.getPromoModel().getPromoItemPrice());
        }else{
            orderModel.setItemPrice(itemModel.getPrice());
        }
        orderModel.setPromoId(promoId);
        orderModel.setOrderPrice(orderModel.getItemPrice().multiply(new BigDecimal(amount)).subtract(discount));

        //生成交易流水号,订单号
        orderModel.setId(generateOrderNo());
        OrderDO orderDO = convertFromOrderModel(orderModel);
        orderDiscountRel.setOrderId(orderModel.getId());
        orderDiscountRel.setDiscount(discount.doubleValue());
        orderDiscountRelMapper.insert(orderDiscountRel);
        if (decreaseLog != null) {
            decreaseLogMapper.deleteByPrimaryKey(primaryKey);
        }
        orderDOMapper.insertSelective(orderDO);

        //加上商品的销量
        itemService.increaseSales(itemId,amount);

        //设置库存流水状态为成功
        StockLogDO stockLogDO = stockLogDOMapper.selectByPrimaryKey(stockLogId);
        if(stockLogDO == null){
            throw new BusinessException(EmBusinessError.UNKNOWN_ERROR);
        }
        stockLogDO.setStatus(2);
        stockLogDOMapper.updateByPrimaryKeySelective(stockLogDO);





        //4.返回前端
        return orderModel;
    }

    @Override
    public List<OrderVO> getOrder(int userId) {
        List<OrderDO> orderDOS = orderDOMapper.selectByUserId(userId);
        List<OrderVO> res = new ArrayList<>();
        orderDOS.stream().forEach(orderDO -> {
            OrderVO orderVO = new OrderVO();
            orderVO.setAmount(orderDO.getAmount());
            orderVO.setId(orderDO.getId());
            orderVO.setItemId(orderDO.getItemId());
            orderVO.setOrderPrice(orderDO.getOrderPrice());
            ItemModel itemById = itemService.getItemById(orderDO.getItemId());
            OrderDiscountRel orderDiscountRel = orderDiscountRelMapper.selectByOrderId((orderDO.getId()));
            if (orderDiscountRel != null) {
                orderVO.setDiscount(orderDiscountRel.getDiscount());
            }
            if (itemById != null) {
                orderVO.setItemImg(itemById.getImgUrl());
                orderVO.setItemPrice(itemById.getPrice().doubleValue());
                orderVO.setItemName(itemById.getTitle());
                if (itemById.getPromoModel() != null) {
                    orderVO.setPromoName(itemById.getPromoModel().getPromoName());
                    orderVO.setItemPrice(itemById.getPromoModel().getPromoItemPrice().doubleValue());
                }
            }
            res.add(orderVO);
        });
        return res;
    }


    @Transactional(propagation = Propagation.REQUIRES_NEW)
    private String generateOrderNo(){
        //订单号有16位
        StringBuilder stringBuilder = new StringBuilder();
        //前8位为时间信息，年月日
        LocalDateTime now = LocalDateTime.now();
        String nowDate = now.format(DateTimeFormatter.ISO_DATE).replace("-","");
        stringBuilder.append(nowDate);

        //中间6位为自增序列
        //获取当前sequence
        int sequence = 0;
        SequenceDO sequenceDO =  sequenceDOMapper.getSequenceByName("order_info");
        sequence = sequenceDO.getCurrentValue();
        sequenceDO.setCurrentValue(sequenceDO.getCurrentValue() + sequenceDO.getStep());
        sequenceDOMapper.updateByPrimaryKeySelective(sequenceDO);
        String sequenceStr = String.valueOf(sequence);
        for(int i = 0; i < 6-sequenceStr.length();i++){
            stringBuilder.append(0);
        }
        stringBuilder.append(sequenceStr);


        //最后2位为分库分表位,暂时写死
        stringBuilder.append("00");

        return stringBuilder.toString();
    }
    private OrderDO convertFromOrderModel(OrderModel orderModel){
        if(orderModel == null){
            return null;
        }
        OrderDO orderDO = new OrderDO();
        BeanUtils.copyProperties(orderModel,orderDO);
        orderDO.setItemPrice(orderModel.getItemPrice().doubleValue());
        orderDO.setOrderPrice(orderModel.getOrderPrice().doubleValue());
        return orderDO;
    }
}
