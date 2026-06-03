package login.dao;

import login.dto.UserAccountDTO;
import org.apache.ibatis.session.SqlSession;
import util.MyBatisUtil;

public class UserAccountDAO {

    private static final String NAMESPACE = "login.mapper.LoginMapper.";

    public int insertUser(UserAccountDTO userAccountDTO) {
        try (SqlSession session = MyBatisUtil.openSession()) {
            int result = session.insert(NAMESPACE + "insertUser", userAccountDTO);
            session.commit();
            return result;
        } catch (Exception e) {
            e.printStackTrace();
            return 0;
        }
    }

    public int countByLoginId(String loginId) {
        try (SqlSession session = MyBatisUtil.openSession()) {
            return session.selectOne(NAMESPACE + "countByLoginId", loginId);
        } catch (Exception e) {
            e.printStackTrace();
            return 0;
        }
    }

    public UserAccountDTO findByLoginId(String loginId) {
        try (SqlSession session = MyBatisUtil.openSession()) {
            return session.selectOne(NAMESPACE + "findByLoginId", loginId);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public UserAccountDTO findByUserId(Long userId) {
        try (SqlSession session = MyBatisUtil.openSession()) {
            return session.selectOne(NAMESPACE + "findByUserId", userId);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}
