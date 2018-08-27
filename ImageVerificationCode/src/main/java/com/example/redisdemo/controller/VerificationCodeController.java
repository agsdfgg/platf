package com.example.redisdemo.controller;

import com.example.redisdemo.server.SecurityCodeCreater;
import com.sun.image.codec.jpeg.JPEGCodec;
import com.sun.image.codec.jpeg.JPEGImageEncoder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.web.servlet.server.Session;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.ByteArrayOutputStream;
import java.io.IOException;

@RestController
public class VerificationCodeController {
    @Autowired
    SecurityCodeCreater securityCodeCreater;
    @RequestMapping("code")
    public byte[] getImage(HttpServletRequest request, HttpServletResponse response, HttpSession session){
        ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
        JPEGImageEncoder jpegImageEncoder= JPEGCodec.createJPEGEncoder(byteArrayOutputStream);
        String randomCode=securityCodeCreater.getRandString();
        try {
            jpegImageEncoder.encode(securityCodeCreater.getImage(randomCode));
        } catch (Exception e) {
            e.printStackTrace();
        }
        byte[] bts=byteArrayOutputStream.toByteArray();
        response.setHeader("Pragma", "no-cache");
        response.setHeader("Cache-Control", "no-cache");
        response.setDateHeader("Expires", 0);
        response.setContentType("impge/jpeg");
        response.setBufferSize(2048);
        try {
            response.getOutputStream().write(bts);
        } catch (IOException e) {
            e.printStackTrace();
        }
        session.setAttribute("code",randomCode);
       System.out.println("getImage验证码---"+session.getAttribute("code"));
        return bts;
    }

    @RequestMapping("vail")
    public String getVail(HttpServletRequest request,HttpSession session){
        String aa=request.getParameter("a");
        String code=(String) session.getAttribute("code");
        System.out.println("getRandomCode---"+code);
        return code;
    }

    @RequestMapping("RandomCode")
    public String getRandomCode(HttpServletRequest request,HttpSession session){
        String code=(String) session.getAttribute("code");
        System.out.println("getRandomCode---"+code);
        return code;
    }


}
