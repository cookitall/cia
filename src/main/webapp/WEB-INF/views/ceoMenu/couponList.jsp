<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../include/header.jsp"%>
<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.3.1.min.js"></script>
<title>사업자 쿠폰관리</title>
<div class="ceo-page">
	<%@ include file="../include/aside.jsp"%>

	<div class="content">
		<div class="content-title">쿠폰관리</div>
		<div class="coupon-content">

			<div class="coupon-create">
				<div class="coupon-title">
					<h2>쿠폰 생성</h2>
				</div>
				<form>
					<div class="coupon-wrap">
						<label for="couponName">쿠폰 이름</label>
						<input name="couponName" class="coupon-name" type="text">
					</div>
					<div class="coupon-wrap">
						<label for="couponRegDate">사용 기한</label>
						<input name="couponRegDate" class="coupon-regdate" type="date">
						<input name="couponEndDate" class="coupon-enddate" type="date">
					</div>
					<div class="coupon-wrap">
						<label for="couponTermPrice">사용 조건</label>
						<input name="couponTermPrice" class="coupon-term-price" type="number" value="0" step="1000">
						원 이상
					</div>
					<div class="coupon-wrap">
						<label for="couponDiscount">할인 금액</label>
						<input name="couponDiscount" class="coupon-discount" type="number" value="500" min="500"
							step="500"> 원 할인
					</div>
					<div class="coupon-wrap">
						<label for="couponRemain">쿠폰 수량</label>
						<input name="couponRemain" class="coupon-remain" type="number" value="100" min="100" step="100"> 개
					</div>
					<button type="reset">취소</button>
					<button type="button" id="coupon-submit" onclick="couponSubmitEvent();">쿠폰 코드 생성하기</button>
				</form>
			</div>
			<hr>
			<div class="coupon-code">
				<div class="coupon-title">
					<h4>생성된 쿠폰 코드</h4>
				</div>
				<textarea name="generated-code" id="generated-code" cols="30" rows="1"
					readonly></textarea>
			</div>
			<hr>
			<div class="coupon-code">
				<div class="coupon-title">
					<h2>쿠폰 목록</h2>
				</div>
				<div class="coupon-list-wrap">
					<table class="coupon-list">
						<thead>
							<tr>
								<th>코드</th>
								<th>이름</th>
								<th>사용 기한</th>
								<th>사용 조건</th>
								<th>할인 금액</th>
								<th>잔여수량</th>
								<th></th>
								<th></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${couponList}" var="couponList">
								<tr>
									<td>${couponList.getCouponCode()}</td>
									<td>${couponList.getCouponName()}</td>
									<td><fmt:formatDate value="${couponList.getCouponRegDate()}" pattern="yyyy-MM-dd" /> ~
										<fmt:formatDate value="${couponList.getCouponEndDate()}" pattern="yyyy-MM-dd" /></td>
									<td>${couponList.getCouponTermPrice()}원이상</td>
									<td>${couponList.getCouponDiscount()}원</td>
									<td>${couponList.getCouponRemain()}</td>
									<td><button>수량추가</button></td>
									<td><button onclick="deleteBtn('${couponList.couponCode}')">매진처리</button></td>
								</tr>
							</c:forEach>

						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- aside -->
<script>
	function deleteBtn(couponCode){
	
		console.log(couponCode);
		$.ajax({
			url: "<%=request.getContextPath() %>/ceoMenu/couponList/deleteLine",
			type: "post",
			data: {
				couponCode : couponCode
			},
			dataType: "json",
			contentType : "application/json; charset=utf-8",
			success : function(data) {
				alert("삭제성공");
				console.log(data);
				$(".coupon-list").load(location.href + " .coupon-list");
			},
			error : function(e) {
				console.log(e);
			}
		});
	}

	function couponSubmitEvent(e) {
		const couponName = document.querySelector(".coupon-name").value;
		const couponRegDate = document.querySelector(".coupon-regdate").value;
		const couponEndDate = document.querySelector(".coupon-enddate").value;
		const couponTermPrice = document.querySelector(".coupon-term-price").value;
		const couponDiscount = document.querySelector(".coupon-discount").value;
		const couponRemain = document.querySelector(".coupon-remain").value;
		console.log(couponRegDate);
		console.log(couponEndDate);
		
		const generatedCode = document.getElementById('generated-code');
		
		var couponVO = {
			"couponName" : couponName,
			"couponRegDate" : couponRegDate,
			"couponEndDate" : couponEndDate,
			"couponTermPrice" : couponTermPrice,
			"couponDiscount" : couponDiscount,
			"couponRemain" : couponRemain
		};
		
		$.ajax({
			url : "<c:url value='/ceoMenu/couponList/generateCoupon'/>",
			type : "post",
			data : JSON.stringify(couponVO),
			dataType: "text",
			contentType : "application/json; charset=utf-8",
			success : function(data) {
				alert("성공");
				console.log(data);
				let temp = JSON.parse(data);
				console.log(temp.couponCode);
				generatedCode.value = temp.couponCode;
				$(".coupon-list").load(location.href + " .coupon-list");
			},
			error : function(e) {
				console.log(e);
			}
		});
	}
</script>
<%@ include file="../include/footer.jsp"%>