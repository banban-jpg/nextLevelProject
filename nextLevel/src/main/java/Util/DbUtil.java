package Util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DbUtil {

    private static final String DRIVER =
            "oracle.jdbc.driver.OracleDriver";

    private static final String URL =
            "jdbc:oracle:thin:@localhost:1521:xe";

    private static final String USER =
            "C##NEXTLEVEL";

    private static final String PASSWORD =
            "dkagh123";

    public static Connection getConnection() {

        try {

            Class.forName(DRIVER);

            Connection conn =
                    DriverManager.getConnection(
                            URL,
                            USER,
                            PASSWORD
                    );

            System.out.println(
                    "Oracle DB 연결 성공"
            );

            return conn;

        } catch (Exception e) {

            System.out.println(
                    "Oracle DB 연결 실패"
            );

            e.printStackTrace();
        }

        return null;
    }
}