package com.zdj.miaoshaproject.work;

import com.zdj.miaoshaproject.dao.ItemStockDOMapper;
import com.zdj.miaoshaproject.dataobject.ItemStockDO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public class SyncStock {

    @Autowired
    private ItemStockDOMapper itemStockDOMapper;

    @Autowired
    private RedisTemplate redisTemplate;
    @Scheduled(cron = "0 */1 * * * ?")
    public void sync() {
        List<ItemStockDO> itemStockDOS = itemStockDOMapper.selectAll();
        itemStockDOS.stream().forEach(itemStockDO -> {
            redisTemplate.opsForValue().set("promo_item_stock_"+itemStockDO.getItemId(), itemStockDO.getStock());

        });

    }
}
