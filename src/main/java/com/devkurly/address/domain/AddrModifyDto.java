package com.devkurly.address.domain;

import java.util.Objects;

public class AddrModifyDto {
    private Integer addr_id;
    private Integer user_id;
    private String main_addr;
    private String sub_addr;
    private String addr_name;
    private String addr_tel;
    private Boolean chk_addr;
    private Boolean deli_type;
    private String city_code;

    public AddrModifyDto() { }

    public AddrModifyDto(Integer addr_id, Integer user_id, String main_addr, String sub_addr, String addr_name, String addr_tel, Boolean chk_addr, Boolean deli_type, String city_code) {
        this.addr_id = addr_id;
        this.user_id = user_id;
        this.main_addr = main_addr;
        this.sub_addr = sub_addr;
        this.addr_name = addr_name;
        this.addr_tel = addr_tel;
        this.chk_addr = chk_addr;
        this.deli_type = deli_type;
        this.city_code = city_code;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof AddrModifyDto)) return false;
        AddrModifyDto that = (AddrModifyDto) o;
        return Objects.equals(addr_id, that.addr_id) && Objects.equals(user_id, that.user_id) && Objects.equals(main_addr, that.main_addr) && Objects.equals(sub_addr, that.sub_addr) && Objects.equals(addr_name, that.addr_name) && Objects.equals(addr_tel, that.addr_tel) && Objects.equals(chk_addr, that.chk_addr) && Objects.equals(deli_type, that.deli_type) && Objects.equals(city_code, that.city_code);
    }

    @Override
    public int hashCode() {
        return Objects.hash(addr_id, user_id, main_addr, sub_addr, addr_name, addr_tel, chk_addr, deli_type, city_code);
    }

    @Override
    public String toString() {
        return "AddrModifyDto{" +
                "addr_id=" + addr_id +
                ", user_id=" + user_id +
                ", main_addr='" + main_addr + '\'' +
                ", sub_addr='" + sub_addr + '\'' +
                ", addr_name='" + addr_name + '\'' +
                ", addr_tel='" + addr_tel + '\'' +
                ", chk_addr=" + chk_addr +
                ", deli_type=" + deli_type +
                ", city_code='" + city_code + '\'' +
                '}';
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

    public Boolean getChk_addr() {
        return chk_addr;
    }

    public void setChk_addr(Boolean chk_addr) {
        this.chk_addr = chk_addr;
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
}
