package com.devkurly.coupon.domain;

import java.util.Date;
import java.util.Objects;

public class CouponDto {
    private Integer coupn_id;
    private Integer event_id;
    private String nm;
    private Integer unit_type;
    private Integer ds_max_posbl_amt;
    private String use_cnd;
    private String lmtt_cnd;
    private String func;
    private Integer value;
    private String expi_dd;
    private boolean used;

    public CouponDto() {
    }

    public CouponDto(Integer coupn_id, Integer event_id, String nm, Integer ds_max_posbl_amt, Integer unit_type, String use_cnd, String lmtt_cnd, String func, Integer value, String expi_dd) {
        this.coupn_id = coupn_id;
        this.event_id = event_id;
        this.nm = nm;
        this.ds_max_posbl_amt = ds_max_posbl_amt;
        this.unit_type = unit_type;
        this.use_cnd = use_cnd;
        this.lmtt_cnd = lmtt_cnd;
        this.func = func;
        this.value = value;
        this.expi_dd = expi_dd;
    }

    public CouponDto(Integer event_id, String nm, Integer ds_max_posbl_amt, Integer unit_type, String use_cnd, String lmtt_cnd, String func, Integer value, String expi_dd) {
        this.event_id = event_id;
        this.nm = nm;
        this.ds_max_posbl_amt = ds_max_posbl_amt;
        this.use_cnd = use_cnd;
        this.lmtt_cnd = lmtt_cnd;
        this.unit_type = unit_type;
        this.func = func;
        this.value = value;
        this.expi_dd = expi_dd;
    }

    public CouponDto(Integer event_id, String nm, Integer ds_max_posbl_amt, Integer unit_type, String func, Integer value, String expi_dd) {
        this.event_id = event_id;
        this.nm = nm;
        this.ds_max_posbl_amt = ds_max_posbl_amt;
        this.unit_type = unit_type;
        this.func = func;
        this.value = value;
        this.expi_dd = expi_dd;
    }

    public CouponDto(String nm, Integer ds_max_posbl_amt, Integer unit_type, String use_cnd, String func, Integer value, String expi_dd) {
        this.nm = nm;
        this.ds_max_posbl_amt = ds_max_posbl_amt;
        this.unit_type = unit_type;
        this.use_cnd = use_cnd;
        this.func = func;
        this.value = value;
        this.expi_dd = expi_dd;
    }

    public CouponDto(Integer coupn_id, Integer event_id, String nm, Integer ds_max_posbl_amt, Integer unit_type, String use_cnd, String lmtt_cnd, String func, Integer value, String expi_dd, boolean used) {
        this.coupn_id = coupn_id;
        this.event_id = event_id;
        this.nm = nm;
        this.ds_max_posbl_amt = ds_max_posbl_amt;
        this.unit_type = unit_type;
        this.use_cnd = use_cnd;
        this.lmtt_cnd = lmtt_cnd;
        this.func = func;
        this.value = value;
        this.expi_dd = expi_dd;
        this.used = used;
    }

    @Override
    public int hashCode() {
        return Objects.hash(coupn_id);
    }

    public Integer getCoupn_id() {
        return coupn_id;
    }

    public void setCoupn_id(Integer coupn_id) {
        this.coupn_id = coupn_id;
    }

    public Integer getEvent_id() {
        return event_id;
    }

    public void setEvent_id(Integer event_id) {
        this.event_id = event_id;
    }

    public String getNm() {
        return nm;
    }

    public void setNm(String nm) {
        this.nm = nm;
    }

    public Integer getDs_max_posbl_amt() {
        return ds_max_posbl_amt;
    }

    public void setDs_max_posbl_amt(Integer ds_max_posbl_amt) {
        this.ds_max_posbl_amt = ds_max_posbl_amt;
    }

    public String getUse_cnd() {
        return use_cnd;
    }

    public void setUse_cnd(String use_cnd) {
        this.use_cnd = use_cnd;
    }

    public String getLmtt_cnd() {
        return lmtt_cnd;
    }

    public void setLmtt_cnd(String lmtt_cnd) {
        this.lmtt_cnd = lmtt_cnd;
    }

    public String getFunc() {
        return func;
    }

    public void setFunc(String func) {
        this.func = func;
    }

    public Integer getValue() {
        return value;
    }

    public void setValue(Integer value) {
        this.value = value;
    }

    public String getExpi_dd() {
        return expi_dd;
    }

    public void setExpi_dd(String expi_dd) {
        this.expi_dd = expi_dd;
    }

    public boolean isUsed() {
        return used;
    }

    public void setUsed(boolean used) {
        this.used = used;
    }

    public Integer getUnit_type() {
        return unit_type;
    }

    public void setUnit_type(Integer unit_type) {
        this.unit_type = unit_type;
    }



    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof CouponDto)) return false;
        CouponDto couponDto = (CouponDto) o;
        return coupn_id.equals(couponDto.coupn_id) && event_id.equals(couponDto.event_id);
    }

    @Override
    public String toString() {
        return "CouponDto{" +
                "coupn_id=" + coupn_id +
                ", event_id=" + event_id +
                ", nm='" + nm + '\'' +
                ", unit_type=" + unit_type +
                ", ds_max_posbl_amt=" + ds_max_posbl_amt +
                ", use_cnd='" + use_cnd + '\'' +
                ", lmtt_cnd='" + lmtt_cnd + '\'' +
                ", func='" + func + '\'' +
                ", value=" + value +
                ", expi_dd='" + expi_dd + '\'' +
                ", used=" + used +
                '}';
    }
}
