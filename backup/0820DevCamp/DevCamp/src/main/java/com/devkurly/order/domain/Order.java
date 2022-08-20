package com.devkurly.order.domain;

import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class Order {
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
    public Order(Integer ord_id, Integer user_id, Integer addr_id, Integer coupn_id, String stus_cd, String req_plc_cd, String req_dtls, Integer used_acamt, Boolean dlvr_yn) {
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
}
