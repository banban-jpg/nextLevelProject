package main.controller;

import main.service.ViewCountService;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/main")
public class MainController extends HttpServlet {

    private final main.service.ViewCountService viewCountService = new main.service.ViewCountService();
    private final login.service.LoginService loginService = new login.service.LoginServiceImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // 로그인 정보 세션 유지 처리
        HttpSession session = request.getSession();
        if (session.getAttribute("loginUser") == null) {
            Long userId = login.util.AuthUtil.getLoggedInUserId(request);
            if (userId != null) {
                session.setAttribute("loginUser", loginService.getUserById(userId));
            }
        }

        // Service 계층을 통해 오늘 날짜 조회수 가져오기
        int todayViewCount = viewCountService.getTodayViewCount();
        System.out.println("[MainController] Today View Count: " + todayViewCount);
        
        request.setAttribute("todayViewCount", todayViewCount);

        request.getRequestDispatcher("/main.jsp")
               .forward(request, response);
    }
}
