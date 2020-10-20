package com.beijing.service;

import com.beijing.domain.Student;
import com.google.gson.Gson;

import javax.jws.WebService;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
@WebServlet("/myServlet")
public class MyServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("执行doget方法，处理get请求");
        Student student = new Student(14, "zs", 43);
        resp.setContentType("characterSet:utf-8");
        Gson gson = new Gson();
        String s = gson.toJson(student);
        resp.getWriter().print(s);

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("执行dopost方法，处理post请求");
        String name = req.getParameter("name");
        System.out.println("name:"+name);
        Student student = new Student(23, "ls", 43);
        resp.setContentType("characterSet:utf-8");
        Gson gson = new Gson();
        String s = gson.toJson(student);
        resp.getWriter().print(s);
    }
}
