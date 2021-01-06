package com.bookstore.entity;

import javax.persistence.Column;
import javax.persistence.Embeddable;
import java.io.Serializable;
@Embeddable
public class GiaoHangIDKey implements Serializable {
    @Column
    private  Integer ma_DH;

    @Column
    private Integer ma_Shipper;

    public Integer getMa_DH() {
        return ma_DH;
    }

    public void setMa_DH(Integer ma_DH) {
        this.ma_DH = ma_DH;
    }

    public Integer getMa_Shiper() {
        return ma_Shipper;
    }

    public void setMa_Shiper(Integer ma_Shiper) {
        this.ma_Shipper = ma_Shiper;
    }
}
