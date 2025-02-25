package com.test.sss.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.test.sss.League;
import com.test.sss.service.LeagueService;


@WebServlet("/leagueList")
public class LeagueController extends HttpServlet {

	private LeagueService leagueService = new LeagueService();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			
			List<League> leagueList = leagueService.getAllLeagues();
			
			req.setAttribute("leagueList", leagueList);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/league/leagueList.jsp");
		dispatcher.forward(req, resp);
	}
}