package com.ouliang.controller;

import com.ouliang.entity.Node;
import com.ouliang.entity.User;
import com.ouliang.service.MainService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/main")
public class mainController {
    @Resource
    private MainService mainService;
    //返回首页
    @RequestMapping("")
    public String jumpMain(HttpServletRequest request){
        HttpSession session= request.getSession();
        session.setAttribute("changePage","static/info/list.jsp");
        return "redirect:/index.jsp";//重定向
    }

    //获取列表(ajax)
    @RequestMapping("/selectList")
    @ResponseBody
    public List<Node> selectList(@RequestParam int page,HttpServletRequest request){
        //后续改表的话可以设置单一用户单一list
        User user= (User) request.getSession().getAttribute("user");
        //page 当前页数
        List<Node> list= mainService.selectAllList(page);
        return list;
    }

    //看查云记
    @RequestMapping("/selectNode")
    public String selectNode(@RequestParam String noteId,HttpServletRequest request){
        Node node= mainService.selectById(noteId);
        //查询类别
        String type=mainService.selectType(node.getTypeId());
        //设置云记页面(session)
        request.getSession().setAttribute("changePage","static/info/read.jsp");
        request.getSession().setAttribute("node",node);
        //设置类别信息
        request.getSession().setAttribute("type",type);
        return "redirect:/index.jsp";//重定向

    }

    //云记页码
    @RequestMapping("/selectListPage")
    @ResponseBody
    public int selectListPage(){
        int page=mainService.selectAllNum();

        return page;
    }



}
