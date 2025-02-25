package com.test.sss.repository;

import com.test.sss.ManagerStatic;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ManagerStaticDAO {

    private static final String DB_URL = "jdbc:mysql://localhost:3306/yourdb";
    private static final String DB_USER = "yourusername";
    private static final String DB_PASSWORD = "yourpassword";

    public List<ManagerStatic> getManagersByFormation(String formation) {
        List<ManagerStatic> managers = new ArrayList<>();
        String query = "SELECT * FROM ManagerStatic WHERE formation = ?";

        try (Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
             PreparedStatement statement = connection.prepareStatement(query)) {

            statement.setString(1, formation);

            try (ResultSet resultSet = statement.executeQuery()) {
                while (resultSet.next()) {
                    ManagerStatic manager = new ManagerStatic();
                    manager.setManNa(resultSet.getString("manNa"));
                    manager.setFormation(resultSet.getString("formation"));
                    managers.add(manager);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return managers;
    }
}
