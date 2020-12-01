package com.bookstore.jdbc;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectDB {
    public  ConnectDB(){
        super();
    }
    public static Connection getConnect() {
        Connection conn = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/bansachonline?useSSL=false";
            String user = "root";
            String password = "123456hieu";
            conn = DriverManager.getConnection(url, user, password);
            System.out.println("Ket noi thanh cong");

        } catch (Exception ex) {
            System.out.println("Ket noi that bai" + ex.getMessage());
        }
        return conn;
    }
    public static void main(String [] args)
    {
        System.out.println(getConnect());
    }

}
