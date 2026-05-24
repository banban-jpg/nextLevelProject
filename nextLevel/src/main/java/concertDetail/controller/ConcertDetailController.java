package concertDetail.controller;

import concertDetail.dto.ConcertDetailDTO;
import concertDetail.service.ConcertDetailService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/concert/detail")
public class ConcertDetailController extends HttpServlet {
    private final ConcertDetailService concertDetailService = new ConcertDetailService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String idParam = request.getParameter("id");
        if (idParam == null || idParam.isEmpty()) {
            response.sendRedirect("/concert");
            return;
        }

        try {
            int id = Integer.parseInt(idParam);
            ConcertDetailDTO detail = concertDetailService.getDetail(id);

            if (detail != null) {
                request.setAttribute("concert", detail);
                request.getRequestDispatcher("/concertDetail.jsp").forward(request, response);
            } else {
                response.sendRedirect("/concert");
            }
        } catch (NumberFormatException e) {
            response.sendRedirect("/concert");
        }
    }
}
