package com.zzj.course.service;

import com.zzj.course.model.Comment;
import com.zzj.course.model.TypeOfName;

import java.util.List;

public interface TypeOfNameService {
    public List<TypeOfName> findAllTON();

   public List<TypeOfName> selectTonById(String typeid);

   public void changeTon(TypeOfName Ton);

   public void addTon(TypeOfName Ton);
}
