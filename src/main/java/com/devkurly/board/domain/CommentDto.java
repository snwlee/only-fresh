package com.devkurly.board.domain;

import java.util.Date;
import java.util.Objects;

public class CommentDto {
    private String inq_ans;
    private Integer bbs_id;
    private String gd_cd;
    private Date ans_dt;
    private Date in_date;
    private String in_user;
    private Date up_date;
    private String up_user;

    CommentDto(){}

    public CommentDto(String inq_ans, Integer bbs_id, String gd_cd, Date ans_dt, Date in_date, String in_user, Date up_date, String up_user) {
        this.inq_ans = inq_ans;
        this.bbs_id = bbs_id;
        this.gd_cd = gd_cd;
        this.ans_dt = ans_dt;
        this.in_date = in_date;
        this.in_user = in_user;
        this.up_date = up_date;
        this.up_user = up_user;
    }

    public String getInq_ans() {
        return inq_ans;
    }

    public void setInq_ans(String inq_ans) {
        this.inq_ans = inq_ans;
    }

    public Integer getBbs_id() {
        return bbs_id;
    }

    public void setBbs_id(Integer bbs_id) {
        this.bbs_id = bbs_id;
    }

    public String getGd_cd() {
        return gd_cd;
    }

    public void setGd_cd(String gd_cd) {
        this.gd_cd = gd_cd;
    }

    public Date getAns_dt() {
        return ans_dt;
    }

    public void setAns_dt(Date ans_dt) {
        this.ans_dt = ans_dt;
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
        return "AnswerDto{" +
                "inq_ans='" + inq_ans + '\'' +
                ", bbs_id=" + bbs_id +
                ", gd_cd='" + gd_cd + '\'' +
                ", ans_dt=" + ans_dt +
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
        CommentDto commentDto = (CommentDto) o;
        return Objects.equals(inq_ans, commentDto.inq_ans) && Objects.equals(bbs_id, commentDto.bbs_id) && Objects.equals(gd_cd, commentDto.gd_cd) && Objects.equals(ans_dt, commentDto.ans_dt) && Objects.equals(in_date, commentDto.in_date) && Objects.equals(in_user, commentDto.in_user) && Objects.equals(up_date, commentDto.up_date) && Objects.equals(up_user, commentDto.up_user);
    }

    @Override
    public int hashCode() {
        return Objects.hash(inq_ans, bbs_id, gd_cd, ans_dt, in_date, in_user, up_date, up_user);
    }
}
