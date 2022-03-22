<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>

<%@ include file="../include/header.jsp"%>
<title>사업자 정보관리</title>
<div class="ceo-page">
<%@ include file="../include/aside.jsp"%>
   <div class="content gray">
		<section class="join-main">
			<!-- 로고 -->
			<a class="logo-img"></a>
			<h2 class="join-title">사업자 정보수정</h2>
			<form action="#" method="post" class="join-form">
				
				<label for="ceo-id">아이디</label>
				<div class="id-wrap">
					<input type="text" name="ceoId" id="ceoId" value="${ceoModi.ceoId}" readonly required />
				</div>

		        <label for="ceo-email">이메일</label>
		        <div class="email-wrap">
		        	<div class="input-group">
		           		<input type="email" name="ceoEmail" id="ceoEmail" value="${ceoModi.ceoEmail}" required/>
		            	<button class="mail-check" id="mail-check" type="button">인증</button>
		            	<span id="emailSend" class="emailSend"></span>
		            </div>
		            <div class="input-group">
		            	<input class="mailChk" id="mail-check-input" placeholder="인증번호 입력">
		            	<span id="emailError" class="error"></span>
		            </div>
		        </div>

				<label for="ceo-pw">현재 비밀번호</label> 
				<div class="id-wrap">
					<input type="password" name="ceoOldPw" id="ceoOldPw" placeholder="비밀번호 입력" required />
					<button class="mail-check" type="button" id="pwChk">확인</button> 
					<span id="pwError" class="error"></span>
				</div>
				
				<label for="ceo-pw">신규 비밀번호</label> 
				<input type="password" name="ceoPw" id="ceoPw" placeholder="비밀번호 입력" required /> 
				
				<label for="ceo-pwchk">신규 비밀번호 확인</label> 
				<input type="password" name="ceoPwChk" id="ceoPwChk" placeholder="비밀번호 입력" required />

				<label for="ceo-name">이름</label> 
				<input type="text" name="ceoName" id="ceoName" value="${ceoModi.ceoName}" required /> 
					
				<label for="user-phone">휴대폰 번호</label> 
				<input type="tel" name="ceoPhone" id="ceoPhone" value="${ceoModi.ceoPhone}" required /> 
					
				<label for="store-name">상호명</label> 
				<input type="text" name="shopName" id="shopName" value="${ceoModi.shopName}" readonly="readonly" required /> 
					
		          <label for="category">업종</label>
		          <select name="shopCategory" id="category">
		          	<option value="${ceoModi.shop.shopCategory}">${ceoModi.shop.shopCategory}</option>
		          	<option value="chicken">치킨</option>
		          	<option value="china">중식</option>
		          	<option value="ham">햄버거</option>
		          	<option value="jap">일식</option>
		          	<option value="korea">한식</option>
		          	<option value="pizza">피자</option>
		          	<option value="west">양식</option>
		          </select>
		          
		        <label for="del-price">배달비</label> 
				<input type="text" name="deliveryPrice" id="deliveryPrice" value="${ceoModi.shop.deliveryPrice}" required />
					
					
				<label for="industy">상점 공지/정보</label>
                <input type="text" name="shopInfo" id="shopInfo" value="${ceoModi.shop.shopInfo}" required  style="height: 100px;"/>	
					
		        <label for="shopAddr1">주소</label>
          		<div class="address-wrap">
            		<input type="text" name="shopAddr1" id="shopAddr1" value="${ceoModi.shop.shopAddr1}" required/>
            		<button class="address-check" type="button" onclick="searchAddress()">검색</button>
          		</div>

          		<label for="shopAddr2">상세 주소</label>
          		<input type="text" name="shopAddr2" id="shopAddr2" value="${ceoModi.shop.shopAddr2}" required/>
		
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
						<p>업체 이름: ${ceoModi.shopName}/p>
						<p>사업자 이름:${ceoModi.ceoId}</p>
						<p>사업자 등록 번호:${ceoModi.shop.shopNum}</p>
						<p>입점 날짜: ${ceoModi.ceoRegDate}</p>
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
			<button class="delBtn">탈퇴</button>
		</div>
	</div>
	<!-- 모달바디 -->
</div>
<!-- 모달히든 -->


<%@ include file="../include/footer.jsp"%>

<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js">
</script>
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
      
  	$(function() {
		$('.delBtn').click(function() {
			 location.href='<c:url value="/ceoInfo/ceoDelete"/>'
		})
	});
      
    //현재 비밀번호 검증
    	$('#pwChk').click(function() {

		
		
		const ceoOldPw = $('#ceoOldPw').val();		
		$.ajax({
			type: 'post',
			url: '<c:url value="/ceoInfo/pwCheck" />',
			data: ceoOldPw,
			contentType: 'application/json',
			success: function(data) {
				if(data === 'ok') {
					$('#pwError').html('확인되었습니다.');
					$('#pwError').css('color', 'green');
				} else {
					$('#pwError').html('비밀번호가 틀렸습니다.');
					$('#pwError').css('color', 'red');
				}
			},
			error: function() {
				alert('서버 에러입니다. 관리자에게 문의하세요.');
			}
			
		}); 
		
	});
    //비밀번호 검증 종료
      
    //인증번호 이메일 전송
  	$('#mail-check').click(function() {
  		const email = $('#ceoEmail').val();
  		const checkInput = $('#mail-check-input');
  		$('#emailSend').html('이메일 발송완료');
  		
  		$.ajax({
  			type : 'get',
  			url : '<c:url value="/ceoInfo/mailCheck?email=" />' + email,
  			success : function(data) {
  				console.log("data= " + data);
  				checkInput.attr('disabled', false);
  				code = data;
  			}
  					
  		});
  		
  	});;
  	//이메일 전송 끝
  	//인증번호 비교
  	$('#mail-check-input').blur(function() {
  		const inputCode = $(this).val();
  		const $resultMsg = $('#emailError');
  		
  	if(inputCode === code){
  		$resultMsg.html('인증번호 일치');
  		$resultMsg.css('color', 'green');
  		$('#mail-check').attr('disabled', true);
  		$('#ceoEmail').attr('readonly', true);
  		$('#ceoEmail').attr('onFocus', 'this.initialSelect = this.selectedIndex');
  	    $('#ceoEmail').attr('onChange', 'this.selectedIndex = this.initialSelect');
  	}else {
  		$resultMsg.html('인증번호 불일치');
  		$resultMsg.css('color', 'red');
  		}
  	});
  	
  	
	//주소 api
	function searchAddress() {
    	new daum.Postcode({
        	oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('shopAddr1').value = data.zonecode + addr;
        
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("shopAddr2").focus();
        }
    }).open();
}     
      
      
    </script>