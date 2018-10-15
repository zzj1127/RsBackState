package com.zzj.course.service.Impl;

import com.zzj.course.dao.TypeMapper;
import com.zzj.course.model.Type;
import com.zzj.course.service.TypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TypeServiceImpl implements TypeService {
    @Autowired
    TypeMapper typeMapper;
   @Override
   public List<Type>  findAllType(){
        return typeMapper .findAllType();

    }
    @Override
    public void addtype(Type type){
      typeMapper.addtype(type);
    }
    @Override
    public void updatetype(Type type){
        typeMapper.updatetype(type);
    }

}
