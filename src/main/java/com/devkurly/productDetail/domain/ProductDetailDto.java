package com.devkurly.productDetail.domain;

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
    private String prt_image = "image"; // 상품 고화질 이미지
    private String company; // 제조사
    private boolean de_type; // 배송 유형
    private int ds_rate;
    private int price;
    private int sel_price;
    private String sub_title;
    private String title;
    private Integer user_id;

    public ProductDetailDto(){}

    public ProductDetailDto(Integer pdt_id, String pack_cd, String sell_cd, String weca_cd, String allg_dt, String ex_dt, String origin, String notice, String prt_info, String prt_image, String company, boolean de_type, int ds_rate, int price, int sel_price, String sub_title, String title, Integer user_id) {
        this.pdt_id = pdt_id;
        this.pack_cd = pack_cd;
        this.sell_cd = sell_cd;
        this.weca_cd = weca_cd;
        this.allg_dt = allg_dt;
        this.ex_dt = ex_dt;
        this.origin = origin;
        this.notice = notice;
        this.prt_info = prt_info;
        this.prt_image = prt_image;
        this.company = company;
        this.de_type = de_type;
        this.ds_rate = ds_rate;
        this.price = price;
        this.sel_price = sel_price;
        this.sub_title = sub_title;
        this.title = title;
        this.user_id = user_id;
    }

    public Integer getUser_id() {
        return user_id;
    }

    public void setUser_id(Integer user_id) {
        this.user_id = user_id;
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

    public int getDs_rate() {
        return ds_rate;
    }

    public void setDs_rate(int ds_rate) {
        this.ds_rate = ds_rate;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getSel_price() {
        return sel_price;
    }

    public void setSel_price(int sel_price) {
        this.sel_price = sel_price;
    }

    public String getSub_title() {
        return sub_title;
    }

    public void setSub_title(String sub_title) {
        this.sub_title = sub_title;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        ProductDetailDto that = (ProductDetailDto) o;
        return de_type == that.de_type && ds_rate == that.ds_rate && price == that.price && sel_price == that.sel_price && Objects.equals(pdt_id, that.pdt_id) && Objects.equals(pack_cd, that.pack_cd) && Objects.equals(sell_cd, that.sell_cd) && Objects.equals(weca_cd, that.weca_cd) && Objects.equals(allg_dt, that.allg_dt) && Objects.equals(ex_dt, that.ex_dt) && Objects.equals(origin, that.origin) && Objects.equals(notice, that.notice) && Objects.equals(prt_info, that.prt_info) && Objects.equals(prt_image, that.prt_image) && Objects.equals(company, that.company) && Objects.equals(sub_title, that.sub_title) && Objects.equals(title, that.title);
    }

    @Override
    public int hashCode() {
        return Objects.hash(pdt_id, pack_cd, sell_cd, weca_cd, allg_dt, ex_dt, origin, notice, prt_info, prt_image, company, de_type, ds_rate, price, sel_price, sub_title, title);
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
                ", ds_rate=" + ds_rate +
                ", price=" + price +
                ", sel_price=" + sel_price +
                ", sub_title='" + sub_title + '\'' +
                ", title='" + title + '\'' +
                '}';
    }
}
