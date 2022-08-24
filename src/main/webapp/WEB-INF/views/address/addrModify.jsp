<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 2022-08-12 (012)
  Time: 오후 3:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Modify</title>
</head>
<body>
    <input type="button" value="팝업창 호출" onclick="showPopup();" />

    <div>
        <h2>배송지 수정</h2>
            <div class="field">
                <div>${AddressDto.stna_addr}</div>
                <input type="text" value="${AddressDto.stna_addr_dt}" />
            </div>
            <div class="field">
                <div>받으실분</div>
                <input type="text" value="${AddressDto.addr_name}" />
            </div>
            <div class="field">
                <div>휴대폰</div>
                <input type="text" value="${AddressDto.addr_tel}" />
            </div>
            <div>
                <input type="radio" value=${AddressDto.ba_addr} />
                <p>기본 배송지로 저장</p>
            </div>
            <button type="button" id="removeBtn" class="btn">수정</button>
            <button type="button" id="modifyBtn" class="btn">삭제</button>
    </div>
</body>
</html>
