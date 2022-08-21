package com.devkurly.admin.domain;

import java.util.Date;
import java.util.Objects;

public class UserDto {
    private Integer user_id;
    private String user_nm;
    private String user_email;
    private String pwd;
    private String telno;
    private String subs_dt;
    private String gender;
    private String bryr;
    private Integer prvc_arge;
    private Integer user_cls_cd;
    private String rcmdr_email;
    private Integer pnt;

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        UserDto userDto = (UserDto) o;
        return user_id.equals(userDto.user_id);
    }

    @Override
    public int hashCode() {
        return Objects.hash(user_id);
    }

    @Override
    public String toString() {
        return "UserDto{" +
                "user_id=" + user_id +
                ", user_nm='" + user_nm + '\'' +
                ", user_email='" + user_email + '\'' +
                ", pwd='" + pwd + '\'' +
                ", telno='" + telno + '\'' +
                ", subs_dt='" + subs_dt + '\'' +
                ", gender='" + gender + '\'' +
                ", bryr='" + bryr + '\'' +
                ", prvc_arge=" + prvc_arge +
                ", user_cls_cd=" + user_cls_cd +
                ", rcmdr_email='" + rcmdr_email + '\'' +
                ", pnt=" + pnt +
                '}';
    }

    public Integer getUser_id() {
        return user_id;
    }

    public void setUser_id(Integer user_id) {
        this.user_id = user_id;
    }

    public String getUser_nm() {
        return user_nm;
    }

    public void setUser_nm(String user_nm) {
        this.user_nm = user_nm;
    }

    public String getUser_email() {
        return user_email;
    }

    public void setUser_email(String user_email) {
        this.user_email = user_email;
    }

    public String getPwd() {
        return pwd;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd;
    }

    public String getTelno() {
        return telno;
    }

    public void setTelno(String telno) {
        this.telno = telno;
    }

    public String getSubs_dt() {
        return subs_dt;
    }

    public void setSubs_dt(String subs_dt) {
        this.subs_dt = subs_dt;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getBryr() {
        return bryr;
    }

    public void setBryr(String bryr) {
        this.bryr = bryr;
    }

    public Integer getPrvc_arge() {
        return prvc_arge;
    }

    public void setPrvc_arge(Integer prvc_arge) {
        this.prvc_arge = prvc_arge;
    }

    public Integer getUser_cls_cd() {
        return user_cls_cd;
    }

    public void setUser_cls_cd(Integer user_cls_cd) {
        this.user_cls_cd = user_cls_cd;
    }

    public String getRcmdr_email() {
        return rcmdr_email;
    }

    public void setRcmdr_email(String rcmdr_email) {
        this.rcmdr_email = rcmdr_email;
    }

    public Integer getPnt() {
        return pnt;
    }

    public void setPnt(Integer pnt) {
        this.pnt = pnt;
    }

    public UserDto(Integer user_id, String user_nm, String user_email, String pwd, String telno, String subs_dt, String gender, String bryr, Integer prvc_arge, Integer user_cls_cd, String rcmdr_email, Integer pnt) {
        this.user_id = user_id;
        this.user_nm = user_nm;
        this.user_email = user_email;
        this.pwd = pwd;
        this.telno = telno;
        this.subs_dt = subs_dt;
        this.gender = gender;
        this.bryr = bryr;
        this.prvc_arge = prvc_arge;
        this.user_cls_cd = user_cls_cd;
        this.rcmdr_email = rcmdr_email;
        this.pnt = pnt;
    }

    // constructor(all)
    public UserDto() {}

}




