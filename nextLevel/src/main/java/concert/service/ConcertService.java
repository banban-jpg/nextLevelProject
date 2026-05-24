package concert.service;

import concert.dao.ConcertDAO;
import concert.dto.ConcertDTO;
import java.util.List;

public class ConcertService {
    private final ConcertDAO concertDAO = new ConcertDAO();

    public List<ConcertDTO> getConcertList() {
        return concertDAO.getAllConcerts();
    }
}
