package com.test.sss.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.test.sss.Player;
import com.test.sss.service.PlayerService;

@WebServlet("/playerDetails")
public class PlayerDetailsController extends HttpServlet {
    private PlayerService playerService = new PlayerService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String playerName = req.getParameter("playerNa");

        if (playerName == null || playerName.trim().isEmpty()) {
            resp.sendRedirect("/searchPlayer?error=Please provide a valid player name");
            return;
        }

        List<Player> players = playerService.getPlayerByName(playerName);

        if (players != null && players.size() == 1) {
            req.setAttribute("player", players.get(0)); // 단일 선수 정보 전달
            req.getRequestDispatcher("/WEB-INF/views/player/playerDetails.jsp").forward(req, resp);
        } else {
            resp.sendRedirect("/sss/searchPlayer?error=No specific player found or multiple results");
        }
    }
}
