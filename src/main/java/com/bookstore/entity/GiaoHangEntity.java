package com.bookstore.entity;


import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name = "giaohang")
public class GiaoHangEntity implements Serializable {
    @EmbeddedId
    private GiaoHangIDKey id;

    @Column(name = "tinhtrang")
    private String tinhtrang;

    @ManyToOne
    @JoinColumn(name = "ma_DH", insertable=false, updatable=false)
    private DonHangEntity donHangEntity;

    @ManyToOne
    @JoinColumn(name = "ma_Shipper", insertable=false, updatable=false)
    private ShipperEntity shipperEntity;

    public GiaoHangIDKey getId() {
        return id;
    }

    public void setId(GiaoHangIDKey id) {
        this.id = id;
    }

    public String getTinhtrang() {
        return tinhtrang;
    }

    public void setTinhtrang(String tinhtrang) {
        this.tinhtrang = tinhtrang;
    }

    public DonHangEntity getDonHangEntity() {
        return donHangEntity;
    }

    public void setDonHangEntity(DonHangEntity donHangEntity) {
        this.donHangEntity = donHangEntity;
    }

    public ShipperEntity getShipperEntity() {
        return shipperEntity;
    }

    public void setShipperEntity(ShipperEntity shipperEntity) {
        this.shipperEntity = shipperEntity;
    }
}
