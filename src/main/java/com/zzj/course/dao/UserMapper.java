package com.zzj.course.dao;
import com.zzj.course.model.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;


public interface UserMapper {
    //通过username查询
    public User userLogin(User user);
    //注册
    public void register(User user);
    //查重
    public User findUserByName(String username);
   //查找个人信息
    public User userSelectById(String userId);
//修改信息
   public void changeInformation(User user);

   public void resetpassword(User user);

  public List<User> findAllUser(int index);

   public int pagecount();

   public void delete(String userId);

   public List<User> findUser(String context);

   public List<User> findAllAdmin(int index);

   public int pagecountadmin();

   public void changeadmin(String userId);

   public List<User> findUserByUserState(String userState);

   public List<User> findusers();

   public int pagecountvisitor();

   public List<User> findAllvisitor(int index);

   public void changevisitor(String userId);
}
