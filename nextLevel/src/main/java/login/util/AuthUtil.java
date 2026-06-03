package login.util;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

public class AuthUtil {

    /**
     * Cookie를 통해 로그인 여부를 확인합니다.
     * @param request HttpServletRequest
     * @return 로그인 상태면 true, 아니면 false
     */
    public static boolean isLoggedIn(HttpServletRequest request) {
        return getLoggedInUserId(request) != null;
    }

    /**
     * Cookie에서 로그인된 사용자의 ID를 가져옵니다.
     * @param request HttpServletRequest
     * @return userId (로그인되지 않았으면 null)
     */
    public static Long getLoggedInUserId(HttpServletRequest request) {
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if ("loginUser".equals(cookie.getName())) {
                    String value = cookie.getValue();
                    if (value != null && !value.isEmpty()) {
                        try {
                            return Long.parseLong(value);
                        } catch (NumberFormatException e) {
                            return null;
                        }
                    }
                }
            }
        }
        return null;
    }
}
