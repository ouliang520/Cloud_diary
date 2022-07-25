package com.ouliang.controller;

import com.ouliang.entity.Type;
import com.ouliang.service.NodeTypeService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/type")
public class TypeController {
    @Resource
    private NodeTypeService nodeTypeService;

    @RequestMapping("")
    public String type(HttpServletRequest request){
        HttpSession session= request.getSession();
        session.setAttribute("changePage","static/info/type.jsp");
        return "redirect:/index.jsp";//重定向
    }
    //查询类型列表
    @RequestMapping("/servletAll")
    @ResponseBody
    public List<Type> servletAll(){
        List<Type> list= nodeTypeService.selectType();
        return list;
    }

    //删除类型(ajax)
    //注意,检测note表中是否存在该类型
    @RequestMapping("/delete")
    @ResponseBody
    public int deleteType(@RequestParam String typeId){
        int i=nodeTypeService.deleteByTypeId(typeId);
        return i;
    }

    //修改或删除(ajax)
    @RequestMapping("/addOrUpdate")
    @ResponseBody
    public int addOrUpdate(@RequestParam Map<String,String> map){
        int i=nodeTypeService.addOrUpdate(map);
        return i;
    }
}
