package com.devkurly.product.handler;

import org.junit.Test;

import static org.junit.Assert.*;

public class handlerTest {
    @Test
    public void test() {
        handler ph = new handler(250,1);
        ph.print();
        System.out.println("ph = " + ph);
        assertTrue(ph.getBeginPage() ==1);
        assertTrue(ph.getEndPage() ==10);
    }


    @Test
    public void test2() {
        handler ph = new handler(250,11);
        ph.print();
        System.out.println("ph = " + ph);
        assertTrue(ph.getBeginPage() ==11);
        assertTrue(ph.getEndPage() ==20);
    }


    @Test
    public void test3() {
        handler ph = new handler(255,25 );
        ph.print();
        System.out.println("ph = " + ph);
        assertTrue(ph.getBeginPage() ==21);
        assertTrue(ph.getEndPage() ==26);
    }
}