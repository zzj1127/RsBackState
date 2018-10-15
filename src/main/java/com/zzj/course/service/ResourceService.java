package com.zzj.course.service;

import com.zzj.course.model.Resources;

import java.util.List;

public interface ResourceService {
   public List<Resources> findAllResource(int index);

  public int pagecountRE();

   public void deleteRe(String reid);

   public List<Resources> findAllResources();

   public void addResource(Resources resources);
}
