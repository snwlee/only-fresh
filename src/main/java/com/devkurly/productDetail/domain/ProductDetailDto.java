package com.devkurly.productDetail.domain;

import java.util.Objects;

public class ProductDetailDto {
    private Integer det_id; // 디테일ID
    private Integer pdt_id; // 상품 ID
    private String pack_cd; // 포장 타입 코드
    private String sell_cd; // 판매 단위 코드
    private String weca_cd; // 중량 용량 코드
    private String allg_dt; // 알레르기 정보
    private String ex_dt; // 유통기한
    private String origin; // 원산지
    private String notice; // 안내사항
    private String prt_info; // 상품설명
    private String prt_image; // 상품 고화질 이미지
    private String company; // 제조사
    private boolean de_type; // 배송 유형

    public ProductDetailDto() { }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof ProductDetailDto)) return false;
        ProductDetailDto that = (ProductDetailDto) o;
        return isDe_type() == that.isDe_type() && Objects.equals(getDet_id(), that.getDet_id()) && Objects.equals(getPdt_id(), that.getPdt_id()) && Objects.equals(getPack_cd(), that.getPack_cd()) && Objects.equals(getSell_cd(), that.getSell_cd()) && Objects.equals(getWeca_cd(), that.getWeca_cd()) && Objects.equals(getAllg_dt(), that.getAllg_dt()) && Objects.equals(getEx_dt(), that.getEx_dt()) && Objects.equals(getOrigin(), that.getOrigin()) && Objects.equals(getNotice(), that.getNotice()) && Objects.equals(getPrt_info(), that.getPrt_info()) && Objects.equals(getPrt_image(), that.getPrt_image()) && Objects.equals(getCompany(), that.getCompany());
    }

    @Override
    public int hashCode() {
        return Objects.hash(getDet_id(), getPdt_id(), getPack_cd(), getSell_cd(), getWeca_cd(), getAllg_dt(), getEx_dt(), getOrigin(), getNotice(), getPrt_info(), getPrt_image(), getCompany(), isDe_type());
    }

    @Override
    public String toString() {
        return "ProductDetailDto{" +
                "det_id=" + det_id +
                ", pdt_id=" + pdt_id +
                ", pack_cd='" + pack_cd + '\'' +
                ", sell_cd='" + sell_cd + '\'' +
                ", weca_cd='" + weca_cd + '\'' +
                ", allg_dt='" + allg_dt + '\'' +
                ", ex_dt='" + ex_dt + '\'' +
                ", origin='" + origin + '\'' +
                ", notice='" + notice + '\'' +
                ", prt_info='" + prt_info + '\'' +
                ", prt_image='" + prt_image + '\'' +
                ", company='" + company + '\'' +
                ", de_type=" + de_type +
                '}';
    }

    public Integer getDet_id() {
        return det_id;
    }

    public void setDet_id(Integer det_id) {
        this.det_id = det_id;
    }

    public Integer getPdt_id() {
        return pdt_id;
    }

    public void setPdt_id(Integer pdt_id) {
        this.pdt_id = pdt_id;
    }

    public String getPack_cd() {
        return pack_cd;
    }

    public void setPack_cd(String pack_cd) {
        this.pack_cd = pack_cd;
    }

    public String getSell_cd() {
        return sell_cd;
    }

    public void setSell_cd(String sell_cd) {
        this.sell_cd = sell_cd;
    }

    public String getWeca_cd() {
        return weca_cd;
    }

    public void setWeca_cd(String weca_cd) {
        this.weca_cd = weca_cd;
    }

    public String getAllg_dt() {
        return allg_dt;
    }

    public void setAllg_dt(String allg_dt) {
        this.allg_dt = allg_dt;
    }

    public String getEx_dt() {
        return ex_dt;
    }

    public void setEx_dt(String ex_dt) {
        this.ex_dt = ex_dt;
    }

    public String getOrigin() {
        return origin;
    }

    public void setOrigin(String origin) {
        this.origin = origin;
    }

    public String getNotice() {
        return notice;
    }

    public void setNotice(String notice) {
        this.notice = notice;
    }

    public String getPrt_info() {
        return prt_info;
    }

    public void setPrt_info(String prt_info) {
        this.prt_info = prt_info;
    }

    public String getPrt_image() {
        return prt_image;
    }

    public void setPrt_image(String prt_image) {
        this.prt_image = prt_image;
    }

    public String getCompany() {
        return company;
    }

    public void setCompany(String company) {
        this.company = company;
    }

    public boolean isDe_type() {
        return de_type;
    }

    public void setDe_type(boolean de_type) {
        this.de_type = de_type;
    }












}
