package com.bookstore.entity;

import javax.persistence.*;
import java.io.Serializable;

@Embeddable
public class ChiTietDonHangIDKey implements Serializable {
    @Column
    private Integer ma_DH;
    @Column
    private Integer ma_CuonSach;

    public Integer getMa_DH() {
        return ma_DH;
    }

    public void setMa_DH(Integer ma_DH) {
        this.ma_DH = ma_DH;
    }

    public Integer getMa_CuonSach() {
        return ma_CuonSach;
    }

    public void setMa_CuonSach(Integer ma_CuonSach) {
        this.ma_CuonSach = ma_CuonSach;
    }

}
