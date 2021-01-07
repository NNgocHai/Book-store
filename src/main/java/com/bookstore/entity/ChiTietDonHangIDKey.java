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
    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        ChiTietDonHangIDKey that = (ChiTietDonHangIDKey) o;

        if (!Objects.equals(ma_DH, that.ma_DH)) return false;
        return Objects.equals(ma_CuonSach, that.ma_CuonSach);
    }

    @Override
    public int hashCode() {
        int result = ma_DH != null ? ma_DH.hashCode() : 0;
        result = 31 * result + (ma_CuonSach != null ? ma_CuonSach.hashCode() : 0);
        return result;
    }

}
