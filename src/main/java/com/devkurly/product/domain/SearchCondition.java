package com.devkurly.product.domain;

import org.springframework.web.util.UriComponentsBuilder;

public class SearchCondition {

    private Integer page = 1;
    private Integer PageSize = 12;
    private Integer offset = 0;
    private String keyword = "";
    private String option = "";
    private String order_sc;
    private String cat_code;
    private String AscBtn;
    private String DescBtn;

    public SearchCondition(){}
    public SearchCondition(Integer page, Integer pageSize, String keyword, String option) {
        this.page = page;
        PageSize = pageSize;
        this.keyword = keyword;
        this.option = option;
    }

    public String getQueryString(Integer page) {
        return UriComponentsBuilder.newInstance()
                .queryParam("page", page)
                .queryParam("pageSize", PageSize)
                .queryParam("option", option)
                .queryParam("keyword", keyword)
                .build().toString();
    }
    public String getQueryString(){
        return getQueryString(page);
    }



    public Integer getPage() {
        return page;
    }

    public void setPage(Integer page) {
        this.page = page;
    }

    public Integer getPageSize() {
        return PageSize;
    }

    public void setPageSize(Integer pageSize) {
        PageSize = pageSize;
    }

    public Integer getOffset() {
        return (page-1) * PageSize;
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

    public String getOrder_sc() {
        return order_sc;
    }

    public void setOrder_sc(String order_sc) {
        this.order_sc = order_sc;
    }

    public String getCat_code() {
        return cat_code;
    }

    public void setCat_code(String cat_code) {
        this.cat_code = cat_code;
    }

    @Override
    public String toString() {
        return "SearchCondition{" +
                "page=" + page +
                ", PageSize=" + PageSize +
                ", offset=" + offset +
                ", keyword='" + keyword + '\'' +
                ", option='" + option + '\'' +
                '}';
    }
}


