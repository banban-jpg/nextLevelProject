package ticketing.dao;

import org.apache.ibatis.session.SqlSession;
import ticketing.dto.SeatStatusDTO;
import ticketing.dto.TicketingSessionDTO;
import util.MyBatisUtil;

import java.util.List;

public class TicketingDAO {
    private static final String NAMESPACE = "ticketing.mapper.TicketingMapper.";

    public List<TicketingSessionDTO> getSessions(int concertId) {
        try (SqlSession session = MyBatisUtil.openSession()) {
            return session.selectList(NAMESPACE + "selectSessionsByConcertId", concertId);
        }
    }

    public List<SeatStatusDTO> getSeats(int sessionId) {
        try (SqlSession session = MyBatisUtil.openSession()) {
            return session.selectList(NAMESPACE + "selectSeatStatusBySessionId", sessionId);
        }
    }

    public String getConcertTitle(int concertId) {
        try (SqlSession session = MyBatisUtil.openSession()) {
            return session.selectOne(NAMESPACE + "selectConcertTitle", concertId);
        }
    }

    public String getVenueName(int concertId) {
        try (SqlSession session = MyBatisUtil.openSession()) {
            return session.selectOne(NAMESPACE + "selectVenueName", concertId);
        }
    }

    public int lockSeat(int sessionId, int seatId, long userId) {
        try (SqlSession session = MyBatisUtil.openSession(true)) {
            java.util.Map<String, Object> params = new java.util.HashMap<>();
            params.put("sessionId", sessionId);
            params.put("seatId", seatId);
            params.put("userId", userId);
            return session.insert(NAMESPACE + "insertSeatStatus", params);
        } catch (Exception e) {
            e.printStackTrace();
            return 0;
        }
    }
}
