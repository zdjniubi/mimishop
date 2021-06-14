package com.zdj.miaoshaproject.service;

import com.zdj.miaoshaproject.dataobject.CarRecord;
import com.zdj.miaoshaproject.error.BusinessException;

import java.util.List;

public interface CarService {
    CarRecord insertCarRecord(int userId, int itemId, int status, int count);
    void updateCarRecordStatus(int userId, int itemId, int status) throws BusinessException;
    List<CarRecord> getCarRecord(int userId);
    void delete(int carId);
    CarRecord getById(int id);
}
