package concert.dao;

import concert.dto.ConcertDTO;
import util.DbUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ConcertDAO {

    public List<ConcertDTO> getAllConcerts() {
        List<ConcertDTO> concerts = new ArrayList<>();
        String sql = "SELECT c.CONCERT_ID, c.TITLE, c.DESCRIPTION, c.BOOKING_OPEN_AT, " +
                     "       c.VENUE_ID, c.ARTIST_NAME, c.GENRE, v.NAME AS VENUE_NAME " +
                     "FROM CONCERT c " +
                     "JOIN VENUE v ON c.VENUE_ID = v.VENUE_ID " +
                     "ORDER BY c.CONCERT_ID DESC";

        try (Connection conn = DbUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql);
             ResultSet rs = pstmt.executeQuery()) {

            while (rs.next()) {
                ConcertDTO concert = new ConcertDTO();
                concert.setConcertId(rs.getInt("CONCERT_ID"));
                concert.setTitle(rs.getString("TITLE"));
                concert.setDescription(rs.getString("DESCRIPTION"));
                concert.setBookingOpenAt(rs.getTimestamp("BOOKING_OPEN_AT"));
                concert.setVenueId(rs.getInt("VENUE_ID"));
                concert.setVenueName(rs.getString("VENUE_NAME"));
                concert.setArtistName(rs.getString("ARTIST_NAME"));
                concert.setGenre(rs.getString("GENRE"));
                concerts.add(concert);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return concerts;
    }
}
