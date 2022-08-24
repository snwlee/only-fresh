<%--
  Created by IntelliJ IDEA.
  User: iseon-u
  Date: 2022/08/10
  Time: 10:22 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set
        var="signInOut"
        value="${sessionScope.memberResponse==null ? '로그인' : '로그아웃'}"
/>
<c:set
        var="signInOutLink"
        value="${sessionScope.memberResponse==null ? '/members' : '/members/signout'}"
/>
<c:set
        var="name"
        value="${sessionScope.memberResponse==null ? '회원가입' : sessionScope.memberResponse.user_nm}"
/>
<c:set
        var="nameLink"
        value="${sessionScope.memberResponse==null ? '/members/signup' : '/mypage/coupon'}"
/>
<html>
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>[${productDetailDto.company}] ${productDetailDto.title} :: DevKurly</title>
  <link rel="stylesheet" type="text/css" href="/product_detail/reset.css">
  <link rel="stylesheet" type="text/css" href="/navigation_detail.css">
  <link rel="stylesheet" type="text/css" href="/product_detail/product_detail.css?after">
  <link rel="stylesheet" type="text/css" href="/footer.css">
  <style>
    #whole_container {
      width: 100%;
      height: 100vh;
    }

    #content_body {
      display: flex;
      justify-content: space-between;
      flex-wrap: wrap;
      padding: 0 200 0 200;
    }

    .content {
      width: 400px;
      border: 1px solid #8b00ff;
    }

    button {
      width: 200px;
      height: 100px;
    }
    .board_margin{
      margin-bottom: 200px;
    }

    #content {
      display: flex;
      flex-direction: column;
      justify-content: center;
      padding: 30 200 160 200;
    }
    #review_board{
      position: relative;
      padding-bottom: 80.25%;
    }
    #inquiry_board{
      position: relative;
      padding-bottom: 80.25%;
    }
    iframe{
      position: absolute;
      top:0;
      left:0;
      width:100%;
      height:100%;
    }
    a{
      text-decoration:none;
    }

    /* input {
        width: 80%;
    } */
  </style>
  <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
</head>

<body>
<div id="whole_container">
  <div id="navigation">
    <div id="signup_signin_container">
      <div id="signup_signin">
        <a id="signup"href="${nameLink}">${name}</a>
        <div></div>
        <a id="signin"href="${signInOutLink}">${signInOut}</a>
        <div></div>
        <a id="cust">고객센터</a>
      </div>
    </div>
    <div id="search">
      <div id="search_first">
        <img style="width:82px; height: 42px" src="/product_detail/logo.png" alt="logo" />
        <a href="/DevKurly">마켓컬리</a>
        <div></div>
        <a href="/DevKurly">뷰티컬리</a>
      </div>
      <div id="input_container">
        <input placeholder="검색어를 입력해주세요" />
        <img src="/product_detail/imgs/loupe.png" style="width: 20px; height: 20px" />
      </div>
      <div id="icon_container">
        <img src="/product_detail/imgs/location.png" />
        <img src="/product_detail/imgs/heart.png" />
        <a href="carts/"><img src="/main/imgs/shopping-cart.png" /></a>
      </div>
    </div>
    <div id="menubar">
      <div id="category_container">
        <img src="" />
        <p style="width: 80px;" id="show_category_button">카테고리</p>
      </div>
      <div id="menus">
        <a href="/product/newlist?sort=1&page=1&pageSize=12&option=&keyword=">신상품</a>
        <a href="/product/newlist?sort=2&page=1&pageSize=12&option=&keyword=">베스트</a>
        <a href="/product/newlist?sort=3&page=1&pageSize=12&option=&keyword=">알뜰쇼핑</a>
        <a href="/event/main">특가/혜택</a>
      </div>
      <div id="deli_info">
        <span id="purple_deli_info">샛별·낮</span>
        <span id="gray_deli_info">배송안내</span>
      </div>
    </div>
  </div>
  <div id="cat_wrapper">
    <div id="main_cat_container">
      <%--            <li class="cat main_cat">채소</li>--%>
    </div>
    <div id="sub_cat_container">
      <%--            <li class="cat sub_cat">채소</li>--%>
    </div>
  </div>
  <div id="content">
    <div id="detail_container">
      <img id="pdt_img"
           src="${productDetailDto.image}" />
      <div id="detail_price_button_container">
        <p id="is_early_deli">${productDetailDto.de_type==true ? '샛별배송':'낮배송'}</p>
        <h2>[${productDetailDto.company}] ${productDetailDto.title}</h2>
        <p id="sub_title">${productDetailDto.sub_title}</p>
        <div style="margin-bottom: 10px;">
          <span id="ds_rate">${productDetailDto.ds_rate}%</span>
          <span id="sel_price"></span>
          <span id="won">원</span>
        </div>
        <div>
          <span id="price"></span>
        </div>
        <p id="mileage_except">적립 제외 상품입니다.</p> <!-- 여기에 border-bottom 넣기 -->
        <div class="detail_column">
          <div class="column_title">배송</div>
          <div>
            <p class="main_desc">${productDetailDto.de_type==true ? '샛별배송':'낮배송'}</p>
            <p class="sub_desc">23시 전 주문 씨 내일 아침 7시 전 도착</p>
          </div>
        </div>
        <div class="detail_column">
          <div class="column_title">판매자</div>
          <div>
            <p class="main_desc">컬리</p>
          </div>
        </div>
        <div class="detail_column">
          <div class="column_title">포장타입</div>
          <div>
            <p class="main_desc">${productDetailDto.pack_cd}</p>
            <p class="sub_desc">택배배송은 에코 포장이 스티로폼으로 대체됩니다.</p>
          </div>
        </div>
        <div class="detail_column">
          <div class="column_title">판매단위</div>
          <div>
            <p class="main_desc">${productDetailDto.sell_cd}</p>
          </div>
        </div>
        <div class="detail_column">
          <div class="column_title">중량/용량</div>
          <div>
            <p class="main_desc">${productDetailDto.weca_cd}</p>
          </div>
        </div>
        <div class="detail_column">
          <div class="column_title">알레르기정보</div>
          <div>
            <p class="main_desc">${productDetailDto.allg_dt}</p>
            <p class="sub_desc"></p>
          </div>
        </div>
        <div class="detail_column">
          <div class="column_title">유통기한정보</div>
          <div>
            <p class="main_desc">${productDetailDto.ex_dt}</p>
          </div>
        </div>
        <div class="detail_column">
          <div class="column_title">안내사항</div>
          <div>
            <p class="main_desc">${productDetailDto.notice}</p>
          </div>
        </div>
        <div class="detail_column">
          <div class="column_title">구매수량</div>
          <div>
            <div class="quantity_control_box">
              <button id="down_qty">-</button>
              <div id="pdt_qty">1</div>
              <button id="up_qty">+</button>
            </div>
          </div>
        </div>
        <div>
          <div id="price_container">
            <span id="total_price">총 상품금액: </span>
            <span id="actual_price"></span>
            <span id="unit">원</span>
          </div>
          <div id="mileage">
            구매 시 0원 적립
          </div>
        </div>
        <div id="button_container">
          <button><img src="/product_detail/imgs/purpleheart.svg"/></button>
          <button><img src="/product_detail/imgs/bell.svg"/></button>
          <button id="addCart">장바구니 담기</button>
        </div>
      </div>
    </div>
    <nav class="menu_nav">
      <div class="navi" value="#des1">
        <span class="navs">상품설명</span></a>
      </div>
      <div class="navi" value="#des2">
        <span class="navs">상세정보</span></a>
      </div>
      <div class="navi" value="#review_board_i">
        <span class="navs">후기 (${reviewCnt})</span></a>
      </div>
      <div class="navi" value="#inquiry_board_i">
        <span class="navs">문의</span></a>
      </div>
    </nav>
    <img id="des1" src="${productDetailDto.prt_image}"/>
    <img id="des2" src="${productDetailDto.prt_info}" />

    <div id ="board_container">
      <div class="board_margin" id="review_board_i"></div>
      <div id="review_board">
        <iframe src="/boardlist?pdt_id=${param.pdt_id}&bbs_clsf_cd=1&page=1&pageSize=10">
        </iframe>
      </div>
      <div class="board_margin" id="inquiry_board_i"></div>
      <div id="inquiry_board">
        <iframe src="/boardlist?pdt_id=${param.pdt_id}&bbs_clsf_cd=2&page=1&pageSize=10">
        </iframe>
      </div>
    </div>
  </div>
  <footer>
    <img src="/logo.svg" alt="logo">
    <div id="member_container">
      <a href="https://github.com/dr94406">
        <p class="mem_row"><img src="/githubLogo.png">김형민</p>
      </a>
      <a href="https://github.com/PGRRR">
        <p class="mem_row"><img src="/githubLogo.png">이선우</p>
      </a>
      <a href="https://github.com/Riiver-J">
        <p class="mem_row"><img src="/githubLogo.png">정여경</p>
      </a>
      <a href="https://github.com/narlae">
        <p class="mem_row"><img src="/githubLogo.png">김영준</p>
      </a>
      <a href="https://github.com/xpmxf4">
        <p class="mem_row"><img src="/githubLogo.png">박채훈</p>
      </a>
      <a href="https://github.com/didqksrla">
        <p class="mem_row"><img src="/githubLogo.png">김경빈</p>
      </a>
    </div>
  </footer>
</div>
<script>
  let pdt_id = ${param.pdt_id};
  //가격단위 콤마 추가
  let sel_price = ${productDetailDto.sel_price};
  let price = ${productDetailDto.price};
  let priceLocale= sel_price.toLocaleString()
  let priceLocale2= price.toLocaleString()
  $("#sel_price").text(priceLocale);
  $("#price").text(priceLocale2 + "원");
  $("#actual_price").text(priceLocale);

  /* 카테고리 */
  let wrapper = $("#cat_wrapper");
  let show_category_button = $("#show_category_button");
  let main_cat_container = $("#main_cat_container");
  let sub_cat_container = $("#sub_cat_container");
  let sub_cat = $(".sub_cat");
  show_category_button.hover(() => {
    main_cat_container.show();
  })
  wrapper.mouseleave(() => {
    main_cat_container.hide();
    sub_cat_container.hide();
  })
  sub_cat_container.mouseleave(() => {
    sub_cat_container.hide();
  })
  let catToLi = function(res) {
    let tmp = '';
    res.forEach(el => {
      tmp += '<a href="/newlist?cd_name_num='+el.cd_name_num+'&page=1&pageSize=12"<li class="cat main_cat">'+el.cd_name+'</li></a>'
    })
    return tmp;
  }
  let categories = null;

  $(document).ready(function(){

    let jbOffset = $(".menu_nav").offset();
    $(window).scroll( function() {
      if ($(document).scrollTop() > jbOffset.top) {
        $(".menu_nav").css({"position":"fixed","top":"0px","left":"50%","transform":"translateX(-50%)"});
      }
      else {
        $(".menu_nav").css({"position":'relative'});
      }
    });

    $(".navi").click(function(event){

      event.preventDefault();
      let x= $(this).attr("value");
      $('html,body').animate({scrollTop:$(x).offset().top}, 500);

    });

    $("#down_qty").click(function(){
      if(parseInt($("#pdt_qty").text())>=1)
        $("#pdt_qty").text(parseInt($("#pdt_qty").text())-1);
      $("#actual_price").text((parseInt($("#pdt_qty").text())*sel_price).toLocaleString());
    });

    $("#up_qty").click(function(){
      $("#pdt_qty").text(parseInt($("#pdt_qty").text())+1);
      $("#actual_price").text((parseInt($("#pdt_qty").text())*sel_price).toLocaleString());
    });

      $("#addCart").click(function(){
      let pdt_qty = parseInt($("#pdt_qty").text());
      $.ajax({
        type:'POST',
        url: '/carts/'+pdt_id+'?pdt_qty='+pdt_qty,
        success : function(result){
          window.location.href = '/carts';
        },
        error   : function(){ alert("error") }
      });
    });

    $.ajax({
      type: 'GET',       // 요청 메서드
      url: '/product/categories',  // 요청 URI
      success: function (res) {
        categories = res;

        $.each(res, (el)=>{
          $("#main_cat_container").append('<a href="/product/newlist?cd_type_name='+el+'&page=1&pageSize=12"<li class="cat main_cat">'+el+'</li></a>');
        })
      },
      error: function (result) {
        alert("쿠폰 불러오기 실패");
      }, // 에러가 발생했을 때, 호출될 함수
      complete: function(){
        $(".main_cat").mouseenter((e) => {
          sub_cat_container.show();
          sub_cat_container.html(catToLi(categories[e.currentTarget.innerText]));
        })
      }
    })






  });




</script>

</body>
</html>