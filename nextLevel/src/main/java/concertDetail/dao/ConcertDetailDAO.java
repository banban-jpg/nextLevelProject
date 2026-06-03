package concertDetail.dao;

import concertDetail.dto.ConcertDetailDTO;
import org.apache.ibatis.session.SqlSession;
import util.MyBatisUtil;

public class ConcertDetailDAO {

    private static final String NAMESPACE = "concertDetail.mapper.ConcertDetailMapper.";

    public ConcertDetailDTO getConcertDetail(int id) {
        try (SqlSession session = MyBatisUtil.openSession()) {
            return session.selectOne(NAMESPACE + "selectConcertDetail", id);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}
