package com.zzj.course.controller;


import com.zzj.course.model.PageUtil;
import com.zzj.course.model.User;
import com.zzj.course.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.jws.WebParam;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@Controller
public class UserController {
    @Autowired
    UserService userService;

    //登录
    @RequestMapping("/login")
    public String login(User user, Model model, HttpServletRequest request) {
        User user1 = userService.userLogin(user);

        if (user1 != null) {
            if ((user1.getUserState()) == 3 || (user1.getUserState()) == 2) {
                request.getSession().setAttribute("user1", user1);

                return "index";
            } else if ((user1.getUserState()) == 0) {

                model.addAttribute("msg", "您还不是管理员");
                return "index";
            } else {

                model.addAttribute("msg", "这是后台界面,请前往<a href='http://ntzj126.cn/'>用户界面</a>");
                return "index";
            }
        } else {
            model.addAttribute("msg", "这是后台界面,请前往<a href='http://ntzj126.cn/'>用户界面</a>");
            return "index";
        }

    }

    //退出
    @RequestMapping("/exit")
    public String exit(HttpServletRequest request) {
        request.getSession().invalidate();
        return "index";
    }

    //查询所有用户
    @RequestMapping("/findAllUsers")
    public String findAllUsers(Model model, HttpServletRequest request) {
        int pageIndex = 1;//设置初始的当前页，页面显示的都是第一页
        int pageSize = 6;//设置每一页显示几条数据,用于计算总页数，此处设置的值必须与sql语句的limit最后的数值一样
        PageUtil<User> pageUtil = new PageUtil<User>();//初始化工具类
        List<User> list = new ArrayList<User>();
        if (request.getParameter("pageIndex") != null) {
            pageIndex = Integer.parseInt(request.getParameter("pageIndex"));
        }//对页面上的分页标签传的值,进行获取,也是就点击'上一页或者下一页'传过来的pageindex
        pageUtil.setPageIndex(pageIndex);//保存至工具类
        int number = userService.pagecount();//调用service层方法计算出总数据量，就是多少条数据.
        pageUtil.setPageNumber(number);//保存至工具类
        pageUtil.setPageSize(pageSize);//保存至工具类
        pageUtil.setPageCount((int) Math.ceil((double) (pageUtil
                .getPageNumber() / pageUtil.getPageSize())) + 1);//计算出总页数,并封装到工具类
        int index = (pageIndex - 1) * pageSize;//计算出每一页从数据库中第几条数据开始取值，也就是limit后面的第一个数字
        List<User> userList = userService.findAllUser(index);//调用service层的方法，取得数据库中的值
        pageUtil.setList(userList);//保存到工具类中的集合
        model.addAttribute("pageUtil", pageUtil);//传递到页面，存入值栈中
        model.addAttribute("userList", userList);
        return "/design/user";
    }

    //所有用户里的查询
    @RequestMapping("/findUser")
    public String findUser(String context, Model model) {
        List<User> userList = userService.findUser(context);//调用service层的方法，取得数据库中的值

        model.addAttribute("userList", userList);
        return "/design/user";
    }

    @RequestMapping("/changeUserInfo")
    public String changeUserInfo(User user) {
        System.out.println(user.getUserId());
        userService.changeInformation(user);
        return "redirect:findAllUsers";
    }

    @RequestMapping("/register")
    public String register(User user, Model model) {
        user.setUserimg("logo.jpg");
        userService.register(user);
        return "redirect:findAllUsers";
    }

    @RequestMapping("/delete")
    public String delete(String userId) {
        System.out.println(userId);
        userService.delete(userId);
        return "redirect:findAllUsers";
    }

    @RequestMapping("/reset")
    public String reset(User user, Model model) {

        userService.resetpassword(user);

        return "redirect:exit";
    }

    @RequestMapping("/findAllAdmin")
    public String findAllAdmin(Model model, HttpServletRequest request) {
        int pageIndex = 1;//设置初始的当前页，页面显示的都是第一页
        int pageSize = 6;//设置每一页显示几条数据,用于计算总页数，此处设置的值必须与sql语句的limit最后的数值一样
        PageUtil<User> pageUtilAdmin = new PageUtil<User>();//初始化工具类
        List<User> list = new ArrayList<User>();
        if (request.getParameter("pageIndex") != null) {
            pageIndex = Integer.parseInt(request.getParameter("pageIndex"));
        }//对页面上的分页标签传的值,进行获取,也是就点击'上一页或者下一页'传过来的pageindex
        pageUtilAdmin.setPageIndex(pageIndex);//保存至工具类
        int number = userService.pagecountadmin();//调用service层方法计算出总数据量，就是多少条数据.
        pageUtilAdmin.setPageNumber(number);//保存至工具类
        pageUtilAdmin.setPageSize(pageSize);//保存至工具类
        pageUtilAdmin.setPageCount((int) Math.ceil((double) (
                pageUtilAdmin.getPageNumber() / pageUtilAdmin.getPageSize())) + 1);//计算出总页数,并封装到工具类
        int index = (pageIndex - 1) * pageSize;//计算出每一页从数据库中第几条数据开始取值，也就是limit后面的第一个数字
        List<User> userList1 = userService.findAllAdmin(index);//调用service层的方法，取得数据库中的值
        pageUtilAdmin.setList(userList1);//保存到工具类中的集合
        model.addAttribute("pageUtil", pageUtilAdmin);//传递到页面，存入值栈中
        model.addAttribute("userList", userList1);
        return "/design/admin";
    }

    @RequestMapping("/changeadmin")
    public String changeadmin(String userId) {
        userService.changeadmin(userId);
        return "redirect:findAllAdmin";
    }


    @RequestMapping("/selectAdmin")
    public String selectAdmin(String userState, Model model) {
        List<User> userListByState = userService.findUserByUserState(userState);
        model.addAttribute("userList", userListByState);
        return "/design/adminlist";
    }
    @RequestMapping("/findvisitor")
    public String findvisitor(Model model, HttpServletRequest request){
        int pageIndex = 1;//设置初始的当前页，页面显示的都是第一页
        int pageSize = 6;//设置每一页显示几条数据,用于计算总页数，此处设置的值必须与sql语句的limit最后的数值一样
        PageUtil<User> pageUtilv = new PageUtil<User>();//初始化工具类
        List<User> list = new ArrayList<User>();
        if (request.getParameter("pageIndex") != null) {
            pageIndex = Integer.parseInt(request.getParameter("pageIndex"));
        }//对页面上的分页标签传的值,进行获取,也是就点击'上一页或者下一页'传过来的pageindex
        pageUtilv.setPageIndex(pageIndex);//保存至工具类
        int number = userService.pagecountvisitor();//调用service层方法计算出总数据量，就是多少条数据.
        System.out.println(number);
        pageUtilv.setPageNumber(number);//保存至工具类
        pageUtilv.setPageSize(pageSize);//保存至工具类
        pageUtilv.setPageCount((int) Math.ceil((double) (
                pageUtilv.getPageNumber() / pageUtilv.getPageSize())) + 1);//计算出总页数,并封装到工具类
        int index = (pageIndex - 1) * pageSize;//计算出每一页从数据库中第几条数据开始取值，也就是limit后面的第一个数字
       System.out.println(index);
        List<User> userList1 = userService.findAllvisitor(index);//调用service层的方法，取得数据库中的值
        pageUtilv.setList(userList1);//保存到工具类中的集合
        model.addAttribute("pageUtil", pageUtilv);//传递到页面，存入值栈中
        model.addAttribute("userList", userList1);
        return "/design/visitor";
    }
    @RequestMapping("/changevisitor")
    public String changevisitor(String userId) {
        userService.changevisitor(userId);
        return "redirect:findvisitor";
    }
}