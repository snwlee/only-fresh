package com.devkurly.coupon.domain;

import java.util.Objects;

public class UserCouponDto {
    private Integer user_id;
    private String nm;
    private boolean used;

    public UserCouponDto(){}
    public UserCouponDto(Integer user_id, String nm, boolean used) {
        this.user_id = user_id;
        this.nm = nm;
        this.used = used;
    }
    public UserCouponDto(Integer user_id, String nm){
        this(user_id, nm, false);
    }

    public Integer getUser_id() {
        return user_id;
    }

    public void setUser_id(Integer user_id) {
        this.user_id = user_id;
    }

    public String getNm() {
        return nm;
    }

    public void setNm(String nm) {
        this.nm = nm;
    }

    public boolean isUsed() {
        return used;
    }

    public void setUsed(boolean used) {
        this.used = used;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof UserCouponDto)) return false;
        UserCouponDto that = (UserCouponDto) o;
        return used == that.used && user_id.equals(that.user_id) && nm.equals(that.nm);
    }

    @Override
    public int hashCode() {
        return Objects.hash(user_id, nm, used);
    }
}
