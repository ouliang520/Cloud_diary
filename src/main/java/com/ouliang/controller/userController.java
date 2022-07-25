package com.ouliang.controller;

import com.ouliang.entity.User;
import com.ouliang.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.util.DigestUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.Map;

@Controller
public class userController {
    @Resource
    private UserService userService;
    //用户登录
    @RequestMapping("/user")
    public String UserLogin(@RequestParam Map<String, String> map, HttpServletRequest request,HttpServletResponse response){
        String userName=map.get("userName");
        String userPwd=map.get("userPwd");

        String userPwd1 = DigestUtils.md5DigestAsHex(userPwd.getBytes());//md5加密
        if(!(userName.equals("")||userPwd.equals(""))) {
            User user = userService.identifyUser(userName, userPwd1);
            //判断是否登录成功
            if (user!=null){
                String rem=request.getParameter("rem");
                //是否记住密码
                if ("1".equals(rem)){
                    Cookie cookie=new Cookie("userNP",userName +"-" +userPwd);
                    //设置失效时间
                    cookie.setMaxAge(3*24*60*60);
                    //响应给客户端
                    response.addCookie(cookie);
                }else{
                    Cookie cookie=new Cookie("userNP",null);
                    cookie.setMaxAge(0);
                    response.addCookie(cookie);
                }

                HttpSession session=request.getSession();
                session.setAttribute("user",user);
                //设置默认主页
                session.setAttribute("changePage", "static/info/list.jsp");
                //设置默认主页页数为第一页
                session.setAttribute("page","1");
            //登录失败
            }else {
                request.setAttribute("Msg","账号或密码错误");
                request.setAttribute("userName",userName);
//                return "redirect:/login.jsp";//重定向
                return "login";
            }
        }
        return "redirect:/index.jsp";//重定向
    }
    //用户退出
    @RequestMapping("/logout")
    public String UserExit(HttpServletRequest request,HttpServletResponse response){
        request.getSession().invalidate();//删除session对象
        Cookie cookie=new Cookie("userNP",null);
        cookie.setMaxAge(0);
        response.addCookie(cookie);
        return "redirect:/login.jsp";//重定向
    }
}
