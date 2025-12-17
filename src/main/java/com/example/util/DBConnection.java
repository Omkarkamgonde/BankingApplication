package com.example.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
    private static final String URL = System.getenv().getOrDefault("DB_URL", "jdbc:mysql://localhost:3306/ankush?autoReconnect=true&useSSL=false");
    private static final String USER = System.getenv().getOrDefault("DB_USER", "");
    private static final String PASSWORD = System.getenv().getOrDefault("DB_PASSWORD", "");
    
    static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public static Connection getConnection() throws SQLException {
        if (USER.isEmpty() || PASSWORD.isEmpty()) {
            throw new SQLException("Database credentials not set. Please set environment variables DB_USER and DB_PASSWORD.");
        }
        return DriverManager.getConnection(URL, USER, PASSWORD);
    }
}
