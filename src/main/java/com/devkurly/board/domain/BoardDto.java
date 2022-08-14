package com.devkurly.board.domain;

import java.util.Date;
import java.util.Objects;

public class BoardDto {
    private Integer bbs_id;
    private Integer pdt_id;
    private Integer user_id;
    private String bbs_title;
    private String bbs_cn;
    private Integer revw_like;

    private Integer like_no;
    private String revw_img;
    private Date wrt_dt;
    private String user_nm;
    private String bbs_clsf_cd;
    private Date in_date;
    private String in_user;
    private Date up_date;
    private String up_user;

    public BoardDto(){}
    public BoardDto(Integer pdt_id, Integer user_id, String bbs_title, String bbs_cn, Integer revw_like, Integer like_no, String revw_img, String user_nm, String bbs_clsf_cd, String in_user, String up_user) {
        this.pdt_id = pdt_id;
        this.user_id = user_id;
        this.bbs_title = bbs_title;
        this.bbs_cn = bbs_cn;
        this.revw_like = revw_like;
        this.revw_img = revw_img;
        this.user_nm = user_nm;
        this.bbs_clsf_cd = bbs_clsf_cd;
        this.in_user = in_user;
        this.up_user = up_user;
        this.like_no = like_no;
    }

    public Integer getBbs_id() {
        return bbs_id;
    }

    public void setBbs_id(Integer bbs_id) {
        this.bbs_id = bbs_id;
    }

    public Integer getPdt_id() {
        return pdt_id;
    }

    public void setPdt_id(Integer pdt_id) {
        this.pdt_id = pdt_id;
    }

    public Integer getUser_id() {
        return user_id;
    }

    public void setUser_id(Integer user_id) {
        this.user_id = user_id;
    }

    public String getBbs_title() {
        return bbs_title;
    }

    public void setBbs_title(String bbs_title) {
        this.bbs_title = bbs_title;
    }

    public String getBbs_cn() {
        return bbs_cn;
    }

    public void setBbs_cn(String bbs_cn) {
        this.bbs_cn = bbs_cn;
    }

    public Integer getRevw_like() {
        return revw_like;
    }

    public void setRevw_like(Integer revw_like) {
        this.revw_like = revw_like;
    }
    public Integer getLike_no() {
        return like_no;
    }

    public void setLike_no(Integer like_no) {
        this.like_no = like_no;
    }
    public String getRevw_img() {
        return revw_img;
    }

    public void setRevw_img(String revw_img) {
        this.revw_img = revw_img;
    }

    public Date getWrt_dt() {
        return wrt_dt;
    }

    public void setWrt_dt(Date wrt_dt) {
        this.wrt_dt = wrt_dt;
    }

    public String getUser_nm() {
        return user_nm;
    }

    public void setUser_nm(String user_nm) {
        this.user_nm = user_nm;
    }

    public String getBbs_clsf_cd() {
        return bbs_clsf_cd;
    }

    public void setBbs_clsf_cd(String bbs_clsf_cd) {
        this.bbs_clsf_cd = bbs_clsf_cd;
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
    public String toString() {
        return "BoardDto{" +
                "bbs_id=" + bbs_id +
                ", pdt_id=" + pdt_id +
                ", user_id=" + user_id +
                ", bbs_title='" + bbs_title + '\'' +
                ", bbs_cn='" + bbs_cn + '\'' +
                ", revw_like=" + revw_like +
                ", like_no=" + like_no +
                ", revw_img='" + revw_img + '\'' +
                ", wrt_dt=" + wrt_dt +
                ", user_nm='" + user_nm + '\'' +
                ", bbs_clsf_cd='" + bbs_clsf_cd + '\'' +
                ", in_date=" + in_date +
                ", in_user='" + in_user + '\'' +
                ", up_date=" + up_date +
                ", up_user='" + up_user + '\'' +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        BoardDto boardDto = (BoardDto) o;
        return Objects.equals(bbs_id, boardDto.bbs_id) && Objects.equals(pdt_id, boardDto.pdt_id) && Objects.equals(user_id, boardDto.user_id) && Objects.equals(bbs_title, boardDto.bbs_title) && Objects.equals(bbs_cn, boardDto.bbs_cn) && Objects.equals(revw_like, boardDto.revw_like) && Objects.equals(revw_img, boardDto.revw_img) && Objects.equals(wrt_dt, boardDto.wrt_dt) && Objects.equals(user_nm, boardDto.user_nm) && Objects.equals(bbs_clsf_cd, boardDto.bbs_clsf_cd) && Objects.equals(in_date, boardDto.in_date) && Objects.equals(in_user, boardDto.in_user) && Objects.equals(up_date, boardDto.up_date) && Objects.equals(up_user, boardDto.up_user);
    }

    @Override
    public int hashCode() {
        return Objects.hash(bbs_id, pdt_id, user_id, bbs_title, bbs_cn, revw_like, revw_img, wrt_dt, user_nm, bbs_clsf_cd, in_date, in_user, up_date, up_user);
    }
}

