<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="mod.jsp" />
<section>
    <br><br>
    <div align="center"><font size=5> 개인정보 수정 </font></div> <br>
    <div align="center">
        <br><br>
        <form action="update.do">
            <table border=1 width=600>
                <tr>
                    <td  align=center>이메일 </td>
                    <td> <input  type=text  name=custname  value= ${UserDto.user_email} size=10></td>
                </tr>
                <tr>
                    <td  align=center>비밀번호 </td>
                    <td><input  type=text  name=phone size=20 value= ${UserDto.pwd}></td>
                </tr>
                <tr>
                    <td  align=center>이름 </td>
                    <td><input  type=text  name=address size=40 value= "${UserDto.user_nm}"></td>
                </tr>
                <tr>
                    <td  align=center>성별<br>[A:여성,B:남성,C:선택안함] </td>
                    <td><input  type=text  name=grade size=10 value= ${UserDto.gender}></td>
                </tr>
                <tr>
                    <td  align=center>생년월일 </td>
                    <td><input  type=text  name=city size=10 value= ${UserDto.bryr}> </td>
                </tr>
                <tr>
                    <td colspan=2  align=center>
                        <input  type=submit  value="수정"> &emsp;
                        <input  type=reset   value="다시입력">
                    </td>
                </tr>
            </table>
        </form>
    </div>

</section>