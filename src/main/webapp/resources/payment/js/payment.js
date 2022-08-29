
/**
 * 결제 정보 요청
 */
$.ajax({
    type: 'GET',
    url: '/payments/method',
    success: function (result) {
        let paymentMethod;
        switch (result.setl_cd) {
            case 'credit':
                paymentMethod = '신용카드';
                break;
            case 'pay':
                paymentMethod = '간편결제';
                break;
            case 'phone':
                paymentMethod = '휴대폰결제';
                break;
            default:
                paymentMethod = '무통장입금';
        }
        let payment = `
                        <div class="payment_row">
                            <span>결제 수단</span>
                            <span>` + paymentMethod + ` / 일시불</span>
                        </div>
                          `;
        $('#payment').append(payment);
    },
    error: function () {
        alert('결제 중 오류가 발생 했습니다. 장바구니로 돌아갑니다.');
        location.href = '/carts';
    }
});

/**
 * 상품 정보 요청
 */
$.ajax({
    type: 'GET',
    url: '/payments/product',
    datatype: 'json',
    success: function (result) {
        $.each(result, function (index, payProductDto) {
            let product =
                `<div class="product">
                    <img src="` + payProductDto.image + `"
                    alt="" class="product_img"/>
                    <h4>[` + payProductDto.company + `] ` + payProductDto.title + `</h4>
                    <div class="quantity_control_box">
                    <div id="order-qty">` + payProductDto.pdt_qty + ` 개</div>
                    </div>
                    <p id="order-sum" style="margin-bottom: 0px;padding-left: 100px;">
                    ` + (payProductDto.sel_price).toLocaleString() + ` 원</p>
                    </div>`;
            $('#product').append(product);
        })
    },
    error: function () {
        alert('error');
    }
});