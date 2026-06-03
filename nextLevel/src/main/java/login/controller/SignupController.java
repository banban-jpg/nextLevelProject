package login.controller;

import login.dto.UserAccountDTO;
import login.service.LoginService;
import login.service.LoginServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/signup")
public class SignupController extends HttpServlet {
    private final LoginService loginService = new LoginServiceImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // 로그인 상태라면 회원가입 페이지 접근 불가 -> 메인으로 리다이렉트
        if (login.util.AuthUtil.isLoggedIn(request)) {
            response.sendRedirect(request.getContextPath() + "/main");
            return;
        }
        
        request.getRequestDispatcher("/signup.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // 로그인 상태라면 가입 처리 불필요
        if (login.util.AuthUtil.isLoggedIn(request)) {
            response.sendRedirect(request.getContextPath() + "/main");
            return;
        }

        request.setCharacterEncoding("UTF-8");

        String action = request.getParameter("action");
        if ("checkDuplicate".equals(action)) {
            String loginId = request.getParameter("loginId");
            boolean isDuplicate = loginService.isDuplicateId(loginId);
            response.setContentType("text/plain; charset=UTF-8");
            response.getWriter().write(String.valueOf(isDuplicate));
            return;
        }

        String loginId = request.getParameter("loginId");
        String password = request.getParameter("password");
        String name = request.getParameter("name");

        UserAccountDTO user = new UserAccountDTO();
        user.setLoginId(loginId);
        user.setPasswordHash(password); // Will be hashed in service
        user.setName(name);

        if (loginService.signup(user)) {
            response.sendRedirect(request.getContextPath() + "/login");
        } else {
            request.setAttribute("error", "회원가입에 실패했습니다.");
            request.getRequestDispatcher("/signup.jsp").forward(request, response);
        }
    }
}
