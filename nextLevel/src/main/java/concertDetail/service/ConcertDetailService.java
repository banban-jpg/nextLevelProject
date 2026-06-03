package concertDetail.service;

import concertDetail.dao.ConcertDetailDAO;
import concertDetail.dto.ConcertDetailDTO;

public class ConcertDetailService {
    private final ConcertDetailDAO concertDetailDAO = new ConcertDetailDAO();

    public ConcertDetailDTO getDetail(int id) {
        return concertDetailDAO.getConcertDetail(id);
    }
}
