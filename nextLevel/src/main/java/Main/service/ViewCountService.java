package main.service;

import main.dao.ViewCountDAO;

public class ViewCountService {

    private final ViewCountDAO viewCountDAO = new ViewCountDAO();

    /**
     * 오늘 날짜의 조회수 레코드를 초기화합니다.
     */
    public void initTodayViewCount() {
        viewCountDAO.initTodayRecord();
    }

    /**
     * 조회수를 증가시키고 현재 조회수를 가져옵니다.
     * @return 오늘 날짜의 총 조회수
     */
    public int getTodayViewCount() {
        return viewCountDAO.incrementAndGetCount();
    }
}
