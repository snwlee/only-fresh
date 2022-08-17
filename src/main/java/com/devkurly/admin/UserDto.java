package com.devkurly.admin;

import java.util.Date;
import java.util.Objects;

public class UserDto {
    private Integer user_id;
    private String user_nm;
    private String user_email;
    private String pwd;
    private Integer telno;
    private Date subs_dt;
    private String gender;
    private Date bryr;
    private Integer prvc_arge;
    private Integer user_cls_cd;
    private String rcmdr_email;
    private Integer pnt;
    private Date in_date;
    private String in_user;
    private Date up_date;
    private String up_user;


    // constructor(all)
    public UserDto() {}
    public UserDto(Integer user_id, String user_nm, String user_email, String pwd, Integer telno, Date subs_dt, String gender, Date bryr, Integer prvc_arge, Integer user_cls_cd, String rcmdr_email, Integer pnt, Date in_date, String in_user, Date up_date, String up_user) {
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
        this.in_date = in_date;
        this.in_user = in_user;
        this.up_date = up_date;
        this.up_user = up_user;
    }

    // getters and setters(all)
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

    public Integer getTelno() {
        return telno;
    }

    public void setTelno(Integer telno) {
        this.telno = telno;
    }

    public Date getSubs_dt() {
        return subs_dt;
    }

    public void setSubs_dt(Date subs_dt) {
        this.subs_dt = subs_dt;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public Date getBryr() {
        return bryr;
    }

    public void setBryr(Date bryr) {
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


    // toString(all)
    @Override
    public String toString() {
        return "UserDto{" +
                "user_id=" + user_id +
                ", user_nm='" + user_nm + '\'' +
                ", user_email='" + user_email + '\'' +
                ", pwd='" + pwd + '\'' +
                ", telno=" + telno +
                ", subs_dt=" + subs_dt +
                ", gender='" + gender + '\'' +
                ", bryr=" + bryr +
                ", prvc_arge=" + prvc_arge +
                ", user_cls_cd=" + user_cls_cd +
                ", rcmdr_email='" + rcmdr_email + '\'' +
                ", pnt=" + pnt +
                ", in_date=" + in_date +
                ", in_user='" + in_user + '\'' +
                ", up_date=" + up_date +
                ", up_user='" + up_user + '\'' +
                '}';
    }


    // equals & hashCode
    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        UserDto userDto = (UserDto) o;
        return Objects.equals(user_id, userDto.user_id) && Objects.equals(user_nm, userDto.user_nm) && Objects.equals(user_email, userDto.user_email) && Objects.equals(pwd, userDto.pwd) && Objects.equals(telno, userDto.telno) && Objects.equals(subs_dt, userDto.subs_dt) && Objects.equals(gender, userDto.gender) && Objects.equals(bryr, userDto.bryr) && Objects.equals(prvc_arge, userDto.prvc_arge) && Objects.equals(user_cls_cd, userDto.user_cls_cd) && Objects.equals(rcmdr_email, userDto.rcmdr_email) && Objects.equals(pnt, userDto.pnt) && Objects.equals(in_date, userDto.in_date) && Objects.equals(in_user, userDto.in_user) && Objects.equals(up_date, userDto.up_date) && Objects.equals(up_user, userDto.up_user);
    }

    @Override
    public int hashCode() {
        return Objects.hash(user_id, user_nm, user_email, pwd, telno, subs_dt, gender, bryr, prvc_arge, user_cls_cd, rcmdr_email, pnt, in_date, in_user, up_date, up_user);
    }
}




