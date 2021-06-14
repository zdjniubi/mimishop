package com.zdj.miaoshaproject.service;

import com.zdj.miaoshaproject.dataobject.FriendDO;
import com.zdj.miaoshaproject.dataobject.UserDO;

import java.util.List;

public interface FriendService {

    List<UserDO> listFriends(int userId);

    void addFriendRel(int userId, int friendId, double discount, int itemId);

    List<FriendDO> getByAll(int userId, int friendId);


}
