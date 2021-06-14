package com.zdj.miaoshaproject.service.impl;

import com.zdj.miaoshaproject.dao.FriendDOMapper;
import com.zdj.miaoshaproject.dao.UserDOMapper;
import com.zdj.miaoshaproject.dataobject.FriendDO;
import com.zdj.miaoshaproject.dataobject.UserDO;
import com.zdj.miaoshaproject.service.FriendService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
@Service
public class FriendServiceImpl implements FriendService {

    @Autowired
    private FriendDOMapper friendDOMapper;
    @Autowired
    private UserDOMapper userMapper;


    @Override
    public List<UserDO> listFriends(int userId) {
        List<FriendDO> friends = friendDOMapper.selectByUserId(userId);
        if (friends.size() == 0) return null;
        List<UserDO> users = new ArrayList<>();
        friends.stream().forEach(f -> {
            UserDO userById = userMapper.selectByPrimaryKey(f.getFriendId());
            users.add(userById);
        });
        return users;
    }

    @Override
    public void addFriendRel(int userId, int friendId, double discount, int itemId) {
        FriendDO friendDO = new FriendDO();
        friendDO.setFriendId(friendId);
        friendDO.setUserId(userId);
        friendDO.setStatus(discount);
        friendDO.setItemId(itemId);
        friendDOMapper.insert(friendDO);
    }

    @Override
    public List<FriendDO> getByAll(int userId, int friendId) {
        return friendDOMapper.selectByUserIdFriendId(userId, friendId);
    }
}
