package ticketing.dto;

public class SeatStatusDTO {
    private int seatId;
    private String section;
    private int seatNo;
    private String status; // AVAILABLE, LOCKED, SOLD

    public SeatStatusDTO() {}

    public int getSeatId() { return seatId; }
    public void setSeatId(int seatId) { this.seatId = seatId; }
    public String getSection() { return section; }
    public void setSection(String section) { this.section = section; }
    public int getSeatNo() { return seatNo; }
    public void setSeatNo(int seatNo) { this.seatNo = seatNo; }
    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }
}
