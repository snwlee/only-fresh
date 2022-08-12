package com.devkurly.product.page;

public class ProductPage {

    private int totalCnt;
    private int pageSize;
    private int page;


    public ProductPage(int totalCnt, int page) {
        this(page);
    }


    public ProductPage(int page) {
        this.page = page;


    }

    public ProductPage(int totalCnt, Integer page, Integer pageSize) {
    }


    @Override
    public String toString() {
        return "PageHandler{" +
                "totalCnt=" + totalCnt +
                ", pageSize=" + pageSize +
                ", page=" + page +
                '}';
    }


    public int getTotalCnt() {
        return totalCnt;
    }

    public void setTotalCnt(int totalCnt) {
        this.totalCnt = totalCnt;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public int getPage() {
        return page;
    }

    public void setPage(int page) {
        this.page = page;
    }


}