package com.devkurly.address.domain;

import java.util.Objects;

public class AddrNewDto {
    private Integer addr_id;
    private Integer user_id;
    private boolean chk_addr;
    private String main_addr;
    private String sub_addr;
    private boolean deli_type; // t:샛별
    private String city_code;	// 샛별 확인여부 도시코드

    public AddrNewDto() { }

    public AddrNewDto(Integer addr_id, Integer user_id, boolean chk_addr, String main_addr, String sub_addr, boolean deli_type, String city_code) {
        this.addr_id = addr_id;
        this.user_id = user_id;
        this.chk_addr = chk_addr;
        this.main_addr = main_addr;
        this.sub_addr = sub_addr;
        this.deli_type = deli_type;
        this.city_code = city_code;
    }

    @Override
    public String toString() {
        return "AddrNewDto{" +
                "addr_id=" + addr_id +
                ", user_id=" + user_id +
                ", chk_addr=" + chk_addr +
                ", main_addr='" + main_addr + '\'' +
                ", sub_addr='" + sub_addr + '\'' +
                ", deli_type=" + deli_type +
                ", city_code='" + city_code + '\'' +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof AddrNewDto)) return false;
        AddrNewDto that = (AddrNewDto) o;
        return chk_addr == that.chk_addr && deli_type == that.deli_type && Objects.equals(addr_id, that.addr_id) && Objects.equals(user_id, that.user_id) && Objects.equals(main_addr, that.main_addr) && Objects.equals(sub_addr, that.sub_addr) && Objects.equals(city_code, that.city_code);
    }

    @Override
    public int hashCode() {
        return Objects.hash(addr_id, user_id, chk_addr, main_addr, sub_addr, deli_type, city_code);
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

    public boolean isChk_addr() {
        return chk_addr;
    }

    public void setChk_addr(boolean chk_addr) {
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

    public boolean isDeli_type() {
        return deli_type;
    }

    public void setDeli_type(boolean deli_type) {
        this.deli_type = deli_type;
    }

    public String getCity_code() {
        return city_code;
    }

    public void setCity_code(String city_code) {
        this.city_code = city_code;
    }
}
