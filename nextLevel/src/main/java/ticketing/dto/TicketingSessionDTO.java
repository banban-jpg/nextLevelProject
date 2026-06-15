package ticketing.dto;

public class TicketingSessionDTO {
    private int sessionId;
    private String startTime;

    public TicketingSessionDTO() {}

    public int getSessionId() { return sessionId; }
    public void setSessionId(int sessionId) { this.sessionId = sessionId; }
    public String getStartTime() { return startTime; }
    public void setStartTime(String startTime) { this.startTime = startTime; }
}
