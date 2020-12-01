package com.bookstore.dao;


import com.bookstore.jdbc.ConnectDB;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class AdminLoginDao{
    public static boolean checkAdminLogin (String username, String password) {
        boolean exist = false;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String sql = "SELECT * FROM admin WHERE ma_Amin=? AND matkhau_Amin=?";
            Connection con = ConnectDB.getConnect();
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, username);
            st.setString(2, password);
            ResultSet rs;
            rs = st.executeQuery();
            exist = rs.next();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return exist;
    }
    public static void main(String[] args) {
        System.out.println(checkAdminLogin("Hieuxt","123456"));

    }
}
