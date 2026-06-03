package login.controller;

import login.dto.UserAccountDTO;
import login.service.LoginService;
import login.service.LoginServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/login")
public class LoginController extends HttpServlet {
    private final LoginService loginService = new LoginServiceImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if ("logout".equals(action)) {
            Cookie cookie = new Cookie("loginUser", "");
            cookie.setMaxAge(0);
            cookie.setPath("/");
            response.addCookie(cookie);
            response.sendRedirect(request.getContextPath() + "/index");
            return;
        }
        request.getRequestDispatcher("/login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String loginId = request.getParameter("loginId");
        String password = request.getParameter("password");

        UserAccountDTO user = loginService.login(loginId, password);

        if (user != null) {
            Cookie cookie = new Cookie("loginUser", String.valueOf(user.getUserId()));
            cookie.setMaxAge(60 * 60); // 3600 seconds
            cookie.setPath("/");
            response.addCookie(cookie);
            response.sendRedirect(request.getContextPath() + "/main");
        } else {
            request.setAttribute("error", "아이디 또는 비밀번호가 일치하지 않습니다.");
            request.getRequestDispatcher("/login.jsp").forward(request, response);
        }
    }
}
