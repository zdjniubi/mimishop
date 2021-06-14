package com.zdj.miaoshaproject.service.impl;

import com.zdj.miaoshaproject.dao.CarRecordMapper;
import com.zdj.miaoshaproject.dataobject.CarRecord;
import com.zdj.miaoshaproject.error.BusinessException;
import com.zdj.miaoshaproject.error.EmBusinessError;
import com.zdj.miaoshaproject.service.CarService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CarServiceImpl implements CarService {

    @Autowired
    private CarRecordMapper carRecordMapper;

    @Override
    public CarRecord insertCarRecord(int userId, int itemId, int status, int count) {
        CarRecord carRecord = new CarRecord();
        carRecord.setItemId(itemId);
        carRecord.setUid(userId);
        carRecord.setStatus(status);
        carRecord.setCount(count);
        List<CarRecord> carRecords = carRecordMapper.selectByUserIdItemId(carRecord.getUid(), carRecord.getItemId());

        if (carRecords.size() != 0) {
            carRecord.setCount(carRecords.get(0).getCount() + count);
            carRecord.setId(carRecords.get(0).getId());
            carRecordMapper.updateByPrimaryKey(carRecord);

        } else {
            carRecordMapper.insertSelective(carRecord);
        }
        return carRecord;
    }

    @Override
    public void updateCarRecordStatus(int userId, int itemId, int status) throws BusinessException {
        CarRecord carRecord = new CarRecord();
        carRecord.setStatus(status);
        carRecord.setUid(userId);
        carRecord.setItemId(itemId);
        if (carRecordMapper.updateByUserIdItemId(carRecord.getUid(), carRecord.getItemId()) == 0) {
            throw new BusinessException(EmBusinessError.PARAMETER_VALIDATION_ERROR,"加购物车失败");
        }
    }

    @Override
    public List<CarRecord> getCarRecord(int userId) {
        return carRecordMapper.selectByUserId(userId);
    }

    @Override
    public void delete(int carId) {
        carRecordMapper.deleteByPrimaryKey(carId);
    }

    @Override
    public CarRecord getById(int id) {
        return carRecordMapper.selectByPrimaryKey(id);
    }
}
