package main.dao;

import util.DbUtil;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

public class ViewCountDAO {

    public void initTodayRecord() {
        String today = LocalDate.now().format(DateTimeFormatter.ofPattern("yyyyMMdd"));
        
        String checkSql = "SELECT COUNT(*) FROM VIEW_COUNT WHERE VIEW_DATE = ?";
        String insertSql = "INSERT INTO VIEW_COUNT (ID, VIEW_DATE, VIEW_COUNT) " +
                           "VALUES ((SELECT NVL(MAX(ID), 0) + 1 FROM VIEW_COUNT), ?, 0)";

        try (Connection conn = DbUtil.getConnection()) {
            if (conn != null) {
                try (PreparedStatement pstmt = conn.prepareStatement(checkSql)) {
                    pstmt.setString(1, today);
                    try (ResultSet rs = pstmt.executeQuery()) {
                        if (rs.next() && rs.getInt(1) == 0) {
                            try (PreparedStatement insertPstmt = conn.prepareStatement(insertSql)) {
                                insertPstmt.setString(1, today);
                                insertPstmt.executeUpdate();
                                System.out.println("오늘 날짜(" + today + ")의 조회수 레코드를 생성했습니다.");
                            }
                        }
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public int incrementAndGetCount() {
        String today = LocalDate.now().format(DateTimeFormatter.ofPattern("yyyyMMdd"));
        int count = 0;

        String updateSql = "UPDATE VIEW_COUNT SET VIEW_COUNT = VIEW_COUNT + 1 WHERE VIEW_DATE = ?";
        String selectSql = "SELECT VIEW_COUNT FROM VIEW_COUNT WHERE VIEW_DATE = ?";

        try (Connection conn = DbUtil.getConnection()) {
            if (conn != null) {
                try (PreparedStatement pstmt = conn.prepareStatement(updateSql)) {
                    pstmt.setString(1, today);
                    pstmt.executeUpdate();
                }

                try (PreparedStatement pstmt = conn.prepareStatement(selectSql)) {
                    pstmt.setString(1, today);
                    try (ResultSet rs = pstmt.executeQuery()) {
                        if (rs.next()) {
                            count = rs.getInt("VIEW_COUNT");
                        }
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return count;
    }
}
