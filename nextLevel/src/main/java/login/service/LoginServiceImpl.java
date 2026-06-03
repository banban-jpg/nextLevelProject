package login.service;

import login.dao.UserAccountDAO;
import login.dto.UserAccountDTO;
import login.util.SHA256Util;

public class LoginServiceImpl implements LoginService {

    private final UserAccountDAO userAccountDAO = new UserAccountDAO();

    @Override
    public UserAccountDTO login(String loginId, String password) {
        UserAccountDTO user = userAccountDAO.findByLoginId(loginId);
        if (user != null) {
            String encryptedPassword = SHA256Util.encrypt(password);
            if (encryptedPassword != null && encryptedPassword.equals(user.getPasswordHash())) {
                return user;
            }
        }
        return null;
    }

    @Override
    public boolean signup(UserAccountDTO userAccountDTO) {
        String encryptedPassword = SHA256Util.encrypt(userAccountDTO.getPasswordHash());
        userAccountDTO.setPasswordHash(encryptedPassword);
        return userAccountDAO.insertUser(userAccountDTO) > 0;
    }

    @Override
    public boolean isDuplicateId(String loginId) {
        return userAccountDAO.countByLoginId(loginId) > 0;
    }
}
