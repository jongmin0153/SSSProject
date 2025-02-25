package com.test.sss.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBUtil {

    private static final String URL = "jdbc:oracle:thin:@localhost:1521:xe";
    private static final String USER = "SSS";  // 사용자 이름
    private static final String PASSWORD = "java1234"; // 비밀번호

    public static Connection getConnection() throws SQLException, ClassNotFoundException {
        Class.forName("oracle.jdbc.driver.OracleDriver"); // Oracle 드라이버 로드
        return DriverManager.getConnection(URL, USER, PASSWORD); // Connection 객체 반환
    }
}
