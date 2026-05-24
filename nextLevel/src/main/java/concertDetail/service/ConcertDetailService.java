package concertDetail.service;

import concertDetail.dao.ConcertDetailDAO;
import concertDetail.dto.ConcertDetailDTO;

public class ConcertDetailService {
    private final ConcertDetailDAO concertDetailDAO = new ConcertDetailDAO();

    public ConcertDetailDTO getDetail(int id) {
        // DB에서 먼저 시도
        ConcertDetailDTO detail = concertDetailDAO.getConcertDetail(id);
        
        // DB에 데이터가 없을 경우 시연을 위한 가상 데이터 반환 (Mock Data)
        if (detail == null) {
            detail = getMockData(id);
        }
        
        return detail;
    }

    private ConcertDetailDTO getMockData(int id) {
        switch (id) {
            case 1:
                return new ConcertDetailDTO(1, "IU HEREH WORLD TOUR : SEOUL", 
                    "2025.08.15 ~ 2025.08.17", "2025.07.01 20:00", 
                    "잠실 올림픽주경기장", "₩165,000", 
                    "https://images.unsplash.com/photo-1514525253361-bee8a4874a3b?auto=format&fit=crop&w=800&q=80",
                    "아이유의 2025년 월드 투어 서울 공연입니다. 독보적인 가창력과 화려한 무대 연출을 만나보세요.",
                    "본 공연은 1인 2매까지 예매 가능하며, 부정 예매 방지를 위해 실명 인증 후 예매가 진행됩니다.");
            case 2:
                return new ConcertDetailDTO(2, "Bruno Mars : Live in Seoul", 
                    "2025.09.20 ~ 2025.09.21", "2025.08.10 12:00", 
                    "인천 아시아드 주경기장", "₩187,000", 
                    "https://images.unsplash.com/photo-1507676184212-d03ab07a01bf?auto=format&fit=crop&w=800&q=80",
                    "세계적인 팝스타 브루노 마스의 역대급 내한 공연! 펑키한 리듬과 완벽한 퍼포먼스를 경험하세요.",
                    "공연장 내 음식물 반입이 금지되며, 티켓 분실 시 재발권이 불가능하므로 보관에 유의하시기 바랍니다.");
            case 3:
                return new ConcertDetailDTO(3, "Imagine Dragons : LOOM World Tour", 
                    "2025.11.02", "2025.09.15 10:00", 
                    "부산 벡스코(BEXCO)", "₩143,000", 
                    "https://images.unsplash.com/photo-1470225620780-dba8ba36b745?auto=format&fit=crop&w=800&q=80",
                    "강렬한 사운드와 에너지 넘치는 무대! 이매진 드래곤스의 LOOM 월드 투어 부산 공연입니다.",
                    "본 공연은 전석 지정석으로 운영되며, 미취학 아동은 입장이 제한될 수 있습니다.");
            case 4:
                return new ConcertDetailDTO(4, "ULTRA KOREA 2025", 
                    "2025.08.01 ~ 2025.08.03", "2025.05.20 14:00", 
                    "서울랜드", "₩99,000", 
                    "https://images.unsplash.com/photo-1540039155733-5bb30b53aa3d?auto=format&fit=crop&w=800&q=80",
                    "국내 최대 규모의 EDM 페스티벌! 전 세계 톱 DJ들과 함께하는 뜨거운 여름밤을 즐기세요.",
                    "만 19세 이상만 입장이 가능한 성인 전용 행사입니다. 반드시 신분증을 지참해 주시기 바랍니다.");
            default:
                return null;
        }
    }
}
