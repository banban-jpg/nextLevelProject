package concert.controller;

import concert.service.ConcertService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/concert")
public class ConcertController extends HttpServlet {
    private final ConcertService concertService = new ConcertService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setAttribute("concertList", concertService.getConcertList());
        request.getRequestDispatcher("/concert.jsp").forward(request, response);
    }
}
