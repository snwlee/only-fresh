package com.devkurly.address.domain;

import java.util.Objects;

public class AddrListDto {
    private Integer addr_id;	// 배송지 id
    private Integer user_id;	// 유저id
    private Boolean chk_addr; 	// 선택배송지 여부
    private String add_code;	// 배송지별 구분코드
    private String stna_addr;	// 도로명 주소
    private String stna_addr_dt;	// 도로명 주소 상세
    private Boolean deli_type;	// 배송유형 t:샛별, f 낮배송
    private String addr_name;		// 수신자 이름
    private String addr_tel;			// 수신자 휴대폰

    public AddrListDto(Integer addr_id, Integer user_id, Boolean chk_addr, String add_code, String atna_addr, String atna_addr_dt, Boolean deli_type, String addr_name, String addr_tel) {
        this.addr_id = addr_id;
        this.user_id = user_id;
        this.chk_addr = chk_addr;
        this.add_code = add_code;
        this.stna_addr = stna_addr;
        this.stna_addr_dt = stna_addr_dt;
        this.deli_type = deli_type;
        this.addr_name = addr_name;
        this.addr_tel = addr_tel;
    }

    @Override
    public String toString() {
        return "AddListDto{" +
                "addr_id=" + addr_id +
                ", user_id=" + user_id +
                ", chk_addr=" + chk_addr +
                ", add_code='" + add_code + '\'' +
                ", stna_addr='" + stna_addr + '\'' +
                ", stna_addr_dt='" + stna_addr_dt + '\'' +
                ", deli_type=" + deli_type +
                ", addr_name='" + addr_name + '\'' +
                ", addr_tel='" + addr_tel + '\'' +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof AddrListDto)) return false;
        AddrListDto that = (AddrListDto) o;
        return Objects.equals(getAddr_id(), that.getAddr_id()) && Objects.equals(getUser_id(), that.getUser_id()) && Objects.equals(getChk_addr(), that.getChk_addr()) && Objects.equals(getAdd_code(), that.getAdd_code()) && Objects.equals(getStna_addr(), that.getStna_addr()) && Objects.equals(getStna_addr_dt(), that.getStna_addr_dt()) && Objects.equals(getDeli_type(), that.getDeli_type()) && Objects.equals(getAddr_name(), that.getAddr_name()) && Objects.equals(getAddr_tel(), that.getAddr_tel());
    }

    @Override
    public int hashCode() {
        return Objects.hash(getAddr_id(), getUser_id(), getChk_addr(), getAdd_code(), getStna_addr(), getStna_addr_dt(), getDeli_type(), getAddr_name(), getAddr_tel());
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

    public Boolean getChk_addr() {
        return chk_addr;
    }

    public void setChk_addr(Boolean chk_addr) {
        this.chk_addr = chk_addr;
    }

    public String getAdd_code() {
        return add_code;
    }

    public void setAdd_code(String add_code) {
        this.add_code = add_code;
    }

    public String getStna_addr() {
        return stna_addr;
    }

    public void setStna_addr(String stna_addr) {
        this.stna_addr = stna_addr;
    }

    public String getStna_addr_dt() {
        return stna_addr_dt;
    }

    public void setStna_addr_dt(String stna_addr_dt) {
        this.stna_addr_dt = stna_addr_dt;
    }

    public Boolean getDeli_type() {
        return deli_type;
    }

    public void setDeli_type(Boolean deli_type) {
        this.deli_type = deli_type;
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

}
