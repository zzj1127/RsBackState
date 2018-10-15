package com.zzj.course.service.Impl;

import com.zzj.course.dao.TypeOfNameMapper;
import com.zzj.course.model.TypeOfName;
import com.zzj.course.service.TypeOfNameService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TypeOfNameServiceImp implements TypeOfNameService {
    @Autowired
    TypeOfNameMapper typeOfNameMapper;
    @Override
    public List<TypeOfName> findAllTON(){
        return typeOfNameMapper.findAllTON();
    }
    @Override
    public List<TypeOfName> selectTonById(String typeid){
        return typeOfNameMapper.selectTonById(typeid);
    }
    @Override
    public void changeTon(TypeOfName Ton){
        typeOfNameMapper.changeTon(Ton);
    }
    @Override
    public void addTon(TypeOfName Ton){
        typeOfNameMapper.addTon(Ton);
    }

}
