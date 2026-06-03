package concertDetail.dto;

import java.util.List;

public class ConcertDetailDTO {
    private int id;
    private String title;
    private String performanceDate;
    private String bookingDate;
    private String location;
    private String price;
    private String posterUrl;
    private String description;
    private String ticketNotice;
    private String artistName;
    private String genre;
    private List<ConcertSessionDTO> sessions;

    public ConcertDetailDTO() {}

    public ConcertDetailDTO(int id, String title, String performanceDate, String bookingDate, 
                            String location, String price, String posterUrl, String description, 
                            String ticketNotice) {
        this.id = id;
        this.title = title;
        this.performanceDate = performanceDate;
        this.bookingDate = bookingDate;
        this.location = location;
        this.price = price;
        this.posterUrl = posterUrl;
        this.description = description;
        this.ticketNotice = ticketNotice;
    }

    // Getters and Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    public String getTitle() { return title; }
    public void setTitle(String title) { this.title = title; }
    public String getPerformanceDate() { return performanceDate; }
    public void setPerformanceDate(String performanceDate) { this.performanceDate = performanceDate; }
    public String getBookingDate() { return bookingDate; }
    public void setBookingDate(String bookingDate) { this.bookingDate = bookingDate; }
    public String getLocation() { return location; }
    public void setLocation(String location) { this.location = location; }
    public String getPrice() { return price; }
    public void setPrice(String price) { this.price = price; }
    public String getPosterUrl() { return posterUrl; }
    public void setPosterUrl(String posterUrl) { this.posterUrl = posterUrl; }
    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }
    public String getTicketNotice() { return ticketNotice; }
    public void setTicketNotice(String ticketNotice) { this.ticketNotice = ticketNotice; }
    public String getArtistName() { return artistName; }
    public void setArtistName(String artistName) { this.artistName = artistName; }
    public String getGenre() { return genre; }
    public void setGenre(String genre) { this.genre = genre; }
    public List<ConcertSessionDTO> getSessions() { return sessions; }
    public void setSessions(List<ConcertSessionDTO> sessions) { this.sessions = sessions; }
}
