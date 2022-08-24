package com.devkurly.order.dto;

import com.devkurly.order.domain.Order;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.validation.constraints.*;

@Getter
@Setter
@NoArgsConstructor
@ValidOrderForm
public class OrderSaveRequestDto {

    @NotNull
    private Integer user_id;
    @NotNull
    private Integer addr_id;
    @NotNull
    private Integer coupn_id;
    private String stus_cd;
    private String req_plc_cd;
    private String req_dtls;
    private Integer used_acamt;
    private Boolean dlvr_yn;

    @Builder
    public OrderSaveRequestDto(Integer user_id, Integer addr_id, Integer coupn_id, String stus_cd, String req_plc_cd, String req_dtls, Integer used_acamt, Boolean dlvr_yn) {
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
                .user_id(user_id)
                .addr_id(addr_id)
                .stus_cd(stus_cd)
                .req_plc_cd(req_plc_cd)
                .req_dtls(req_dtls)
                .used_acamt(used_acamt)
                .dlvr_yn(dlvr_yn)
                .build();
    }
}
