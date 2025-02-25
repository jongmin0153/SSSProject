 package com.test.sss.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.test.sss.Manager;
import com.test.sss.service.ManagerService;

@WebServlet("/managerList")
public class ManagerController extends HttpServlet {

	private ManagerService managerService = new ManagerService();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		
		
		List<Manager> managerList = managerService.getAllManagers();
        req.setAttribute("managerList", managerList);
        
		
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/manager/managerList.jsp");
		dispatcher.forward(req, resp);
	}
}
