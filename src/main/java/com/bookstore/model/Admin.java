package com.bookstore.model;

public class Admin {
    String user;
    String nickname;
    String password;
    String tenAdmin;
    String gmail;

    public Admin() {
    }

    public Admin(String user, String nickname, String password, String tenAdmin, String gmail) {
        super();
        this.password = password;
        this.user = user;
        this.tenAdmin = tenAdmin;
        this.nickname = nickname;
        this.gmail = gmail;
    }

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getTenAdmin() {
        return tenAdmin;
    }

    public void setTenAdmin(String tenAdmin) {
        this.tenAdmin = tenAdmin;
    }

    public String getGmail() {
        return gmail;
    }

    public void setGmail(String gmail) {
        this.gmail = gmail;
    }

    public String toString() {
        return "Admin [ma_Admin=" + user + ", + ten_Amin, =" + nickname + ", password=" + password + ", hovaten_Amin=" + tenAdmin + ", gmail_Admin=" + gmail + "]";
    }

}
