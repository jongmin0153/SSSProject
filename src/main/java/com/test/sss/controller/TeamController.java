package com.test.sss.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.test.sss.Team;
import com.test.sss.service.TeamService;

@WebServlet("/teamList")
public class TeamController extends HttpServlet {

	private TeamService teamService = new TeamService();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		List<Team> teamList = teamService.getAllTeams();
		req.setAttribute("teamList", teamList);
		
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/team/teamList.jsp");
		dispatcher.forward(req, resp);
	}
}