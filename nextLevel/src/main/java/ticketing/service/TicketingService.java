package ticketing.service;

import ticketing.dao.TicketingDAO;
import ticketing.dto.SeatStatusDTO;
import ticketing.dto.TicketingSessionDTO;

import java.util.List;

public class TicketingService {
    private final TicketingDAO ticketingDAO = new TicketingDAO();

    public List<TicketingSessionDTO> getSessions(int concertId) {
        return ticketingDAO.getSessions(concertId);
    }

    public List<SeatStatusDTO> getSeats(int sessionId) {
        return ticketingDAO.getSeats(sessionId);
    }

    public String getConcertTitle(int concertId) {
        return ticketingDAO.getConcertTitle(concertId);
    }

    public String getVenueName(int concertId) {
        return ticketingDAO.getVenueName(concertId);
    }

    public boolean lockSeat(int sessionId, int seatId, long userId) {
        return ticketingDAO.lockSeat(sessionId, seatId, userId) > 0;
    }
}
