package com.devkurly.productDetail.domain;

import java.util.Date;
import java.util.Objects;

public class ProductDetailDto {
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
    private Date in_date;
    private String in_user;
    private Date up_date;
    private String up_user;

    public ProductDetailDto() { }

    public ProductDetailDto(Integer pdt_id, String pack_cd, String sell_cd, String weca_cd, String prt_info, String in_user, String up_user) {
        this.pdt_id = pdt_id;
        this.pack_cd = pack_cd;
        this.sell_cd = sell_cd;
        this.weca_cd = weca_cd;
        this.prt_info = prt_info;
        this.in_user = in_user;
        this.up_user = up_user;
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

    public Date getIn_date() {
        return in_date;
    }

    public void setIn_date(Date in_date) {
        this.in_date = in_date;
    }

    public String getIn_user() {
        return in_user;
    }

    public void setIn_user(String in_user) {
        this.in_user = in_user;
    }

    public Date getUp_date() {
        return up_date;
    }

    public void setUp_date(Date up_date) {
        this.up_date = up_date;
    }

    public String getUp_user() {
        return up_user;
    }

    public void setUp_user(String up_user) {
        this.up_user = up_user;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        ProductDetailDto that = (ProductDetailDto) o;
        return de_type == that.de_type && Objects.equals(pdt_id, that.pdt_id) && Objects.equals(pack_cd, that.pack_cd) && Objects.equals(sell_cd, that.sell_cd) && Objects.equals(weca_cd, that.weca_cd) && Objects.equals(allg_dt, that.allg_dt) && Objects.equals(ex_dt, that.ex_dt) && Objects.equals(origin, that.origin) && Objects.equals(notice, that.notice) && Objects.equals(prt_info, that.prt_info) && Objects.equals(prt_image, that.prt_image) && Objects.equals(company, that.company) && Objects.equals(in_date, that.in_date) && Objects.equals(in_user, that.in_user) && Objects.equals(up_date, that.up_date) && Objects.equals(up_user, that.up_user);
    }

    @Override
    public int hashCode() {
        return Objects.hash(pdt_id, pack_cd, sell_cd, weca_cd, allg_dt, ex_dt, origin, notice, prt_info, prt_image, company, de_type, in_date, in_user, up_date, up_user);
    }

    @Override
    public String toString() {
        return "ProductDetailDto{" +
                "pdt_id=" + pdt_id +
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
                ", in_date=" + in_date +
                ", in_user='" + in_user + '\'' +
                ", up_date=" + up_date +
                ", up_user='" + up_user + '\'' +
                '}';
    }
}
