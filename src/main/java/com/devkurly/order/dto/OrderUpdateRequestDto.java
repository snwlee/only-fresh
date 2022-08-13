package com.devkurly.order.dto;

import com.devkurly.order.domain.Order;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class OrderUpdateRequestDto {
    private Integer ord_id;
    private Integer user_id;
    private Integer addr_id;
    private Integer coupn_id;
    private String stus_cd;
    private String req_plc_cd;
    private String req_dtls;
    private Integer used_acamt;
    private Boolean dlvr_yn;

    @Builder
    public OrderUpdateRequestDto(Integer ord_id, Integer user_id, Integer addr_id, Integer coupn_id, String stus_cd, String req_plc_cd, String req_dtls, Integer used_acamt, Boolean dlvr_yn) {
        this.ord_id = ord_id;
        this.user_id = user_id;
        this.addr_id = addr_id;
        this.coupn_id = coupn_id;
        this.stus_cd = stus_cd;
        this.req_plc_cd = req_plc_cd;
        this.req_dtls = req_dtls;
        this.used_acamt = used_acamt;
        this.dlvr_yn = dlvr_yn;
    }

    public Order toEntity() {
        return Order.builder()
                .ord_id(ord_id)
                .user_id(user_id)
                .addr_id(addr_id)
                .coupn_id(coupn_id)
                .stus_cd(stus_cd)
                .req_plc_cd(req_plc_cd)
                .req_dtls(req_dtls)
                .used_acamt(used_acamt)
                .dlvr_yn(dlvr_yn)
                .build();
    }

}
