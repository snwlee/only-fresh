package com.devkurly.cart.service;

import com.devkurly.cart.domain.Cart;
import com.devkurly.cart.dto.CartProductResponseDto;
import com.devkurly.cart.dto.CartSaveRequestDto;
import com.devkurly.cart.exception.DuplicateCartException;
import com.devkurly.cart.exception.EmptyCartException;
import com.devkurly.cart.exception.ErrorCode;
import com.devkurly.cart.exception.OutOfStockException;
import com.devkurly.mapper.CartMapper;
import com.devkurly.product.domain.ProductDto;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.Optional;
import java.util.Random;

@Service
@RequiredArgsConstructor
public class CartService {
    private final CartMapper cartMapper;

    /**
     * temp
     */
    @Transactional
    public Cart viewCart(Cart cart) {
        return cartMapper.findByCart(cart);
    }

    /**
     * temp
     */
    @Transactional
    public List<Cart> viewAllCart(Integer user_id) {
        return cartMapper.findAllByUserId(user_id);
    }

    @Transactional
    public List<CartProductResponseDto> viewCartProduct(Integer user_id) {
        return Optional.ofNullable(cartMapper.joinCartProductByUserId(user_id)).orElseThrow(() -> new EmptyCartException("장바구니가 비어 있습니다.", ErrorCode.EMPTY_CART_PRODUCT));
    }

    @Transactional
    public ProductDto checkProductStock(Cart cart) {
        ProductDto productDto = cartMapper.findProductByPdtId(cart.getPdt_id());
        Integer stock = productDto.getStock();
        if (cart.getPdt_qty() > stock) {
            throw new OutOfStockException("제품 재고가 부족합니다.", ErrorCode.OUT_OF_STOCK);
        }
        return productDto;
    }

    @Transactional
    public Integer addCart(CartSaveRequestDto requestDto) {
        try {
            Optional.ofNullable(cartMapper.findByCart(requestDto.toEntity()))
                    .ifPresent((cart -> {
                        throw new DuplicateCartException("이미 장바구니에 제품이 있습니다.", ErrorCode.DUPLICATE_CART_PRODUCT);
                    }));
            return cartMapper.insert(requestDto.toEntity());
        } catch (DuplicateCartException e) {
            requestDto.setPdt_qty(cartMapper.findByCart(requestDto.toEntity()).getPdt_qty() + 1);
        } catch (Exception e) {
            throw new RuntimeException();
        }
        return cartMapper.update(requestDto.toEntity());
    }

    public int getCookieId(Cookie tempCart, HttpServletResponse response) {
        int id;
        if (tempCart == null) {
            Random random = new Random();
            int randomNumber = random.nextInt(10000);
            // (예정) 중복 확인 후 재랜덤 결정
            Cookie newTempCart = new Cookie("tempCart", Integer.toString(randomNumber));
            response.addCookie(newTempCart);
            id = Integer.parseInt(newTempCart.getValue());
        } else {
            id = Integer.parseInt(tempCart.getValue());
        }
        return id;
    }

    @Transactional
    public Integer modifyCart(Cart cart) {
        return cartMapper.update(cart);
    }

    @Transactional
    public Integer removeOneCart(Cart cart) {
        return cartMapper.deleteOne(cart);
    }

    @Transactional
    public void removeCheckedCart(List<Cart> cartList) {
        for (Cart cart : cartList) {
            cartMapper.deleteOne(cart);
        }
    }

    @Transactional
    public Integer removeCart(Integer user_id) {
        return cartMapper.delete(user_id);
    }


}
