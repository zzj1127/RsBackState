package com.zzj.course.controller;

import com.zzj.course.model.*;
import com.zzj.course.service.ResourceService;
import com.zzj.course.service.TypeOfNameService;
import com.zzj.course.service.TypeService;
import com.zzj.course.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.*;

@Controller
public class ResourceController {
    @Autowired
    ResourceService resourceService;
    @Autowired
    TypeService typeService;
    @Autowired
    TypeOfNameService typeOfNameService;
    @Autowired
    UserService userService;

    @RequestMapping("/findAllResources")
    public String resourceList(Model model, HttpServletRequest request ) {
        int pageIndex = 1;//设置初始的当前页，页面显示的都是第一页
        int pageSize = 6;//设置每一页显示几条数据,用于计算总页数，此处设置的值必须与sql语句的limit最后的数值一样
        PageUtil<Resources> pageUtilRE = new PageUtil<Resources>();//初始化工具类
        List<Resources> list = new ArrayList<Resources>();
        if (request.getParameter("pageIndex") != null) {
            pageIndex = Integer.parseInt(request.getParameter("pageIndex"));
        }//对页面上的分页标签传的值,进行获取,也是就点击'上一页或者下一页'传过来的pageindex
        pageUtilRE.setPageIndex(pageIndex);//保存至工具类
        int number = resourceService.pagecountRE();//调用service层方法计算出总数据量，就是多少条数据.
        pageUtilRE.setPageNumber(number);//保存至工具类
        pageUtilRE.setPageSize(pageSize);//保存至工具类
        pageUtilRE.setPageCount((int) Math.ceil((double) (
                pageUtilRE.getPageNumber() / pageUtilRE.getPageSize())) + 1);//计算出总页数,并封装到工具类
        int index = (pageIndex - 1) * pageSize;//计算出每一页从数据库中第几条数据开始取值，也就是limit后面的第一个数字
        List<Resources> resourceList=resourceService.findAllResource(index);//调用service层的方法，取得数据库中的值
        pageUtilRE.setList(resourceList);//保存到工具类中的集合
        model.addAttribute("pageUtil", pageUtilRE);//传递到页面，存入值栈中
        List<Type> typeList=typeService.findAllType();
        List<TypeOfName> typeOfNames=typeOfNameService.findAllTON();

        model.addAttribute("typeList", typeList);
        model.addAttribute("typeOfNames", typeOfNames);
        model.addAttribute("resourceList",resourceList);

        return "design/resources";
    }
    @RequestMapping("/deleteRe")
    public String deleteRe(String reid){
        resourceService.deleteRe(reid);
        return "redirect:findAllResources";
    }
@RequestMapping("/addRe")
    public String  addre(Resources resources, MultipartFile file)throws IOException{
    //获取原来文件名
    String oldname = file.getOriginalFilename();
    //取随机名
    String newsstring = UUID.randomUUID().toString().replace("-", "");
    //获取文件格式
    String fix = oldname.substring(oldname.indexOf("."));
    //组成新的文件名
    String newName = newsstring + fix;

    //保持图片到本地图片服务器
    file.transferTo(new File("E:/resourcesImg/" + newName));
    resources.setReimg(newName);

    resourceService.addResource(resources);


        return "redirect:beforeAdd";
}
}
