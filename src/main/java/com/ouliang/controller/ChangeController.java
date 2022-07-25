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
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/change")
public class ChangeController {
    @Resource
    private NodeTypeService nodeTypeService;

    @RequestMapping("")
    public String change(HttpServletRequest request){
        HttpSession session= request.getSession();
        session.setAttribute("changePage","static/info/change.jsp");
        return "redirect:/index.jsp";//重定向
    }

    @RequestMapping("/selectType")
    @ResponseBody
    public List<Type> selectType(){
        List<Type> list= nodeTypeService.selectType();
        return list;
    }
    //修改云记
    @RequestMapping("/changeNode")
    public String changeNode(@RequestParam Map<String,String> map,HttpServletRequest request){
        //拼接标签
        int i=nodeTypeService.changeNode(map);
        //设置云记页面(session)
        request.getSession().setAttribute("changePage","static/info/read.jsp");
        return "redirect:/index.jsp";
    }

    //增加云记页面
    @RequestMapping("/addNode")
    public String addNode(HttpServletRequest request){
        HttpSession session= request.getSession();
        session.setAttribute("changePage","static/info/add.jsp");
        return "redirect:/index.jsp";//重定向
    }

    //添加云记
    @RequestMapping("/add")
    public String add(@RequestParam Map<String,String> map,HttpServletRequest request){
        Date date=new Date();
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        System.out.println(formatter.format(date));
        map.put("pubTime",formatter.format(date));
        int i= nodeTypeService.addNote(map);
        //设置云记页面(session)
        request.getSession().setAttribute("changePage","static/info/list.jsp");
        return "redirect:/index.jsp";
    }

    //删除云记(ajax)
        @RequestMapping("/delete")
        @ResponseBody
        public int deleteNote(@RequestParam String noteId){
            int i=nodeTypeService.deleteNodeById(noteId);
            return i;
        }
}
