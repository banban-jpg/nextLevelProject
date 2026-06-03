package main.dao;

import org.apache.ibatis.session.SqlSession;
import util.MyBatisUtil;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

public class ViewCountDAO {

    private static final String NAMESPACE = "main.mapper.ViewCountMapper.";

    public void initTodayRecord() {
        String today = LocalDate.now().format(DateTimeFormatter.ofPattern("yyyyMMdd"));

        try (SqlSession session = MyBatisUtil.openSession()) {
            int count = session.selectOne(NAMESPACE + "countByViewDate", today);

            if (count == 0) {
                session.insert(NAMESPACE + "insertTodayRecord", today);
                session.commit();
                System.out.println("오늘 날짜(" + today + ")의 조회수 레코드를 생성했습니다.");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public int incrementAndGetCount() {
        String today = LocalDate.now().format(DateTimeFormatter.ofPattern("yyyyMMdd"));

        try (SqlSession session = MyBatisUtil.openSession()) {
            int updatedRows = session.update(NAMESPACE + "incrementViewCount", today);

            if (updatedRows == 0) {
                session.insert(NAMESPACE + "insertTodayRecord", today);
                session.update(NAMESPACE + "incrementViewCount", today);
            }

            Integer count = session.selectOne(NAMESPACE + "selectViewCountByDate", today);
            session.commit();
            return count == null ? 0 : count;
        } catch (Exception e) {
            e.printStackTrace();
        }

        return 0;
    }
}
