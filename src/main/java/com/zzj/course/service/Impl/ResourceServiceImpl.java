package com.zzj.course.service.Impl;

import com.zzj.course.dao.ResourceMapper;
import com.zzj.course.model.Resources;
import com.zzj.course.service.ResourceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ResourceServiceImpl implements ResourceService {
    @Autowired
    ResourceMapper resourceMapper;

    @Override
    public List<Resources> findAllResource(int index) {
        return resourceMapper.findAllResource(index);
    }
    @Override
    public int pagecountRE(){
      return   resourceMapper.pagecountRE();
    }
    @Override
    public void deleteRe(String reid){
        resourceMapper.deleteRe(reid);
    }
    @Override
    public List<Resources> findAllResources(){
       return resourceMapper.findAllResources();
    }
    @Override
    public void addResource(Resources resources){
       resourceMapper.addResource(resources);
    }
}