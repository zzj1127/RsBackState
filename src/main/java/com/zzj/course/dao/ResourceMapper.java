package com.zzj.course.dao;

import com.zzj.course.model.Resources;

import java.util.List;

public interface ResourceMapper {
    //查询所有resource
    public List<Resources> findAllResource(int index);
    //通过id查询resource信息
    public Resources findResourceById(String reid);

    public List<Resources> selectTonById(String typeofnameid);

    public List<Resources> selectTypeId(String typeid);

    public void addResource(Resources resources);

    public List<Resources> findAllResourceBySeacher(String seacher);

    public int pagecountRE();

  public void deleteRe(String reid);

   public List<Resources> findAllResources();
}
