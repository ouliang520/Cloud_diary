package com.ouliang.dao;

import com.ouliang.entity.User;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface UserDao {

    public User selectByUser(String userName, String userPwd);

    public int checkByNick(String nick);

    public int changeByNick(String userName, String nick, String mood, String head);
}
