package ticketing.controller;

import login.util.AuthUtil;
import ticketing.dto.SeatStatusDTO;
import ticketing.dto.TicketingSessionDTO;
import ticketing.service.TicketingService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/ticketing")
public class TicketingController extends HttpServlet {
    private final TicketingService ticketingService = new TicketingService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String concertIdParam = request.getParameter("concertId");
        String sessionIdParam = request.getParameter("sessionId");

        if (concertIdParam == null || concertIdParam.isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Missing concertId");
            return;
        }

        int concertId = Integer.parseInt(concertIdParam);
        String concertTitle = ticketingService.getConcertTitle(concertId);
        String venueName = ticketingService.getVenueName(concertId);
        List<TicketingSessionDTO> sessions = ticketingService.getSessions(concertId);

        request.setAttribute("concertId", concertId);
        request.setAttribute("concertTitle", concertTitle);
        request.setAttribute("venueName", venueName);
        request.setAttribute("sessions", sessions);

        if (sessionIdParam != null && !sessionIdParam.isEmpty()) {
            int sessionId = Integer.parseInt(sessionIdParam);
            List<SeatStatusDTO> seats = ticketingService.getSeats(sessionId);
            request.setAttribute("selectedSessionId", sessionId);
            request.setAttribute("seats", seats);
        } else if (!sessions.isEmpty()) {
            int sessionId = sessions.get(0).getSessionId();
            List<SeatStatusDTO> seats = ticketingService.getSeats(sessionId);
            request.setAttribute("selectedSessionId", sessionId);
            request.setAttribute("seats", seats);
        }

        request.getRequestDispatcher("/ticketing.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        Long userId = AuthUtil.getLoggedInUserId(request);
        if (userId == null) {
            response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
            response.getWriter().write("LOGIN_REQUIRED");
            return;
        }

        String sessionIdParam = request.getParameter("sessionId");
        String seatIdParam = request.getParameter("seatId");

        if (sessionIdParam == null || seatIdParam == null) {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            return;
        }

        try {
            int sessionId = Integer.parseInt(sessionIdParam);
            int seatId = Integer.parseInt(seatIdParam);

            boolean success = ticketingService.lockSeat(sessionId, seatId, userId);

            if (success) {
                response.setStatus(HttpServletResponse.SC_OK);
                response.getWriter().write("SUCCESS");
            } else {
                response.setStatus(HttpServletResponse.SC_CONFLICT);
                response.getWriter().write("ALREADY_LOCKED");
            }
        } catch (NumberFormatException e) {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
        }
    }
}
