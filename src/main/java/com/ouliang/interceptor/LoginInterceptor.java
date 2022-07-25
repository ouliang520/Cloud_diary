package com.ouliang.interceptor;

import com.ouliang.entity.User;
import com.ouliang.service.UserService;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
@Component
public class LoginInterceptor implements HandlerInterceptor {
    @Resource
    private UserService userService;
    @Override
    //目标方法执行之前
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        //登录检查逻辑
        HttpSession session= request.getSession();
        User user= (User) session.getAttribute("user");
        //免登录
        Cookie[] cookies= request.getCookies();
        if (cookies!=null){
            for (Cookie cookie:cookies){
                if ("userNP".equals(cookie.getName())){
                    String value=cookie.getValue();
                    String[] val=value.split("-");
                    String userName=val[0];
                    String userPwd=val[1];

                    User userCookice=userService.identifyUser(userName,userPwd);
                    session.setAttribute("user",userCookice);
                    response.sendRedirect("/index.jsp");
                }
            }
            if(null != user)
            {
                return true;
            }
        }

        response.sendRedirect("/login.jsp");
        return false;
    }

    @Override
    //目标方法执行以后
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
        HandlerInterceptor.super.postHandle(request, response, handler, modelAndView);
    }

    @Override
    //页面渲染之后
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
        HandlerInterceptor.super.afterCompletion(request, response, handler, ex);
    }
}
