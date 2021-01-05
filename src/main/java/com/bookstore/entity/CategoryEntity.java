package com.bookstore.entity;

import javax.persistence.*;
import java.io.Serializable;
@Entity
@Table(name="dausach")
public class CategoryEntity implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "ma_DauSach")
    private Integer ma_DauSach;
    @Column(name = "ten_DauSach")
    private String ten_DauSach;

    public Integer getMa_DauSach() {
        return ma_DauSach;
    }

    public void setMa_DauSach(Integer ma_DauSach) {
        this.ma_DauSach = ma_DauSach;
    }

    public String getTen_DauSach() {
        return ten_DauSach;
    }

    public void setTen_DauSach(String ten_DauSach) {
        this.ten_DauSach = ten_DauSach;
    }


}
