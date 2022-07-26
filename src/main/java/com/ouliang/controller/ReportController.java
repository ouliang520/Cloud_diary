package com.ouliang.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/report")
public class ReportController {
    @RequestMapping("")
    public String report(HttpServletRequest request){
        //设置云记页面(session)
        request.getSession().setAttribute("changePage","static/info/report.jsp");
        return "redirect:/index.jsp";//重定向
    }
}
