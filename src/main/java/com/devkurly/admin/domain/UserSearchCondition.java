package com.devkurly.admin.domain;

import org.springframework.web.util.UriComponentsBuilder;

public class UserSearchCondition {
    private Integer page = 1;
    private Integer pageSize = 10;
    private Integer offset = 0;
    private String keyword = "";
    private String option = "";

    public UserSearchCondition(){}
    public UserSearchCondition(Integer page, Integer pageSize, String keyword, String option) {
        this.page = page;
        this.pageSize = pageSize;
        this.keyword = keyword;
        this.option = option;
    }

    public String getQueryString(Integer page) {
        return UriComponentsBuilder.newInstance()
                .queryParam("page", page)
                .queryParam("pageSize", sc.getPageSize())
                .queryParam("option", sc.getOption())
                .queryParam("keyword", sc.getKeyword())
                .build().toString();
    }
    public String getQueryString() {
        return getQueryString(sc.getPage());
    }

    public Integer getPage() {
        return page;
    }

    public void setPage(Integer page) {
        this.page = page;
    }

    public Integer getPageSize() {
        return pageSize;
    }

    public void setPageSize(Integer pageSize) {
        this.pageSize = pageSize;
    }

    public Integer getOffset() {
        return offset;
    }

    public void setOffset(Integer offset) {
        this.offset = offset;
    }

    public String getKeyword() {
        return keyword;
    }

    public void setKeyword(String keyword) {
        this.keyword = keyword;
    }

    public String getOption() {
        return option;
    }

    public void setOption(String option) {
        this.option = option;
    }

    @Override
    public String toString() {
        return "UserSearchCondition{" +
                "page=" + page +
                ", pageSize=" + pageSize +
                ", offset=" + offset +
                ", keyword='" + keyword + '\'' +
                ", option='" + option + '\'' +
                '}';
    }
}
