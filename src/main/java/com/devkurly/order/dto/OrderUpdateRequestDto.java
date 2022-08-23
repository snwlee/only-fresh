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
    private Integer all_amt;

    @Builder
    public OrderUpdateRequestDto(Integer ord_id, Integer all_amt) {
        this.ord_id = ord_id;
        this.all_amt = all_amt;
    }

    public OrderUpdateRequestDto(Order order) {
        this.ord_id = order.getOrd_id();
        this.all_amt = order.getAll_amt();
    }

    public Order toEntity() {
        return Order.builder()
                .ord_id(ord_id)
                .all_amt(all_amt)
                .build();
    }

}
