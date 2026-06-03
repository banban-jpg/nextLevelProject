package main.controller;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/index")
public class IndexController extends HttpServlet {

    private final main.service.ViewCountService viewCountService = new main.service.ViewCountService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // 오늘 날짜 조회수 가져오기
        int todayViewCount = viewCountService.getTodayViewCount();
        request.setAttribute("todayViewCount", todayViewCount);

        request.getRequestDispatcher("/index.jsp")
               .forward(request, response);
    }
}
