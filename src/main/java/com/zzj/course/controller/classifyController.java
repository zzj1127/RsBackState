package com.zzj.course.controller;


import com.zzj.course.model.Type;
import com.zzj.course.model.TypeOfName;
import com.zzj.course.service.TypeOfNameService;
import com.zzj.course.service.TypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
public class classifyController {
    @Autowired
    TypeService typeService;
    @Autowired
    TypeOfNameService typeOfNameService;
    @RequestMapping("/findAllClassify")
    public String findAllClassify(Model model){
        List<Type> typeList=typeService.findAllType();
        List<TypeOfName> typeOfNameList=typeOfNameService.findAllTON();
        model.addAttribute("typeList",typeList);
        model.addAttribute("typeOfNameList",typeOfNameList);
        return "design/classify";
    }
    @RequestMapping("/changeTon")
    public String changeTon(TypeOfName Ton){
        typeOfNameService.changeTon(Ton);
    return "redirect:findAllClassify";
    }
    @RequestMapping("/addTon")
    public  String addTon(TypeOfName Ton){
        typeOfNameService.addTon(Ton);
        return "redirect:findAllClassify";
    }
    @RequestMapping("/addtype")
    public  String addtype(Type type){
        typeService.addtype(type);
        return "redirect:findAllClassify";

    }

    @RequestMapping("/updatetype")
    public  String updatetype(Type type){
        typeService.updatetype(type);
        return "redirect:findAllClassify";

    }
    @RequestMapping("/beforeAdd")
    public  String beforeAdd(Model model){
        List<Type> typeList=typeService.findAllType();
        List<TypeOfName> typeOfNameList=typeOfNameService.findAllTON();
        model.addAttribute("typeList",typeList);
        model.addAttribute("typeOfNameList",typeOfNameList);
        return "design/addRE";

    }
}
