package Main.Controller;

import Util.DbUtil;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.Connection;

@WebServlet("/main")
public class MainController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Connection conn = DbUtil.getConnection();

        if (conn != null) {
            System.out.println("메인컨트롤러 DB 연결 성공");
        } else {
            System.out.println("메인컨트롤러 DB 연결 실패");
        }

        request.getRequestDispatcher("/main.jsp")
               .forward(request, response);
    }
}