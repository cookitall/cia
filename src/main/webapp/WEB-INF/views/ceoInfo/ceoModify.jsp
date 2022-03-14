<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@ include file="../include/header.jsp"%>
<title>사업자 정보관리</title>
<div class="ceo-page">
	<aside id="aside">
		<div class="aside-title">판매자 메뉴</div>
		<ul>
			<li>주문현황</li>
			<li>매출내역</li>
			<li>메뉴관리</li>
			<li>리뷰관리</li>
			<li>쿠폰관리</li>
			<li>정보관리</li>
		</ul>
	</aside>
   <div class="content gray">
		<section class="join-main">
			<!-- 로고 -->
			<a class="logo-img"></a>
			<h2 class="join-title">사업자 정보수정</h2>
			<form action="#" method="post" class="join-form">
				
				<label for="user-id">아이디</label>
				<div class="id-wrap">
					<input type="email" name="user-id" id="user-id"
						placeholder="${ceoId}" readonly required />
				</div>

				<label for="ceo-id">이메일</label>
				<div class="id-wrap">
					<input type="email" name="ceo-id" id="ceo-id"
						placeholder="${ceoemail}" required />
					<button class="mail-check" type="button">인증</button>
				</div>

				<label for="ceo-pw">현재 비밀번호</label> 
				<input type="password" name="ceo-pw" id="ceo-pw" placeholder="비밀번호 입력" required /> 
				
				<label for="ceo-pw">신규 비밀번호</label> 
				<input type="password" name="ceoNewPw" id="ceo-pw" placeholder="비밀번호 입력" required /> 
				
				<label for="ceo-pwchk">신규 비밀번호 확인</label> 
				<input type="password" name="ceoNewPwChk" id="ceo-pwchk" placeholder="비밀번호 입력" required />

				<label for="ceo-name">이름</label> 
				<input type="text" name="ceo-name"
					id="ceo-name" placeholder="${ceoname}" required /> 
					
				<label for="user-phone">휴대폰 번호</label> 
				<input type="tel" name="ceo-phone" id="ceo-phone" placeholder="${ceoname}" required /> 
					
				<label for="store-name">상호명</label> 
				<input type="text" name="store-name" id="store-name" required /> 
					
				<label for="industy">업종</label> 
				<input type="text" name="industry" id="industry" placeholder="${category}"required /> 
					
				<label for="license-number">사업자등록번호</label> 
				<input type="text" name="license-number" id="license-number" placeholder="${shopnum}" required /> 
					
				<label for="industy">상점 공지/정보</label>
                <input
                type="text"
                name="industry"
                id="industry"
                placeholder="${shopInfo}"
                required
                style="height: 100px;"
                />	
					
				<label for="ceo-address">주소</label>
				<div class="address-wrap">
					<input type="text" name="ceo-address" id="ceo-address" placeholder="기본 주소" required />
					<button class="address-check" type="button">검색</button>
				</div>

				<label for="ceo-address-detail">상세 주소</label> 
				<input type="text" name="ceo-address-detail" id="ceo-address-detail" placeholder="상세 주소" required />
	
				<button type="submit" class="submit-btn">완료</button>
				<button type="reset" class="reset-btn">취소</button>
				<button type="button" class="shop-del-btn btn-open-popup">회원탈퇴</button>
			</form>
		</section>
	</div>
</div><!-- 여는 태그는 aside포함 -->

<!-- 모달창 -->
<div class="modal hidden">
	<div class="modal_body">
		<div class="panel">
			<div class="panel-heading">퇴점 신청</div>
			<div class="panel-body">
				<div class="withdraw-container">
					<div class="withdraw-wrap">
						<p>업체 이름: 두마리찜 강남점</p>
						<p>사업자 이름:</p>
						<p>사업자 등록 번호: 354-13-11111</p>
						<p>입점 날짜: 2022-03-03</p>
						<br>
						<hr>
						<br> <span>퇴점 약관</span>
						<textarea name="" id="" cols="50" rows="5" readonly>Lorem ipsum dolor sit amet consectetur, adipisicing elit. Consequuntur, accusamus. Ab pariatur quis tenetur praesentium illum deserunt nostrum amet adipisci quo neque at repudiandae a, repellendus explicabo ullam laboriosam minus.
                    </textarea>
						<br> <span>미정산 금액 처리 약관</span><br>
						<textarea name="" id="" cols="50" rows="5">Lorem ipsum dolor sit amet consectetur adipisicing elit. Optio aperiam pariatur tempore, earum aliquam ratione iste enim reiciendis aut doloribus totam nemo. Nemo quam iste quidem ab quas ducimus perferendis?
                    </textarea>
					</div>
					<!--위쓰드로우 랩 -->
				</div>
				<!-- 위쓰드로우 콘테이너 -->
			</div>
			<!-- 판넬바디 -->
		</div>
		<!--판넬-->
		<div class="comment-btn">
			<button class="close">취소</button>
			<button>확인</button>
		</div>
	</div>
	<!-- 모달바디 -->
</div>
<!-- 모달히든 -->


<%@ include file="../include/footer.jsp"%>
<!-- modal 스크립트 -->
<!-- 모달 오픈 클래스 class="btn-open-popup" -->
<script>
      const modal = document.querySelector(".modal");
      const btnOpenPopup = document.querySelector(".btn-open-popup");

      const close = document.querySelector(".close");
      btnOpenPopup.addEventListener("click", function () {
        modal.classList.remove("hidden");
      });
      close.addEventListener("click", function () {
        modal.classList.add("hidden");
      });
    </script>