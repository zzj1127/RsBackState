package com.zzj.course.dao;

import com.zzj.course.model.Type;

import java.util.List;

public interface TypeMapper {
    //查询所有
    public List<Type> findAllType();

    public void addtype(Type type);

    public void updatetype(Type type);
}
