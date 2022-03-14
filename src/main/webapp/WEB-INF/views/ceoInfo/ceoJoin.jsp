<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<title>사업자 가입</title>

 <section class="join-main">
        <!-- 로고 -->
        <a class="logo-img" href="<c:url value='/cia' />"></a>
        <h2 class="join-title">사업자 회원가입</h2>
        <form action="<c:url value='/ceoInfo/ceoJoin' />" method="post" class="join-form">
              	
        <label for="ceo-id">아이디</label>
        <div class="id-wrap">
        	<input type="email" name="ceoId" id="ceo-id" placeholder="아이디를 입력해주세요" required/>
            <button class="mail-check" id="id-check" type="button">중복확인</button>
            <span id="emailError" class="error hidden">* 중복!</span>
        </div>
          
          
        <label for="ceo-email">이메일</label>
        <div class="email-wrap">
        	<div class="input-group">
           		<input type="email" name="ceoEmail" id="ceo-email" placeholder="이메일 주소를 입력해주세요" required/>
            	<button class="mail-check" id="mail-check" type="button">인증</button>
            </div>
            <div class="input-group">
            	<input class="mailChk">
            	<span id="emailError" class="error hidden">* 인증번호 오류!</span>
            </div>
        </div>


          <label for="ceo-pw">비밀번호</label>
          <input
            type="password"
            name="ceo-pw"
            id="ceo-pw"
            placeholder="비밀번호 입력"
            required
          />

          <label for="ceo-pwchk">비밀번호 확인</label>
          <input
            type="password"
            name="ceo-pwchk"
            id="ceo-pwchk"
            placeholder="비밀번호 입력"
            required
          />

          <label for="ceo-name">이름</label>
          <input
            type="text"
            name="ceo-name"
            id="ceo-name"
            placeholder="이름"
            required
          />
          
          <label for="user-phone">휴대폰 번호</label>
          <input type="tel" name="user-phone" id="user-phone" placeholder="-를 빼고 입력해주세요" required/>

          <label for="store-name">상호명</label>
          <input type="text" name="store-name" id="store-name" required />

          <label for="industy">업종</label>
          <input
            type="text"
            name="industry"
            id="industry"
            placeholder="휴게음식점 등"
            required
          />

          <label for="license-number">사업자등록번호</label>
          <input
            type="text"
            name="license-number"
            id="license-number"
            placeholder="-를 빼고 입력해주세요"
            required
          />

          <label for="ceo-address">주소</label>
          <div class="address-wrap">
            <input
              type="text"
              name="ceo-address"
              id="ceo-address"
              placeholder="기본 주소"
              required
            />
            <button class="address-check" type="button">검색</button>
          </div>

          <label for="ceo-address-detail">상세 주소</label>
          <input
            type="text"
            name="ceo-address-detail"
            id="ceo-address-detail"
            placeholder="상세 주소"
            required
          />

          <button type="submit" class="submit-btn">완료</button>
          <button type="reset" class="reset-btn">취소</button>
        </form>
      </section>

<%@ include file="../include/footer.jsp"%>
