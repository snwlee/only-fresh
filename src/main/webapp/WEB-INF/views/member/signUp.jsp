<%--
  Created by IntelliJ IDEA.
  User: iseon-u
  Date: 2022/08/10
  Time: 10:22 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<html>
<head>
    <title>DevKurly :: 회원가입</title>
    <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
</head>
<body>
<form
        action="/members/signup"
        method="post"
>
    <div class="member-out-box">
        <div class="member-submit-box">
            <div class="member-title">회원 가입</div>
            <div class="warning-msg" id="msg">${param.error}</div>
            <span>이메일 *</span>
            <input
                    class="member-input-text"
                    type="text"
                    name="user_email"
                    placeholder="이메일을 입력해주세요"
                    autofocus
            />
            <span>비밀번호 *</span>
            <input
                    class="member-input-text"
                    type="password"
                    name="pwd"
                    placeholder="비밀번호를 입력해주세요"
            />
            <span>비밀번호 확인 *</span>
            <input
                    class="member-input-text"
                    type="password"
                    name="cPassword"
                    placeholder="비밀번호를 한번 더 입력해주세요"
            />
            <span>이름 *</span>
            <input
                    class="member-input-text"
                    type="text"
                    name="user_nm"
                    placeholder="이름을 입력해 주세요"
            />
            <span>휴대폰 *</span>
            <input
                    class="member-input-text"
                    type="text"
                    name="telno"
                    placeholder="휴대폰 번호를 입력해주세요."
            />
            <span>주소 *</span>
            <button type="button">주소 검색</button>
            <span>성별</span>
            <input type="text" id="name" name="gender" hidden/>
            <div class="select-gender" role="radio-group">
                <input
                        type="radio"
                        id="male"
                        name="gender"
                        onclick="document.querySelector('#name').value = 'male'"
                /><label for="male">남성</label>
                <input
                        type="radio"
                        id="female"
                        name="gender"
                        onclick="document.querySelector('#name').value = 'female'"
                /><label for="female">여성</label>
                <input
                        type="radio"
                        id="non"
                        name="gender"
                        onclick="document.querySelector('#name').value = 'non'"
                /><label for="non">선택안함</label>
            </div>
            <span>생년월일</span>
            <input
                    class="member-input-text"
                    type="date"
                    name="bryr"
                    placeholder="생일"
            />
            <span>추천인 이메일</span>
            <input
                    class="member-input-text"
                    type="text"
                    name="rcmdr_email"
                    placeholder="추천인 이메일을 입력해주세요."
            />
            <span>이용약관동의 *</span>
            <input type="checkbox" id="terms1" name="required" value="1">
            <label for="terms1">이용약관 동의 (필수)</label><br>
            <input type="checkbox" id="terms2" name="prvc_arge" value="1">
            <label for="terms2">개인정보 수집 이용 동의 (선택)</label><br>
            <input type="checkbox" id="terms3" name="age" value="1">
            <label for="terms3">본인은 만 14세 이상입니다. (필수)</label><br>
            <button class="member-btn-a" type="submit">가입하기</button>
        </div>
    </div>
</form>
</body>
</html>
