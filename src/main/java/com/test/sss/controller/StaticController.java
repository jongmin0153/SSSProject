//package com.test.sss.controller;
//
//import java.io.IOException;
//import java.util.List;
//
//import javax.servlet.RequestDispatcher;
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//
//import com.test.sss.StaticData;
//import com.test.sss.service.StaticService;
//
////@WebServlet("/staticList")
//public class StaticController extends HttpServlet {
//
//    @Override
//    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        StaticService service = new StaticService();
//
//        // 전술 데이터 리스트 (전체 조회)
//        List<StaticData> tacticsList = service.getTacticsList();
//        req.setAttribute("tacticsList", tacticsList);
//
//        // 전술 seq 값 가져오기 (기본적으로 1번을 조회)
//        int seq = 1;
//        if (req.getParameter("seq") != null) {
//            seq = Integer.parseInt(req.getParameter("seq"));
//        }
//
//        // 선택된 전술의 감독 리스트 조회
//        List<StaticData> managersList = service.getTacticsWithManagersList(seq);
//        req.setAttribute("managersList", managersList);
//
////        RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/static/staticList.jsp");
////        dispatcher.forward(req, resp);
//    }
//}
