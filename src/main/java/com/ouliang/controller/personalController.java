package com.ouliang.controller;


import com.fasterxml.jackson.databind.util.JSONPObject;
import com.ouliang.entity.User;
import com.ouliang.service.PersonalService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.*;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/personal")
public class personalController {
    @Resource
    private PersonalService personalService;
    //页面跳转
    @RequestMapping("")
    public String jumpPersonal(HttpServletRequest request){
        HttpSession session= request.getSession();
        session.setAttribute("changePage","static/info/personal.jsp");
        return "index";
    }

    //信息修改
    @RequestMapping("/change")
    public String changePersonal(@RequestParam("img") MultipartFile multipartFile, @RequestParam Map<String, String> map,HttpServletRequest request){
        //文件上传
        OutputStream os = null;
        InputStream inputStream = null;
        String fileName = null;//文件名以及后缀
        try {
            inputStream = multipartFile.getInputStream();
            fileName = multipartFile.getOriginalFilename();
        } catch (IOException e) {
            e.printStackTrace();
        }
        if (!multipartFile.isEmpty())
        try {
            String path = request.getServletContext().getRealPath("/static/images/");//存放图片路径
            // 2、保存到临时文件
            // 1K的数据缓冲
            byte[] bs = new byte[1024];
            // 读取到的数据长度
            int len;
            // 输出的文件流保存到本地文件
            File tempFile = new File(path);
            if (!tempFile.exists()) {
                tempFile.mkdirs();
            }
            os = new FileOutputStream(tempFile.getPath() + File.separator + fileName);
            // 开始读取
            while ((len = inputStream.read(bs)) != -1) {
                os.write(bs, 0, len);
            }
        } catch (IOException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // 完毕，关闭所有链接
            if (os!=null){
                try {
                    os.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
            if (inputStream!=null){
                try {
                    inputStream.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }


        }
        User user= (User) request.getSession().getAttribute("user");
        map.put("userName",user.getUserName());
        int i=0;
        if (fileName==null){
            i=personalService.changePersonal(map);
        }else {
            map.put("head",fileName);
            i=personalService.changePersonal(map);
        }
        if (i==1){
            request.getSession().setAttribute("news","更改成功");
        }else {
            request.getSession().setAttribute("news","更改失败");
        }
        System.out.println(i);


        return "redirect:/index.jsp";//重定向
    }
    //检查昵称是否存在(ajax)
    @RequestMapping("/cheek")
    @ResponseBody
    public Map<String, String> cheekPersonal(@RequestParam("nick") String nick){
        nick.equals(null);
        int i = personalService.checkNick(nick);
        Map<String,String> map=new HashMap<>();
        map.put("code",i+"");
        return map;
    }

}
