package com.devkurly.board.domain;

import java.util.Date;
import java.util.Objects;

public class CommentDto {
    private String inq_ans;
    private Integer bbs_id;
    private Date ans_dt;
    private Integer user_id;
    private Date in_date;
    private String in_user;
    private Date up_date;
    private String up_user;

    CommentDto(){}

    public CommentDto(String inq_ans, Integer bbs_id, Integer user_id, String in_user, String up_user) {
        this.inq_ans = inq_ans;
        this.bbs_id = bbs_id;
        this.user_id = user_id;
        this.in_user = in_user;
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

    public Date getAns_dt() {
        return ans_dt;
    }

    public void setAns_dt(Date ans_dt) {
        this.ans_dt = ans_dt;
    }

    public Integer getUser_id() {
        return user_id;
    }

    public void setUser_id(Integer user_id) {
        this.user_id = user_id;
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
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        CommentDto that = (CommentDto) o;
        return Objects.equals(inq_ans, that.inq_ans) && Objects.equals(bbs_id, that.bbs_id) && Objects.equals(ans_dt, that.ans_dt) && Objects.equals(user_id, that.user_id) && Objects.equals(in_date, that.in_date) && Objects.equals(in_user, that.in_user) && Objects.equals(up_date, that.up_date) && Objects.equals(up_user, that.up_user);
    }

    @Override
    public int hashCode() {
        return Objects.hash(inq_ans, bbs_id, ans_dt, user_id, in_date, in_user, up_date, up_user);
    }

    @Override
    public String toString() {
        return "CommentDto{" +
                "inq_ans='" + inq_ans + '\'' +
                ", bbs_id=" + bbs_id +
                ", ans_dt=" + ans_dt +
                ", user_id=" + user_id +
                ", in_date=" + in_date +
                ", in_user='" + in_user + '\'' +
                ", up_date=" + up_date +
                ", up_user='" + up_user + '\'' +
                '}';
    }
}
