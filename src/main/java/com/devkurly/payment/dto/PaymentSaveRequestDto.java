package com.devkurly.payment.dto;

import com.devkurly.payment.domain.Payment;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class PaymentSaveRequestDto {

    private Integer ord_id;
    private Integer user_id;
    private String setl_cd;
    private String setl_stus_cd;
    private Integer all_amt;
    private Integer all_dc_amt;
    private Integer dlvr_amt;

    public void savePayment(Integer ord_id, Integer user_id) {
        this.ord_id = ord_id;
        this.user_id = user_id;
    }

    @Builder
    public PaymentSaveRequestDto(Integer ord_id, Integer user_id, String setl_cd, String setl_stus_cd, Integer all_amt, Integer all_dc_amt, Integer dlvr_amt) {
        this.ord_id = ord_id;
        this.user_id = user_id;
        this.setl_cd = setl_cd;
        this.setl_stus_cd = setl_stus_cd;
        this.all_amt = all_amt;
        this.all_dc_amt = all_dc_amt;
        this.dlvr_amt = dlvr_amt;
    }

    public Payment toEntity() {
        return Payment.builder()
                .ord_id(ord_id)
                .user_id(user_id)
                .setl_cd(setl_cd)
                .setl_stus_cd(setl_stus_cd)
                .all_amt(all_amt)
                .all_dc_amt(all_dc_amt)
                .dlvr_amt(dlvr_amt)
                .build();
    }
}
