package main.controller;

import main.service.ViewCountService;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/main")
public class MainController extends HttpServlet {

    private final ViewCountService viewCountService = new ViewCountService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Service 계층을 통해 오늘 날짜 조회수 가져오기
        int todayViewCount = viewCountService.getTodayViewCount();
        
        request.setAttribute("todayViewCount", todayViewCount);

        request.getRequestDispatcher("/main.jsp")
               .forward(request, response);
    }
}
