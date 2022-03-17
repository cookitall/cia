<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>	
<%@ include file="../include/header.jsp"%>
<title>사업자 가입</title>
<!-- 커밋용주석 -->
 <section class="join-main">
        <!-- 로고 -->
        <a class="logo-img" href="<c:url value='/cia' />"></a>
        <h2 class="join-title">사업자 회원가입</h2>
        <form action="<c:url value='/ceoInfo/ceoJoin' />" method="post" class="join-form">
              	
        <label for="ceo-id">아이디</label>
        <div class="id-wrap">
        	<input type="email" name="ceoId" id="ceoId" placeholder="아이디를 입력해주세요" required/>
            <button class="mail-check" id="id-check" type="button">중복확인</button>
            <span id="idError" class="error"></span>
        </div>
          
          
        <label for="ceo-email">이메일</label>
        <div class="email-wrap">
        	<div class="input-group">
           		<input type="email" name="ceoEmail" id="ceoEmail" placeholder="이메일 주소를 입력해주세요" required/>
            	<button class="mail-check" id="mail-check" type="button">인증</button>
            	<span id="emailSend" class="emailSend"></span>
            </div>
            <div class="input-group">
            	<input class="mailChk" id="mail-check-input" placeholder="인증번호 입력">
            	<span id="emailError" class="error"></span>
            </div>
        </div>


          <label for="ceo-pw">비밀번호</label>
          <input type="password" name="ceoPw" id="ceo-pw" placeholder="비밀번호 입력" required/>

          <label for="ceoPwchk">비밀번호 확인</label>
          <input type="password" name="ceoPwchk" id="ceoPwchk" placeholder="비밀번호 입력"  required/>

          <label for="ceoName">이름</label>
          <input type="text" name="ceoName" id="ceoName" placeholder="이름"required/>
          
          <label for="ceoPhone">휴대폰 번호</label>
          <input type="tel" name="ceoPhone" id="ceoPhone" placeholder="-를 빼고 입력해주세요" required/>

          <label for="shopName">상호명</label>
          <input type="text" name="shopName" id="shopName" required />

          <label for="category">업종</label>
          <select name="shopCategory" id="category">
          	<option value="chicken">치킨</option>
          	<option value="china">중식</option>
          	<option value="ham">햄버거</option>
          	<option value="jap">일식</option>
          	<option value="korea">한식</option>
          	<option value="pizza">피자</option>
          	<option value="west">양식</option>
          </select>

          <label for="shopNum">사업자등록번호</label>
          <input type="text" name="shopNum" id="shopNum" placeholder="-를 빼고 입력해주세요" required/>

          <label for="shopAddr1">주소</label>
          <div class="address-wrap">
            <input type="text" name="shopAddr1" id="shopAddr1" placeholder="기본 주소" required/>
            <button class="address-check" type="button" onclick="searchAddress()">검색</button>
          </div>

          <label for="shopAddr2">상세 주소</label>
          <input type="text" name="shopAddr2" id="shopAddr2" placeholder="상세 주소" required/>

          <button type="submit" class="submit-btn">완료</button>
          <button type="reset" class="reset-btn">취소</button>
        </form>
      </section>

<%@ include file="../include/footer.jsp"%>



<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js">
</script>

<script>
	let code;
	//아이디 중복 체크
	$('#id-check').click(function() {
		if($('#ceoId').val() === '') {
			alert('아이디는 필수값 입니다.');
			return;
		}
		
		const ceoId = $('#ceoId').val();
		
		$.ajax({
			type: 'post',
			url: '<c:url value="/ceoInfo/idCheck" />',
			data: ceoId,
			contentType: 'application/json',
			success: function(data) {
				if(data === 'ok') {
					$('#ceoId').attr('readonly', true);
					$('#idError').html('사용 가능한 아이디입니다.');
					$('#idError').css('color', 'green');
				} else {
					$('#idError').html('중복된 아이디입니다.');
					$('#idError').css('color', 'red');
				}
			},
			error: function() {
				alert('서버 에러입니다. 관리자에게 문의하세요.');
			}
			
		}); 
		
	});
	//아이디 중복체크 끝
	
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










