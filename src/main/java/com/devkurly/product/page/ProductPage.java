package com.devkurly.product.page;

public class ProductPage {

    private int totalCnt = 10000;
    private int pageSize = 1000;
    private int page = 100;


    public ProductPage(int totalCnt, int page) {
        this(page);
    }


    public ProductPage(int page) {
        this.page = page;


    }

    public ProductPage(Integer page) {
    }


    @Override
    public String toString() {
        return ", page=" + page +
                '}';
    }


    public int getPage() {
        return page;
    }

    public void setPage(int page) {
        this.page = page;
    }


}