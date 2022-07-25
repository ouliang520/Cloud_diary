package com.ouliang.service;

import com.ouliang.dao.UserDao;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Map;

@Service
public class PersonalService {
    @Resource
    private UserDao userDao;
    public int checkNick(String nick) {
        Integer i=userDao.checkByNick(nick);
        return i;
    }

    public int changePersonal(Map<String, String> map) {

        int i= userDao.changeByNick(map.get("userName"),map.get("nick"),map.get("mood"),map.get("head"));

        return i;
    }
}
