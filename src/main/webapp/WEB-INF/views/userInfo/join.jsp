<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="../include/header.jsp"%>
<title>CIA 회원가입</title>


<section class="join-main">
	<!-- 로고 -->
	<a class="logo-img"></a>
    <h2 class="join-title">회원가입</h2>
    <form action="#" method="post" class="join-form">

    	<label for="user-id">아이디</label>
        <div class="id-wrap">
        	<input type="email" name="user-id" id="user-id" placeholder="아이디를 입력해주세요" required/>
            <button class="mail-check" id="id-check" type="button">중복확인</button>
            <span id="emailError" class="error hidden">* 중복!</span>
        </div>

        <label for="user-email">이메일</label>
        <div class="email-wrap">
        	<div class="input-group">
           		<input type="email" name="user-email" id="user-email" placeholder="이메일 주소를 입력해주세요" required/>
            	<button class="mail-check" id="mail-check" type="button">인증</button>
            </div>
            <div class="input-group">
            	<input class="mailChk">
				<span id="emailError" class="error hidden">* 인증번호 오류!</span>
            </div>
        </div>

        <label for="user-pw">비밀번호</label>
        <input type="password" name="user-pw" id="user-pw" placeholder="비밀번호 입력" required/>

        <label for="user-pwchk">비밀번호 확인</label>
        <input type="password" name="user-pwchk" id="user-pwchk" placeholder="비밀번호 입력" required/>

        <label for="user-name">이름</label>
        <input type="text" name="user-name" id="user-name" placeholder="이름" required/>

        <label for="user-phone">휴대폰 번호</label>
        <input type="tel" name="user-phone" id="user-phone" placeholder="-를 빼고 입력해주세요" required/>
                
        <label for="user-address">주소</label>
        <div class="address-wrap">
        	<input type="text" name="user-address" id="user-address" placeholder="기본 주소" required/>
            <button class="address-check" type="button">검색</button>
        </div>

        <label for="user-address-detail">상세 주소</label>
        <input type="text" name="user-address-detail" id="user-address-detail" placeholder="상세 주소" required/>
                
        <button type="submit" class="submit-btn">완료</button>
        <button type="reset" class="reset-btn">취소</button>
   
	</form>
</section>



<%@ include file="../include/footer.jsp"%>