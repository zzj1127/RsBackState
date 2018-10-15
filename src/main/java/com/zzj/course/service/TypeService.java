package com.zzj.course.service;

import com.zzj.course.model.Type;

import java.util.List;

public interface TypeService {
  public  List<Type> findAllType();

   public void addtype(Type type);

   public void updatetype(Type type);
}
