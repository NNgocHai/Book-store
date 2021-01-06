package com.bookstore.entity;

import javax.persistence.Column;
import javax.persistence.Embeddable;
import java.io.Serializable;

@Embeddable
public class GioHangIDKey implements Serializable {
    @Column
    private Integer ma_Customer;

    @Column
    private Integer ma_CuonSach;

    public Integer getMa_Customer() {
        return ma_Customer;
    }

    public void setMa_Customer(Integer ma_Customer) {
        this.ma_Customer = ma_Customer;
    }

    public Integer getMa_CuonSach() {
        return ma_CuonSach;
    }

    public void setMa_CuonSach(Integer ma_CuonSach) {
        this.ma_CuonSach = ma_CuonSach;
    }

}
