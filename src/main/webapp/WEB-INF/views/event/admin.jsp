<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>OnlyFresh :: 관리자</title>
<%--    <link rel="stylesheet" href="/dev_kurly/reset.css" type="text/css">--%>
    <style>
        #whole_container {
            width: 100%;
            height: 100vh;
        }

        #navigation {
            width: 100%;
            height: 156px;
            background-color: #8b00ff;
        }

        #content_body {
            display: flex;
            justify-content: space-between;
            flex-wrap: wrap;
        }

        .content {
            width: 400px;
            border: 1px solid #8b00ff;
        }

        button {
            width: 200px;
            height: 100px;
        }

        input {
            width: 80%;
        }
    </style>
    <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
</head>

<body>
<div id="whole_container">
    <div id="navigation">

    </div>
    <div id="content_body">
        <div class="content">
            <button id="select_button">selectAll</button>
            <div id="select_result"></div>
        </div>
        <div class="content create_event">
            <h2>이벤트 생성창</h2>
            <p>이름 : <input required maxlength="50" class="create_input" name="nm"></p>
            <p>설명 :<input required maxlength="200" class="create_input" name="des"></p>
            <p>사진(설명x) :<input required maxlength="100" class="create_input" name="photo"></p>
            <p>사진 대체 설명<input required maxlength="100" class="create_input" name="photo_alt"></p>
            <p>카테고리코드 -><input class="create_input" name="cat_cd"></p>
            <p>결제방식<input class="create_input" name="setl_methd_cd"></p>
            <p>시작일<input class="create_input" name="stpt_dd" pattern="(?<!\d)(?:(?:(?:1[6-9]|[2-9]\d)?\d{2})(?:(?:(?:0[13578]|1[02])31)|(?:(?:0[1,3-9]|1[0-2])(?:29|30)))|(?:(?:(?:(?:1[6-9]|[2-9]\d)?(?:0[48]|[2468][048]|[13579][26])|(?:(?:16|[2468][048]|[3579][26])00)))0229)|(?:(?:1[6-9]|[2-9]\d)?\d{2})(?:(?:0?[1-9])|(?:1[0-2]))(?:0?[1-9]|1\d|2[0-8]))(?!\d)
"></p>
            <p>종료일<input class="create_input" name="expi_dd" pattern="(?<!\d)(?:(?:(?:1[6-9]|[2-9]\d)?\d{2})(?:(?:(?:0[13578]|1[02])31)|(?:(?:0[1,3-9]|1[0-2])(?:29|30)))|(?:(?:(?:(?:1[6-9]|[2-9]\d)?(?:0[48]|[2468][048]|[13579][26])|(?:(?:16|[2468][048]|[3579][26])00)))0229)|(?:(?:1[6-9]|[2-9]\d)?\d{2})(?:(?:0?[1-9])|(?:1[0-2]))(?:0?[1-9]|1\d|2[0-8]))(?!\d)
"></p>
            <p>조기종료상태<input class="create_input" name="early_end_stus"></p>
            <p>할인율<input min="0" max="99" class="create_input" name="ds_rate"></p>
            <input type="submit" id="create_button" class=""></input>
        </div>
        <div class="content">
            <h2>수정할 이벤트를 선택해 주세요</h2>
            <p>
                <select id="events_to_update" class="events">
                </select>
            </p>
            <div id="update_inputs" style="visibility : hidden">
                <p>이름 : <input required maxlength="50" class="update_input" name="nm"></p>
                <p>설명 :<input required maxlength="200" class="update_input" name="des"></p>
                <p>사진(설명x) :<input required maxlength="100" class="update_input" name="photo"></p>
                <p>사진 대체 설명<input required maxlength="100" class="update_input" name="photo_alt"></p>
                <p>카테고리코드<input class="update_input" name="cat_cd"></p>
                <p>결제방식<input class="update_input" name="setl_methd_cd"></p>
                <p>시작일<input class="update_input" name="stpt_dd"></p>
                <p>종료일<input class="update_input" name="expi_dd"></p>
                <p>조기종료상태<input class="update_input" name="early_end_stus"></p>
                <p>할인율<input min="0" max="99" class="update_input" name="ds_rate"></p>
                <button id="update_button">UPDATE</button>
            </div>
        </div>
        <div class="content">
            <label>삭제할 이벤트를 선택해 주세요</label>
            <p>
                <select id="events_to_delete" class="events">
                </select>
            </p>
            <button id="delete_button">DELETE</button>
        </div>
    </div>
</div>
<script src="/event/js/admin.js" type="text/javascript">
</script>
</body>
</html>