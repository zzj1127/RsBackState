package com.zzj.course.dao;

import com.zzj.course.model.TypeOfName;

import java.util.List;

public interface TypeOfNameMapper {
    //查询所有
   public List<TypeOfName> findAllTON();

   public  List<TypeOfName> selectTonById(String typeid);

   public void changeTon(TypeOfName ton);

   public void addTon(TypeOfName ton);
}
