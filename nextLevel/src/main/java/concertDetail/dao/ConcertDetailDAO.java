package concertDetail.dao;

import concertDetail.dto.ConcertDetailDTO;
import util.DbUtil;
import java.sql.*;

public class ConcertDetailDAO {
    
    public ConcertDetailDTO getConcertDetail(int id) {
        ConcertDetailDTO concert = null;
        String sql = "SELECT * FROM CONCERTS WHERE ID = ?";
        
        try (Connection conn = DbUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setInt(1, id);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    concert = new ConcertDetailDTO();
                    concert.setId(rs.getInt("ID"));
                    concert.setTitle(rs.getString("TITLE"));
                    concert.setPerformanceDate(rs.getString("PERFORMANCE_DATE"));
                    concert.setBookingDate(rs.getString("BOOKING_DATE"));
                    concert.setLocation(rs.getString("LOCATION"));
                    concert.setPrice(rs.getString("PRICE"));
                    concert.setPosterUrl(rs.getString("POSTER_URL"));
                    concert.setDescription(rs.getString("DESCRIPTION"));
                    concert.setTicketNotice(rs.getString("TICKET_NOTICE"));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return concert;
    }
}
