package com.test.sss.controller;

import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletRequest;

import com.test.sss.service.ManagerStaticService;

@WebServlet("/managerStaticList") // "/managerStaticList" -> "/sss/managerStaticList"
public class ManagerStaticController extends HttpServlet {
    
    private ManagerStaticService managerStaticService = new ManagerStaticService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String formation = req.getParameter("formation");

        if (formation != null && !formation.isEmpty()) {
            List<String[]> managerList = managerStaticService.getManagersByFormation(formation);
            req.setAttribute("formation", formation);
            req.setAttribute("managerList", managerList);
        }

        RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/manager/managerStaticList.jsp");
        dispatcher.forward(req, resp);
    }
}
