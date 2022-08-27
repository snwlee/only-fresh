package com.devkurly.order.dto;

import com.devkurly.order.domain.Order;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class OrderProductResponseDto {
    private Integer ord_id;
    private Integer user_id;
    private Integer coupn_id;
    private String stus_cd;
    private String req_plc_cd;
    private String req_dtls;
    private Integer used_acamt;
    private Boolean dlvr_yn;
    private Integer pdt_id;
    private Integer pdt_qty;

    public OrderProductResponseDto(Order order) {
        this.ord_id = order.getOrd_id();
        this.user_id = order.getUser_id();
        this.coupn_id = order.getCoupn_id();
        this.stus_cd = order.getStus_cd();
        this.req_plc_cd = order.getReq_plc_cd();
        this.req_dtls = order.getReq_dtls();
        this.used_acamt = order.getUsed_acamt();
        this.dlvr_yn = order.getDlvr_yn();
    }
}
