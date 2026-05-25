package concert.dao;

import concert.dto.ConcertDTO;
import org.apache.ibatis.session.SqlSession;
import util.MyBatisUtil;

import java.util.List;

public class ConcertDAO {

    private static final String NAMESPACE = "concert.mapper.ConcertMapper.";

    public List<ConcertDTO> getAllConcerts() {
        try (SqlSession session = MyBatisUtil.openSession()) {
            return session.selectList(NAMESPACE + "selectAllConcerts");
        } catch (Exception e) {
            e.printStackTrace();
            return List.of();
        }
    }
}
