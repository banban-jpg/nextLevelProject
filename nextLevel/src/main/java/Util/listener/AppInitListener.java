package util.listener;

import main.service.ViewCountService;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

@WebListener
public class AppInitListener implements ServletContextListener {

    private final ViewCountService viewCountService = new ViewCountService();

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        System.out.println("애플리케이션 시작: 오늘 날짜 조회수 레코드 확인 및 초기화 중...");
        viewCountService.initTodayViewCount();
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
    }
}
