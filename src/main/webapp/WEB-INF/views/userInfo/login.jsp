<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="../include/header.jsp"%>


<section class="login-main">
	<!-- 로고 -->
    <a class="title" href="#"></a>
    <form action="<c:url value='/userInfo/login' />" method="post" class="login-form">
    	<div class="account">
        	<!-- 아이디 입력창 -->
            <label for="login-id" class="labelid"></label>
            <input type="text" id="login-id" placeholder="이메일 주소 입력(필수)"><br>
              
            <!-- 비밀번호 입력창 -->
            <label for="login-pw" class="labelpw"></label>
            <input type="password" id="login-pw" placeholder="비밀번호 주소 입력 (필수)">
        </div>
            
        <!-- 자동로그인 -->
        <span class="auto-login">
        	<input type="checkbox" id="auto-login-check">
            <label for="auto-login-check">자동로그인</label>
        </span>
        <span class="search">
            <a href="#">아이디 찾기 /비밀번호 찾기</a>
        </span>
        <div class="btn-wrap">
            <button type="submit" id="login-btn">로그인</button>
	        <button type="button" id="join-btn" onclick="<c:url value='/userInfo/join' />">회원가입</button>
        </div>
	</form>

</section>


<%@ include file="../include/footer.jsp"%>