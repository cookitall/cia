<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<%@ include file="../include/header.jsp"%>
<title>주문하기</title>

    <div class="content-wrap">
    	<form class="pay-content" action="<c:url value='/shop/payment' />" >
	        <section class="pay-container">
	          <div class="pay-title">결제하기</div>
	
	            <div class="info">
	              <div class="pay-sub-title">배달정보</div>
	             
	              
		        <label for="userAddr1">주소</label>
		        <div class="address-wrap">
		            <input type="text" name="userAddr1" id="userAddr1" placeholder="기본 주소" value="${user.userAddr1}" required/>
		            <button class="address-check" type="button" onclick="searchAddress()">검색</button>
		        </div>
		
		        <label for="userAddr2">상세 주소</label>
		        <input type="text" name="userAddr2" id="userAddr2" value="${user.userAddr2}"required/>
			
			
	              <label for="user-phone">휴대폰 번호</label>
	              <input type="tel" name="userPhone" id="userPhone" value="${user.userPhone}" required />
	              
	             
	              <label for="user-name">받으실분 성함</label>
	              <input type="tel" name="userName" id="userName" value="${user.userName}" required />
	            </div>
	            
	            <!-- 요청사항 -->
	            <div class="request">
	              <div class="pay-sub-title">주문시 요청사항</div>
	              <textarea name="orderMsg" id="orderMsg" rows="3" maxlength="100"placeholder="요청사항을 남겨주세요"></textarea>
	            </div>
	            
	            <!-- 결제수단 선택 -->
	            <div class="pay-method">
	              <div class="pay-sub-title">결제수단 선택</div>
	              <div class="pay-wrap">
	                <strong>온라인결제</strong> <small>웹에서 미리 결제</small>
	                <div>
	                  <label class="">온라인 결제</label>
	                  <input type="radio" name="payway" value="online-card" required="required"/>신용카드
	                  
	                  <input type="radio" name="payway" value="online-point" required="required"/>포인트
	               
	                </div>
	                <hr />
	                <strong>현장결제</strong> <small>음식받고 직접 결제</small>
	                <small>* 온라인 결제시에만 할인 혜택을 받을 수 있습니다.</small>
	                <div>
	                  <label class="">오프라인 결제</label>
	                  <input type="radio" name="payway"value="offline-card" required="required"/>신용카드
	                  <input type="radio" name="payway" value="offline-card"required="required"/>만나서 현금결제
	                </div>
	              </div>
	            </div>
	
	            <!-- 할인방법 선택 -->
	            <div class="pay-sub-title">할인방법 선택</div>
	            <label for="discount">쿠폰</label>
	            <div class="discount-wrap">
	              <input type="text" name="couponCode" id="couponCode" placeholder="쿠폰 코드를 입력하세요"/>
	              <button class="coupon-check" type="button">검색</button>
	              <span id="couponError" class="error"></span>
	            </div>
	        </section>
	
	        <section class="order-table">
	          <h2 class="title">주문내역</h2>
	          <ul class="order-list">
	          	<li class="shopName">
	              <span  class="shop">상점</span>
	              <input  class="price" name="shopName" id="shopName" value="${shopInfo.shopName}" readonly="readonly">
	            </li>


	          	<c:forEach var="menu" items="${menus}">
		            <li>
		              <input class="menu" name="menuName" id="menuName" value="${menu.menuName}" readonly="readonly">
		              <input class="price" type="number" name="menuPrice" id="menuPrice" value="${menu.menuPrice}" readonly="readonly">
		              <input type="hidden" name="menuNum" id="menuNum" value="${menu.menuNum}">
		            </li>					
	          	</c:forEach>
	          	
			   <li class="original">
		          <span  class="coupon">메뉴 합계</span>
		          <input type="number" class="price" name="originalPrice" id="originalPrice" value="${op}" readonly="readonly">
		       </li>
	
	            <li class="delivery">
	              <span  class="menu">배달료</span>
	              <input type="number" class="price" name="deliveryPrice" id="deliveryPrice" value="${shopInfo.deliveryPrice}" readonly="readonly">
	            </li>
	            <li class="discount">
	              <span  class="coupon">쿠폰할인</span>
	              <input type="number" value="0" class="price" name="couponDiscount" id="couponDiscount" readonly="readonly">
	            </li>
	          </ul>
	          <div class="total-price">
	            <span  class="menu">총 결제 금액</span>
	            <input type="number" class="price" name="orderPrice" id="orderPrice" >
	          </div>
	          <p>개인정보 제3자 제공 내용 확인하였으며 결제에 동의합니다.</p>
	          <button class="pay-btn" >결제하기</button>
	        </section>
      	</form>
      </div>


<%@ include file="../include/footer.jsp"%>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js">
</script>
<script>
$('.coupon-check').click(function() {
	if($('#couponCode').val() === '') {
		alert('쿠폰을 입력해주세요.');
		return;
	}
	
	const couponCode = $('#couponCode').val();
	
	$.ajax({
		type: 'post',
		url: '<c:url value="/shop/couponCheck" />',
		data: couponCode,
		contentType: 'application/json',
		success: function(data) {
			if(data === 0) {
				$('#couponError').html('쿠폰 코드가 잘못 되었습니다..');
				$('#couponError').css('color', 'red');
				document.getElementById('couponDiscount').value = 0;
			} else {
				document.getElementById('couponDiscount').value = data;
				cost();
			}
		},
		error: function() {
			alert('서버 에러입니다. 관리자에게 문의하세요.');
		}
		
	}); 
	
});

//금액 계산



window.onload = function() {
	let order = 0;
	order += Number($('#originalPrice').val());
	order += Number($('#deliveryPrice').val());
	order -= Number($('#couponDiscount').val());
	document.getElementById('orderPrice').value = order;
}

function cost() {
	let order = 0;
	order += Number($('#originalPrice').val());
	order += Number($('#deliveryPrice').val());
	order -= Number($('#couponDiscount').val());
	document.getElementById('orderPrice').value = order;
}


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
            document.getElementById('userAddr1').value = data.zonecode + addr;
        
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("userAddr2").focus();
        }
    }).open();
}

</script>