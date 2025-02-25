package com.test.sss.controller;

import javax.servlet.annotation.WebServlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/home")
public class MainController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		
		
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/home.jsp");
		dispatcher.forward(req, resp);
	}
}
