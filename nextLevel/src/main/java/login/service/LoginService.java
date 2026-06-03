package login.service;

import login.dto.UserAccountDTO;

public interface LoginService {
    UserAccountDTO login(String loginId, String password);
    boolean signup(UserAccountDTO userAccountDTO);
    boolean isDuplicateId(String loginId);
    UserAccountDTO getUserById(Long userId);
}
