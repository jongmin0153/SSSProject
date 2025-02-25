package com.test.sss.controller;

import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.test.sss.PositionRole;
import com.test.sss.service.PositionRoleService;

@WebServlet("/position")
public class PositionController extends HttpServlet {

    private PositionRoleService service;

    @Override
    public void init() throws ServletException {
        service = new PositionRoleService();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String position = req.getParameter("position");
        String role = req.getParameter("role");

        // 전체 포지션 목록 가져오기
        List<PositionRole> positionRoles = service.getAllPositionRoles();
        req.setAttribute("positionRoles", positionRoles);

        // 포지션과 역할이 선택된 경우 해당 포지션의 선수 리스트 가져오기
        if (position != null && role != null && !position.isEmpty() && !role.isEmpty()) {
            PositionRole positionRole = service.getPositionRoleWithPlayers(position, role);
            req.setAttribute("positionRole", positionRole);
        }

        RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/position/position.jsp");
        dispatcher.forward(req, resp);
    }
}
