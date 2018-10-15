package com.zzj.course.service.Impl;

import com.zzj.course.dao.UserMapper;

import com.zzj.course.model.User;
import com.zzj.course.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    UserMapper userMapper;
    @Override
    public User userLogin(User user){
            return userMapper.userLogin(user);
    }
    @Override
    public void register(User user){
           userMapper.register(user);
    }
   @Override
    public void changeInformation(User user){
        userMapper.changeInformation(user);
    }
    @Override
    public void resetpassword(User user){
        userMapper.resetpassword(user) ;
    }
    @Override
    public List<User> findAllUser(int index){
        return userMapper.findAllUser(index);
    }
    @Override
    public int pagecount(){
        return userMapper.pagecount();
    }
    @Override
    public void delete(String userId){
        userMapper.delete(userId);
    }
    @Override
    public List<User> findUser(String context){
       return userMapper.findUser(context);
    }

    @Override
    public List<User> findAllAdmin(int index){
        return userMapper.findAllAdmin(index);
    }
    @Override
    public int pagecountadmin(){
        return userMapper.pagecountadmin();
    }
    @Override
    public void changeadmin(String userId){
        userMapper.changeadmin(userId);
    }
    @Override
    public List<User> findUserByUserState(String userState){
        return userMapper.findUserByUserState(userState);
    }
    @Override
    public List<User> findusers(){
       return userMapper.findusers();
    }
    @Override
    public int pagecountvisitor(){
        return userMapper.pagecountvisitor();
    }
    @Override
    public List<User> findAllvisitor(int index){
        return  userMapper.findAllvisitor(index);
    }
    @Override
    public void changevisitor(String userId){
        userMapper.changevisitor(userId);
    }

}
