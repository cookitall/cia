<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../include/header.jsp"%>
<!-- 커밋용주석 -->
<title>사업자 로그인</title>


       <section class="login-main">
            <!-- 로고 -->
            <a class="title" href="<c:url value='/' />"></a>
            <h2 class="ceo-login-title">사업자 로그인</h2>
           
            <form action="<c:url value='/ceoInfo/ceoLogin' />" method="post" class="login-form" id="loginForm">
	          
	            <div class="form-group account">
	                <!-- 아이디 입력창 -->
	                <label for="login-id" class="labelid"></label>
	                <input type="text" id="ceoId" name="ceoId" placeholder="아이디 입력(필수)"><br>
	            </div>
	            <div class="form-group account">
	                <!-- 비밀번호 입력창 -->
	                <label for="login-pw" class="labelpw"></label>
	                <input type="password" id="ceoPw" name="ceoPw" placeholder="비밀번호 입력 (필수)">
	            </div>
	            
	            <div class="form-group">
		            <!-- 자동로그인 -->
		            <span class="auto-login">
		                <input type="checkbox" id="auto-login-check">
		                <label for="auto-login-check">자동로그인</label>
		            </span>
		            <span class="search">
		                <a href="#">아이디 찾기 /비밀번호 찾기</a>
		            </span>
	            </div>
	            
	            <div class="btn-wrap form-group">
	                <button type="button" class="login-btn" id="login-btn">로그인</button>
	                <button type="button" class="join-btn" id="join-btn">회원가입</button>
	            </div>
            </form>

        </section>

<%@ include file="../include/footer.jsp"%>

<script>
	const msg = ${msg};
	if(msg === 'join') {
		alert('Welcome~ CIA CEO');
	} else if(msg === 'delete') {
		alert('Good-bye CIA CEO');
	}
	
	$(function() {
		$('#join-btn').click(function() {
			 location.href='<c:url value="/ceoInfo/ceoJoin"/>'
		})
	});

	$(function() {
		$('#login-btn').click(function() {
			if($('#ceoId').val() === '') {
				alert('아이디를 작성하세요');
				return;
			} else if($('#ceoPw').val() === '') {
				alert('비밀번호를 작성하세요!');
				return;
			} else {
				$('#loginForm').submit();
			}
		})
	});
	
</script>
