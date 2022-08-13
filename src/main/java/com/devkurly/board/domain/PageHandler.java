package com.devkurly.board.domain;

public class PageHandler {
    private int page = 1;
    private int pageSize = 10;
    private int totalCnt;
    private int totalPage;
    private int beginPage;
    private int endPage;
    private boolean showPrev;
    private boolean showNext;
    private int naviSize = 10;

    public PageHandler(int totalCnt, int page, int pageSize) {
        this.totalCnt = totalCnt;
        this.page = page;
        this.pageSize = pageSize;
        doPaging(totalCnt, page, pageSize);
    }

    public void doPaging(int totalCnt, int page, int pageSize) {
        this.totalCnt = totalCnt;
        totalPage = (int)Math.ceil((totalCnt) / (double)pageSize);
        beginPage = (page - 1 / naviSize) * naviSize + 1;
        endPage = Math.min(beginPage + naviSize - 1, totalPage);
        showNext = totalPage != endPage;
        showPrev = beginPage != 1;
    }

    public int getPage() {
        return page;
    }

    public void setPage(int page) {
        this.page = page;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public int getTotalCnt() {
        return totalCnt;
    }

    public void setTotalCnt(int totalCnt) {
        this.totalCnt = totalCnt;
    }

    public int getTotalPage() {
        return totalPage;
    }

    public void setTotalPage(int totalPage) {
        this.totalPage = totalPage;
    }

    public int getBeginPage() {
        return beginPage;
    }

    public void setBeginPage(int beginPage) {
        this.beginPage = beginPage;
    }

    public int getEndPage() {
        return endPage;
    }

    public void setEndPage(int endPage) {
        this.endPage = endPage;
    }

    public boolean isShowPrev() {
        return showPrev;
    }

    public void setShowPrev(boolean showPrev) {
        this.showPrev = showPrev;
    }

    public boolean isShowNext() {
        return showNext;
    }

    public void setShowNext(boolean showNext) {
        this.showNext = showNext;
    }

    public int getNaviSize() {
        return naviSize;
    }

    public void setNaviSize(int naviSize) {
        this.naviSize = naviSize;
    }
}
