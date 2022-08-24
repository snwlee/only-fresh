package com.devkurly.cart.service;

import com.devkurly.cart.domain.Cart;
import com.devkurly.cart.dto.CartProductResponseDto;
import com.devkurly.cart.dto.CartSaveRequestDto;
import com.devkurly.cart.exception.DuplicateCartException;
import com.devkurly.cart.exception.EmptyCartException;
import com.devkurly.cart.exception.OutOfStockException;
import com.devkurly.global.ErrorCode;
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
@Transactional
@RequiredArgsConstructor
public class CartService {
    private final CartMapper cartMapper;

    /**
     * temp
     */
    @Transactional(readOnly = true)
    public Cart viewCart(Cart cart) {
        return cartMapper.findByCart(cart);
    }

    /**
     * temp
     */
    @Transactional(readOnly = true)
    public List<Cart> viewAllCart(Integer user_id) {
        return cartMapper.findAllByUserId(user_id);
    }

    @Transactional(readOnly = true)
    public List<Cart> viewCheckedCart(CartSaveRequestDto requestDto) {
        List<Cart> cartList = cartMapper.findCheckedByCart(requestDto.toEntity());
        if (cartList.isEmpty()) {
            throw new EmptyCartException("장바구니가 비어 있습니다.", ErrorCode.EMPTY_CART_PRODUCT);
        }
        return cartList;
    }

    @Transactional(readOnly = true)
    public List<CartProductResponseDto> viewCheckedCartProduct(CartSaveRequestDto requestDto) {
        return cartMapper.joinCartProductByCart(requestDto.toEntity());
    }

    @Transactional(readOnly = true)
    public List<CartProductResponseDto> viewCartProduct(Integer user_id) {
        return Optional.ofNullable(cartMapper.joinCartProductByUserId(user_id)).orElseThrow(() -> new EmptyCartException("장바구니가 비어 있습니다.", ErrorCode.EMPTY_CART_PRODUCT));
    }

    @Transactional(readOnly = true)
    public ProductDto checkProductStock(Cart cart) {
        ProductDto productDto = cartMapper.findProductByPdtId(cart.getPdt_id());
        Integer stock = productDto.getStock();
        if (cart.getPdt_qty() > stock) {
            throw new OutOfStockException("제품 재고가 부족합니다.", ErrorCode.OUT_OF_STOCK);
        }
        return productDto;
    }

    public Integer addCart(CartSaveRequestDto requestDto) {
        try {
            Optional.ofNullable(cartMapper.findByCart(requestDto.toEntity()))
                    .ifPresent((cart -> {
                        throw new DuplicateCartException("이미 장바구니에 제품이 있습니다.", ErrorCode.DUPLICATE_CART_PRODUCT);
                    }));
            return cartMapper.save(requestDto.toEntity());
        } catch (DuplicateCartException e) {
            requestDto.setPdt_qty(cartMapper.findByCart(requestDto.toEntity()).getPdt_qty() + requestDto.getPdt_qty());
        } catch (Exception e) {
            throw new RuntimeException();
        }
        return cartMapper.update(requestDto.toEntity());
    }

    public int getCookieId(Cookie tempCart, HttpServletResponse response) {
        int id;
        if (Optional.ofNullable(tempCart).isPresent()) {
            id = Integer.parseInt(tempCart.getValue());
        } else {
            int randomNumber;
            do {
                Random random = new Random();
                randomNumber = random.nextInt(1000000);
                // (예정) 중복 확인 후 재랜덤 결정
                try {
                    Optional.ofNullable(cartMapper.findById(randomNumber))
                            .ifPresent(cookieNumber -> {
                                throw new ArithmeticException();
                            });
                    break;
                } catch (Exception ignored) {

                }
            } while (true);
            Cookie newTempCart = new Cookie("tempCart", Integer.toString(randomNumber));
            newTempCart.setPath("/");
            response.addCookie(newTempCart);
            id = Integer.parseInt(newTempCart.getValue());
        }
        return id;
    }

    public Integer modifyCart(Cart cart) {
        return cartMapper.update(cart);
    }

    public Integer removeOneCart(Cart cart) {
        return cartMapper.deleteOne(cart);
    }

    public void removeCheckedCart(List<Cart> cartList) {
        for (Cart cart : cartList) {
            cartMapper.deleteOne(cart);
        }
    }

    public Integer removeCart(Integer user_id) {
        return cartMapper.delete(user_id);
    }


}
