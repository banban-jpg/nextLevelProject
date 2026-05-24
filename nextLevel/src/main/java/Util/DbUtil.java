package util;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.util.Properties;

public class DbUtil {

    private static String DRIVER;
    private static String URL;
    private static String USER;
    private static String PASSWORD;

    static {
        try (InputStream input = DbUtil.class.getClassLoader().getResourceAsStream("db.properties")) {
            Properties prop = new Properties();

            if (input == null) {
                System.out.println("db.properties 파일을 찾을 수 없습니다.");
            } else {
                prop.load(input);

                DRIVER = prop.getProperty("db.driver");
                URL = prop.getProperty("db.url");
                USER = prop.getProperty("db.username");
                PASSWORD = prop.getProperty("db.password");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static Connection getConnection() {
        try {
            Class.forName(DRIVER);
            Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);
            System.out.println("Oracle DB 연결 성공");
            return conn;
        } catch (Exception e) {
            System.out.println("Oracle DB 연결 실패");
            e.printStackTrace();
        }
        return null;
    }
}
