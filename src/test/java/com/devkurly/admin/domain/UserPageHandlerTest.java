//package com.devkurly.admin.domain;
//
//import org.junit.Test;
//
//import static org.junit.Assert.*;
//
//public class UserPageHandlerTest {
//    @Test
//    public void test() {
//        UserPageHandler ph = new UserPageHandler(250,1);
//        ph.print();
//        System.out.println("ph = " + ph);
//        assertTrue(ph.beginPage==1);
//        assertTrue(ph.endPage==10);
//    }
//
//    @Test
//    public void test2() {
//        UserPageHandler ph = new UserPageHandler(250,11);
//        ph.print();
//        System.out.println("ph = " + ph);
//        assertTrue(ph.beginPage==11);
//        assertTrue(ph.endPage==20);
//    }
//
//    @Test
//    public void test3() {
//        UserPageHandler ph = new UserPageHandler(255,25);
//        ph.print();
//        System.out.println("ph = " + ph);
//        assertTrue(ph.beginPage==21);
//        assertTrue(ph.endPage==26);
//    }
//}