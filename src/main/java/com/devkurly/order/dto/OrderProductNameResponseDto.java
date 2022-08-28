package com.devkurly.order.dto;

import com.devkurly.order.domain.Order;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class OrderProductNameResponseDto {
    private Integer ord_id;
    private Integer pdt_id;
    private Integer pdt_qty;
    private Integer price;
    private String image;
    private Integer sel_price;
    private String title;
    private Integer stock;
    private String company;

    @Builder
    public OrderProductNameResponseDto(Integer ord_id, Integer pdt_id, Integer pdt_qty, Integer price, String image, Integer sel_price, String title, Integer stock, String company) {
        this.ord_id = ord_id;
        this.pdt_id = pdt_id;
        this.pdt_qty = pdt_qty;
        this.price = price;
        this.image = image;
        this.sel_price = sel_price;
        this.title = title;
        this.stock = stock;
        this.company = company;
    }

}
