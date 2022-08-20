package com.devkurly.event.domain;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;
import java.util.Objects;

public class EventDto {
    private Integer event_id;
    private String nm;
    private String des;
    private String photo;
    private String photo_alt;
    private Integer cat_cd;
    private String setl_methd_cd;
    private Date stpt_dd;
    private Date expi_dd;
    private Integer early_end_stus;
    private Integer ds_rate;

    public EventDto() {
    }

    // event_id 를 AUTO INCREMENT 로 적용되게
    public EventDto(String nm, String des, String photo, String photo_alt, Integer cat_cd, String setl_methd_cd, String stpt_dd, String expi_dd, Integer early_end_stus, Integer ds_rate) throws Exception {
        this.nm = nm;
        this.des = des;
        this.photo = photo;
        this.photo_alt = photo_alt;
        this.cat_cd = cat_cd;
        this.setl_methd_cd = setl_methd_cd;
        this.stpt_dd = dateFormatter(stpt_dd);
        this.expi_dd = dateFormatter(expi_dd);
        this.early_end_stus = early_end_stus;
        this.ds_rate = ds_rate;
    }

    // event_id 를 직접 지정해서 집어넣기
    public EventDto(Integer event_id, String nm, String des, String photo, String photo_alt, Integer cat_cd, String setl_methd_cd, String stpt_dd, String expi_dd, Integer early_end_stus, Integer ds_rate) throws Exception {
        this.event_id = event_id;
        this.nm = nm;
        this.des = des;
        this.photo = photo;
        this.photo_alt = photo_alt;
        this.cat_cd = cat_cd;
        this.setl_methd_cd = setl_methd_cd;
        this.stpt_dd = dateFormatter(stpt_dd);
        this.expi_dd = dateFormatter(expi_dd);
        this.early_end_stus = early_end_stus;
        this.ds_rate = ds_rate;
    }

    public EventDto(Integer event_id, String nm, String des, String photo, String photo_alt, Integer cat_cd, String setl_methd_cd, Date stpt_dd, Date expi_dd, Integer early_end_stus, Integer ds_rate) {
        this.event_id = event_id;
        this.nm = nm;
        this.des = des;
        this.photo = photo;
        this.photo_alt = photo_alt;
        this.cat_cd = cat_cd;
        this.setl_methd_cd = setl_methd_cd;
        this.stpt_dd = stpt_dd;
        this.expi_dd = expi_dd;
        this.early_end_stus = early_end_stus;
        this.ds_rate = ds_rate;
    }

    private Date dateFormatter(String yyyymmdd) throws Exception {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd", Locale.KOREA);
        return dateFormat.parse(yyyymmdd);
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

    public String getDes() {
        return des;
    }

    public void setDes(String des) {
        this.des = des;
    }

    public Integer getCat_cd() {
        return cat_cd;
    }

    public void setCat_cd(Integer cat_cd) {
        this.cat_cd = cat_cd;
    }

    public String getSetl_methd_cd() {
        return setl_methd_cd;
    }

    public void setSetl_methd_cd(String setl_methd_cd) {
        this.setl_methd_cd = setl_methd_cd;
    }

    public Date getStpt_dd() {
        return stpt_dd;
    }

    public void setStpt_dd(String stpt_dd) {
        try {
            this.stpt_dd = dateFormatter(stpt_dd);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    public void setStpt_dd(Date stpt_dd) {
        this.stpt_dd = stpt_dd;
    }

    public Date getExpi_dd() {
        return expi_dd;
    }

    public void setExpi_dd(String expi_dd) {
        try {
            this.expi_dd = dateFormatter(expi_dd);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    public void setExpi_dd(Date expi_dd) {
        this.expi_dd = expi_dd;
    }

    public Integer getEarly_end_stus() {
        return early_end_stus;
    }

    public void setEarly_end_stus(Integer early_end_stus) {
        this.early_end_stus = early_end_stus;
    }

    public Integer getDs_rate() {
        return ds_rate;
    }

    public void setDs_rate(Integer ds_rate) {
        this.ds_rate = ds_rate;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof EventDto)) return false;
        EventDto eventDto = (EventDto) o;
        return event_id.equals(eventDto.event_id);
    }

    @Override
    public int hashCode() {
        return Objects.hash(event_id);
    }

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }

    public String getPhoto_alt() {
        return photo_alt;
    }

    public void setPhoto_alt(String photo_alt) {
        this.photo_alt = photo_alt;
    }

    @Override
    public String toString() {
        return "EventDto{" +
                "event_id=" + event_id +
                ", nm='" + nm + '\'' +
                ", des='" + des + '\'' +
                ", photo='" + photo + '\'' +
                ", photo_alt='" + photo_alt + '\'' +
                ", cat_cd='" + cat_cd + '\'' +
                ", setl_methd_cd='" + setl_methd_cd + '\'' +
                ", stpt_dd=" + stpt_dd +
                ", expi_dd=" + expi_dd +
                ", early_end_stus=" + early_end_stus +
                ", ds_rate=" + ds_rate +
                '}';
    }
}
