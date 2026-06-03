package login.dto;

import java.sql.Timestamp;

public class UserAccountDTO {
    private Long userId;
    private String loginId;
    private String passwordHash;
    private String name;
    private Timestamp createdAt;

    public UserAccountDTO() {}

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public String getLoginId() {
        return loginId;
    }

    public void setLoginId(String loginId) {
        this.loginId = loginId;
    }

    public String getPasswordHash() {
        return passwordHash;
    }

    public void setPasswordHash(String passwordHash) {
        this.passwordHash = passwordHash;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Timestamp getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Timestamp createdAt) {
        this.createdAt = createdAt;
    }

    @Override
    public String toString() {
        return "UserAccountDTO [userId=" + userId + ", loginId=" + loginId + ", name=" + name + ", createdAt=" + createdAt + "]";
    }
}
