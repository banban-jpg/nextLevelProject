package concert.dto;

import java.sql.Timestamp;

public class ConcertDTO {
    private int concertId;
    private String title;
    private String description;
    private Timestamp bookingOpenAt;
    private int venueId;
    private String venueName;
    private String artistName;
    private String genre;

    public ConcertDTO() {
    }

    public int getConcertId() {
        return concertId;
    }

    public void setConcertId(int concertId) {
        this.concertId = concertId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Timestamp getBookingOpenAt() {
        return bookingOpenAt;
    }

    public void setBookingOpenAt(Timestamp bookingOpenAt) {
        this.bookingOpenAt = bookingOpenAt;
    }

    public int getVenueId() {
        return venueId;
    }

    public void setVenueId(int venueId) {
        this.venueId = venueId;
    }

    public String getVenueName() {
        return venueName;
    }

    public void setVenueName(String venueName) {
        this.venueName = venueName;
    }

    public String getArtistName() {
        return artistName;
    }

    public void setArtistName(String artistName) {
        this.artistName = artistName;
    }

    public String getGenre() {
        return genre;
    }

    public void setGenre(String genre) {
        this.genre = genre;
    }
}
