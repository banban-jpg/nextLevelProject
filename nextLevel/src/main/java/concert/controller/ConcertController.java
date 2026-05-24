package concert.controller;

import concert.service.ConcertService;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/concert")
public class ConcertController extends HttpServlet {
    private final ConcertService concertService = new ConcertService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.getRequestDispatcher("/concert.jsp")
               .forward(request, response);
    }
}
