package com.test.sss.controller;

import java.io.IOException;
import java.net.URLDecoder;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.test.sss.Player;
import com.test.sss.service.PlayerService;

@WebServlet("/searchPlayer")
public class PlayerController extends HttpServlet {
    private PlayerService playerService = new PlayerService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String playerName = req.getParameter("playerNa");

        if (playerName != null) {
            // URL 디코딩
            playerName = URLDecoder.decode(playerName, "UTF-8");
        }

        if (playerName == null || playerName.trim().isEmpty()) {
            req.getRequestDispatcher("/WEB-INF/views/player/searchPlayer.jsp").forward(req, resp);
        } else {
            List<Player> players = playerService.getPlayerByName(playerName);
            if (players != null && !players.isEmpty()) {
                req.setAttribute("players", players);
                req.getRequestDispatcher("/WEB-INF/views/player/playerList.jsp").forward(req, resp);
            } else {
                req.setAttribute("error", "No players found for: " + playerName);
                req.getRequestDispatcher("/WEB-INF/views/player/searchPlayer.jsp").forward(req, resp);
            }
        
            
        }
    }
    }



