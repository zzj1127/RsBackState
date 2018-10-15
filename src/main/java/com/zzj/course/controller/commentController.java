package com.zzj.course.controller;

import com.zzj.course.model.Comment;
import com.zzj.course.model.PageUtil;
import com.zzj.course.model.Resources;
import com.zzj.course.model.User;
import com.zzj.course.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

@Controller
public class commentController {
    @Autowired
    CommentService commentService;
    @Autowired
    ResourceService resourceService;
    @Autowired
    TypeService typeService;
    @Autowired
    TypeOfNameService typeOfNameService;
    @Autowired
    UserService userService;
    @RequestMapping("/findAllComnment")
    public String findAllComnment(Model model, HttpServletRequest request){
        int pageIndex = 1;//设置初始的当前页，页面显示的都是第一页
        int pageSize = 6;//设置每一页显示几条数据,用于计算总页数，此处设置的值必须与sql语句的limit最后的数值一样
        PageUtil<Comment> pageUtilCM = new PageUtil<Comment>();//初始化工具类
        List<Comment> list = new ArrayList<Comment>();
        if (request.getParameter("pageIndex") != null) {
            pageIndex = Integer.parseInt(request.getParameter("pageIndex"));
        }//对页面上的分页标签传的值,进行获取,也是就点击'上一页或者下一页'传过来的pageindex
        pageUtilCM.setPageIndex(pageIndex);//保存至工具类
        int number =commentService.pagecount();//调用service层方法计算出总数据量，就是多少条数据.
        pageUtilCM.setPageNumber(number);//保存至工具类
        pageUtilCM.setPageSize(pageSize);//保存至工具类
        pageUtilCM.setPageCount((int) Math.ceil((double) (
                pageUtilCM.getPageNumber() / pageUtilCM.getPageSize())) + 1);//计算出总页数,并封装到工具类
        int index = (pageIndex - 1) * pageSize;//计算出每一页从数据库中第几条数据开始取值，也就是limit后面的第一个数字
        List<Comment> commentList=commentService.findAllComment(index);//调用service层的方法，取得数据库中的值
        pageUtilCM.setList(commentList);//保存到工具类中的集合
        List<User> userList=userService.findusers();
        List<Resources> resourcesList=resourceService.findAllResources();
        model.addAttribute("userList",userList);
        model.addAttribute("resourcesList",resourcesList);
        model.addAttribute("pageUtil", pageUtilCM);//传递到页面，
        model.addAttribute("commtlist",commentList);
        return  "/design/comment";
    }
    @RequestMapping("/deleteComnment")
    public String deleteComnment(String commentid){
        commentService.deletecommentid(commentid);
        return "redirect:findAllComnment";
    }

}
