<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>	
<!DOCTYPE html>
<%@ include file="../include/header.jsp"%>

<title>상점보기</title> 
<!-- 상점보기 EL로 처리해야함 -->


 <nav class="category-nav">
 	<ul class="menu-list">
		<li><a href="<c:url value='/shop/categoryList?category=all' />">전체보기</a></li>
   <!-- <li><a href="<c:url value='/shop/categoryList?category=' />">랜덤</a></li>   -->
		<li><a href="<c:url value='/shop/categoryList?category=chicken' />">치킨</a></li>
		<li><a href="<c:url value='/shop/categoryList?category=pizza' />">피자</a></li>
		<li><a href="<c:url value='/shop/categoryList?category=ham' />">햄버거</a></li>
		<li><a href="<c:url value='/shop/categoryList?category=korea' />">한식</a></li>
		<li><a href="<c:url value='/shop/categoryList?category=china' />">중식</a></li>
		<li><a href="<c:url value='/shop/categoryList?category=west' />">양식</a></li>
		<li><a href="<c:url value='/shop/categoryList?category=jap' />">일식</a></li>
  </ul>
</nav>
 <div class="content-wrap">
	<section class="store-container">
		<div class="store-title">${shopInfo.shopName}</div>
		<div class="store-wrap">
			<img class="store-logo" src="<c:url value='/img/${shopInfo.shopCategory}.png' />" alt="" />
            <div class="store-info">
				<span class="store-intr">${shopInfo.shopInfo}.</span>
				<br />
				<span class="star">★★★★★ ${shopInfo.avgStar}</span> <br />
				<span class="delivery-price">배달비 ${shopInfo.deliveryPrice}원</span> <br />
				<!-- <span class="min-price">최소 주문 금액 19,800원</span> <br /> -->
			</div>
		</div>

		<div class="btn-container">
			<button class="store-info-btn">정보</button>
			<button class="store-review-btn">리뷰</button>
		</div>
          <div class="info-wrap" style="display: none">
          	가게 전화번호 : ${shopInfo.shopNum}<br>
          	가게 주소 : ${shopInfo.shopAddr1}<br>
          	${shopInfo.shopAddr2}<br>
          </div>
          
          <div class="review-wrap" style="display: none">
	            <!-- 반복문 요소 -->
		<c:forEach var="rrList" items="${reviewReplyList}">
			<div class="review">
				<div class="user">
					<div class="buy-info">
						<div class="star-time">
							${rrList.userId} ⭐⭐⭐⭐⭐ ${rrList.reviewDate}
						</div>
						<ul>
							<c:forEach var="oml" items="${rrList.orderMenuList}">
								<li class="menu">${oml.menu.menuName}</li>
							</c:forEach>
						</ul>
					</div>
				</div>
				<div class="text-wrap">
					<textarea name="" cols="60" rows="2" readonly>${rrList.reviewContent}
					</textarea>
				</div>
				<c:if test="${not empty rrList.replyVO.replyDate}">
					<div class="ceo">
						<div class="text-wrap">
							<div class="star-time">
								사장님 ${rrList.replyVO.replyDate}
							</div>
							<textarea name="" cols="60" rows="2" readonly>${rrList.replyVO.replyContent}
							</textarea>
						</div>
					</div>
				</c:if>
			</div>
		</c:forEach>
		</div>
			
          <!-- 메뉴 상세 리스트 -->
          <div class="menu-container">
            <ul>
            	<c:forEach var="ml" items="${menuList}">
	              <li class="menu">
	                <div class="menu-item">
	                  <span class="menu-title">${ml.menuName}</span>
	                  <p class="menu-info">${ml.menuInfo}</p>
	                  <span class="menu-price">${ml.menuPrice}</span>원
	               	  <span class="menu-num">${ml.menuNum}</span>
	                </div>
	                <img src="" alt="" />
	              </li>
              	</c:forEach>
            </ul>
          </div>
        </section>

        <section class="order-table">
          <div class="title">주 문 표</div>
          <form action="<c:url value="/shop/order" />">
          <ul>
            <li>
              <span class="menu">배달료</span>
              <span class="price">${shopInfo.deliveryPrice}</span>원
            </li>
          </ul>
          <div class="total-price">
            <span class="menu">메뉴 합계</span>
            <input type="number" class="price" name="originalPrice" id="originalPrice">원
          </div>
          <input type="hidden" name="shopName" id="shopName" value="${shopInfo.shopName}">
          <button  class="order-btn">주문하기</button>
          </form>
        </section>
      </div>
	
<script>
	
	const $infoBtn = document.querySelector('.store-info-btn');
	const $reviewBtn = document.querySelector('.store-review-btn')
	
	const $infoWrap = document.querySelector('.info-wrap');
	const $reviewWrap = document.querySelector('.review-wrap');
	
	//정보 버튼
	$infoBtn.addEventListener('click', function(e){
		if($infoWrap.style.display = "none"){
			$infoWrap.style.display = "block";
			$reviewWrap.style.display = "none";
		}
	});
	
	//리뷰 버튼
	$reviewBtn.addEventListener('click', function(e){
		if($reviewWrap.style.display = "none"){
			$reviewWrap.style.display = "block";
			$infoWrap.style.display = "none";
		}
	});
	
	
	//메뉴 선택 이벤트
	const $menuList = document.querySelector('.menu-container ul');
	$menuList.addEventListener('click', function(e){
		if(e.target.matches('ul')){
			return;
		}
		
		let $e = e.target;
		for(;$e.className != 'menu' ; $e = $e.parentElement);
		console.log($e + "이벤트 발생"); //$e = 선택한 li
		const menuName = $e.firstElementChild.firstElementChild.textContent;
		const menuPrice = $e.firstElementChild.firstElementChild.nextElementSibling.nextElementSibling.textContent;
		const menuNum = $e.firstElementChild.lastElementChild.textContent;
		//반복문으로 변수 선언해야 하지만..
		console.log(menuName + menuPrice + '클릭');
		
		const $inputList = document.querySelectorAll('.order-item .order-name');
		if($inputList.length == 0){
			addMenu();
		}else{
			for(let $i of $inputList) {
				if($i.textContent == menuName){				
					const amount = Number($i.nextElementSibling.getAttribute('value')) + 1;
					$i.nextElementSibling.setAttribute('value', amount);
					$i.nextElementSibling.nextElementSibling.textContent = Number(menuPrice) * amount;
					calc();
					return;
				}
	        }
			addMenu();
		}
		
		
		//메뉴 추가
		function addMenu() {
			const $orderList = document.querySelector('.order-table ul');
	   		
	   		const $addMenu = document.createElement('li');
	   		$addMenu.setAttribute('class', 'order-item');
	   		
	   		const $divName = document.createElement('input');
	   		$divName.setAttribute('class', 'order-name');
	   		$divName.setAttribute('name', 'menuName');
	   		$divName.setAttribute('id', 'menuName');
	   		$divName.value = menuName;
	   		$addMenu.appendChild($divName);
	   		
	   		const $menuNum = document.createElement('input');
	   		$menuNum.setAttribute('class', 'menuNum');
	   		$menuNum.setAttribute('name', 'menuNum');
	   		$menuNum.setAttribute('id', 'menuNum');
	   		$menuNum.setAttribute('type', 'hidden');
	   		$menuNum.value = menuNum;
	   		$addMenu.appendChild($menuNum);
	   		
	   		const $input = document.createElement('input');
	   		$input.setAttribute('type', 'number');
	   		$input.setAttribute('id', 'amount');
	   		$input.setAttribute('name', 'amount');
	   		$input.setAttribute('min', '1');
	   		$input.setAttribute('value', '1');
	   		$input.setAttribute('max', '10');
	   		$addMenu.appendChild($input);
	   		
	   		const $divPrice = document.createElement('input');
	   		$divPrice.setAttribute('class', 'order-price');
	   		$divPrice.setAttribute('name', 'menuPrice');
	   		$divPrice.setAttribute('id', 'menuPrice');
	   		$divPrice.value = menuPrice;
	   		$addMenu.appendChild($divPrice);
	   		
	   		const $delBtn = document.createElement('button');
	   		$delBtn.setAttribute('type', 'button');
	   		$delBtn.textContent = '❌';
	   		$addMenu.appendChild($delBtn);
	        
	   		$orderList.appendChild($addMenu);
	   		
	   		calc();
		}
		
	});
	
	//총 결제 금액 계산
	function calc() {
		const $priceList = document.querySelectorAll('.order-item .order-price');
		let sum = 0;
		for(let $price of $priceList) {
			sum += Number($price.value);
		}
		const $totalPrice = document.querySelector('.total-price .price');
		document.getElementById('originalPrice').value = sum;
	}
	
	//삭제 버튼 이벤트
	const $orderList = document.querySelector('.order-table > form > ul')
	$orderList.addEventListener('click', function(e){
		if(!e.target.matches('.order-table > form > ul button')){
			return;
		};
		console.log(e.target);
		$orderList.removeChild(e.target.parentNode);
		calc();
	});
	
	//주문하기 버튼 페이지 이동
	/* const $orderBtn = document.querySelector('.order-btn');
	$orderBtn.addEventListener('click', function sendPost(url, params) {
		const 
		
		var form = document.createElement('form');
		form.setAttribute('method', 'post');
		form.setAttribute('target', '_self');
		form.setAttribute('action', "<c:url value='/shop/order'/>");
		document.charset = "UTF-8";
		for (var key in params) {
			var input1 = document.createElement('input');
			input1.setAttribute('type', 'hidden');
			input1.setAttribute('name', menuName);
			input1.setAttribute('value', params[key]);
			form.appendChild(input1);
		}
		document.body.appendChild(form);
		form.submit();
	}); */
	
	
	
	
	
	
</script>

<%@ include file="../include/footer.jsp"%>