package com.devkurly.payment.dto;

import com.devkurly.payment.domain.Payment;
import lombok.Getter;
import lombok.NoArgsConstructor;

import java.util.Date;

@Getter
@NoArgsConstructor
public class PaymentResponseDto {
    private Integer ord_id;
    private Integer user_id;
    private String setl_cd;
    private String setl_stus_cd;
    private Integer all_amt;
    private Integer all_dc_amt;
    private Integer dlvr_amt;
    private Date in_date;

    public PaymentResponseDto(Payment payment) {
        this.ord_id = payment.getOrd_id();
        this.user_id = payment.getUser_id();
        this.setl_cd = payment.getSetl_cd();
        this.setl_stus_cd = payment.getSetl_stus_cd();
        this.all_amt = payment.getAll_amt();
        this.all_dc_amt = payment.getAll_dc_amt();
        this.dlvr_amt = payment.getDlvr_amt();
        this.in_date = payment.getIn_date();
    }
}
