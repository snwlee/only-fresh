package com.devkurly.order.domain;

import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class OrderProduct {
    private Integer ord_id;
    private Integer pdt_id;
    private Integer pdt_qty;

    @Builder
    public OrderProduct(Integer ord_id, Integer pdt_id, Integer pdt_qty) {
        this.ord_id = ord_id;
        this.pdt_id = pdt_id;
        this.pdt_qty = pdt_qty;
    }
}
