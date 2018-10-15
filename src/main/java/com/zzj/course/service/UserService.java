package com.zzj.course.service;


import com.zzj.course.model.User;

import java.util.List;

public interface UserService {
    //登录
    public User userLogin(User user);
    //注册
    public void register(User user);

    //修改信息
    public void changeInformation(User user);

    //修改密码
   public void resetpassword(User user);
    //查询所有的用户
    public  List<User> findAllUser( int index);

    public int pagecount();

   public void delete(String userId);

   public List<User> findUser(String context);

   public List<User> findAllAdmin(int index);

    public int pagecountadmin();

   public void changeadmin(String userId);

   public List<User> findUserByUserState( String userState);

   public List<User> findusers();

   public int pagecountvisitor();

   public List<User> findAllvisitor(int index);

   public void changevisitor(String userId);
}
