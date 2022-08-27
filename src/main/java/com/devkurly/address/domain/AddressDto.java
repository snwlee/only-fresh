package com.devkurly.address.domain;

import org.springframework.beans.factory.annotation.Autowired;

import java.util.Date;
import java.util.Objects;

public class AddressDto {
    private Integer addr_id;    // 배송지 id (PK)
    private Integer user_id;    // 유저 id (FK)
    private String addr;        // 기본 배송지 정보(장바구니, 주문시 보여지는 컬럼)
    private Boolean chk_addr;   // 체크하면 기본 배송지
    private Boolean ba_addr;    // 선택 배송지 체크여부, 배송지 목록 창에서만 선택여부
    private String main_addr;   // 메인주소
    private String sub_addr;    // 서브 상세 주소
    private Boolean deli_type;  // 배송유형 t:샛별, f:낮배송
    private String city_code;   // 도시코드
    private String addr_name;   // 수신자 이름
    private String addr_tel;   // 수신자 휴대폰
    private String cd_type_name; //
    private String in_user;
    private Date in_date;
    private String up_user;
    private Date up_date;


    public AddressDto() { }

    public AddressDto(Integer addr_id, Integer user_id, Boolean chk_addr, String main_addr,Boolean ba_addr, String sub_addr, Boolean deli_type,String cd_type_name, String city_code, String in_user, String up_user)  {
        this.addr_id = addr_id;
        this.user_id = user_id;
        this.chk_addr = chk_addr;
        this.main_addr = main_addr;
        this.ba_addr = ba_addr;
        this.sub_addr = sub_addr;
        this.deli_type = deli_type;
        this.city_code = city_code;
        this.cd_type_name = cd_type_name;
        this.in_user = in_user;
        this.up_user = up_user;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof AddressDto)) return false;
        AddressDto that = (AddressDto) o;
        return Objects.equals(getAddr_id(), that.getAddr_id()) && Objects.equals(getUser_id(), that.getUser_id()) && Objects.equals(getAddr(), that.getAddr()) && Objects.equals(getChk_addr(), that.getChk_addr()) && Objects.equals(getMain_addr(), that.getMain_addr()) && Objects.equals(getSub_addr(), that.getSub_addr()) && Objects.equals(getDeli_type(), that.getDeli_type()) && Objects.equals(getCity_code(), that.getCity_code()) && Objects.equals(getAddr_name(), that.getAddr_name()) && Objects.equals(getAddr_tel(), that.getAddr_tel()) && Objects.equals(getCd_type_name(), that.getCd_type_name()) && Objects.equals(getIn_user(), that.getIn_user()) && Objects.equals(getIn_date(), that.getIn_date()) && Objects.equals(getUp_user(), that.getUp_user()) && Objects.equals(getUp_date(), that.getUp_date());
    }

    @Override
    public int hashCode() {
        return Objects.hash(getAddr_id(), getUser_id(), getAddr(), getChk_addr(), getMain_addr(), getSub_addr(), getDeli_type(), getCity_code(), getAddr_name(), getAddr_tel(), getCd_type_name(), getIn_user(), getIn_date(), getUp_user(), getUp_date());
    }

    @Override
    public String toString() {
        return "AddressDto{" +
                "addr_id=" + addr_id +
                ", user_id=" + user_id +
                ", addr='" + addr + '\'' +
                ", chk_addr=" + chk_addr +
                ", ba_addr=" + ba_addr +
                ", main_addr='" + main_addr + '\'' +
                ", sub_addr='" + sub_addr + '\'' +
                ", deli_type=" + deli_type +
                ", city_code='" + city_code + '\'' +
                ", addr_name='" + addr_name + '\'' +
                ", addr_tel='" + addr_tel + '\'' +
                ", cd_type_name='" + cd_type_name + '\'' +
                ", in_user='" + in_user + '\'' +
                ", in_date=" + in_date +
                ", up_user='" + up_user + '\'' +
                ", up_date=" + up_date +
                '}';
    }

    public Boolean getBa_addr() {
        return ba_addr;
    }

    public void setBa_addr(Boolean ba_addr) {
        this.ba_addr = ba_addr;
    }

    public String getCd_type_name() {
        return cd_type_name;
    }

    public void setCd_type_name(String cd_type_name) {
        this.cd_type_name = cd_type_name;
    }

    public Integer getAddr_id() {
        return addr_id;
    }

    public void setAddr_id(Integer addr_id) {
        this.addr_id = addr_id;
    }

    public Integer getUser_id() {
        return user_id;
    }

    public void setUser_id(Integer user_id) {
        this.user_id = user_id;
    }

    public String getAddr() {
        return addr;
    }

    public void setAddr(String addr) {
        this.addr = addr;
    }

    public Boolean getChk_addr() {
        return chk_addr;
    }

    public void setChk_addr(Boolean chk_addr) {
        this.chk_addr = chk_addr;
    }

    public String getMain_addr() {
        return main_addr;
    }

    public void setMain_addr(String main_addr) {
        this.main_addr = main_addr;
    }

    public String getSub_addr() {
        return sub_addr;
    }

    public void setSub_addr(String sub_addr) {
        this.sub_addr = sub_addr;
    }

    public Boolean getDeli_type() {
        return deli_type;
    }

    public void setDeli_type(Boolean deli_type) {
        this.deli_type = deli_type;
    }

    public String getCity_code() {
        return city_code;
    }

    public void setCity_code(String city_code) {
        this.city_code = city_code;
    }

    public String getAddr_name() {
        return addr_name;
    }

    public void setAddr_name(String addr_name) {
        this.addr_name = addr_name;
    }

    public String getAddr_tel() {
        return addr_tel;
    }

    public void setAddr_tel(String addr_tel) {
        this.addr_tel = addr_tel;
    }

    public String getIn_user() {
        return in_user;
    }

    public void setIn_user(String in_user) {
        this.in_user = in_user;
    }

    public Date getIn_date() {
        return in_date;
    }

    public void setIn_date(Date in_date) {
        this.in_date = in_date;
    }

    public String getUp_user() {
        return up_user;
    }

    public void setUp_user(String up_user) {
        this.up_user = up_user;
    }

    public Date getUp_date() {
        return up_date;
    }

    public void setUp_date(Date up_date) {
        this.up_date = up_date;
    }
}
