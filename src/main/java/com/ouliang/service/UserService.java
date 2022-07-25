package com.ouliang.service;



import com.ouliang.dao.UserDao;
import com.ouliang.entity.User;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
@Service
public class UserService {

    @Resource
    private UserDao userDao;

    public User identifyUser(String userName,String userPwd){
        User user=userDao.selectByUser(userName,userPwd);
        return user;
    }
}
