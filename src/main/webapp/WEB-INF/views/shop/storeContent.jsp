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
            <img class="store-logo" src="../img/chiken.jpg" alt="" />
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
	          <div class="review">
	          	<div class="user">
	            	<div class="buy-info">
	                    <div class="star-time">⭐⭐⭐⭐⭐ 2021년 12월 13일</div>
	                    <ul>
	                    	<li class="menu">마라탕</li>
	                    	<li class="menu">마라샹궈</li>
	                    </ul>
	                </div>
				</div>
	            <div class="text-wrap">
	            	<textarea name="" cols="60" rows="2" readonly>맛있게 잘 먹었습니다~
					</textarea>
	           </div>
	           <div class="ceo">
	           		<div class="text-wrap">
	                	<textarea name="" cols="60" rows="2" readonly>손오공 마라탕: 주문해 주셔서 감사합니다
					  	</textarea>
	                </div>
	            </div>
	            </div>
			</div>
			
          <!-- 메뉴 상세 리스트 -->
          <div class="menu-container">
            <ul>
            	<c:forEach var="vo" items="${MenuList}">
	              <li>
	                <div class="menu-item">
	                  <span class="menu-title"></span>
	                  <p class="menu-info"></p>
	                  <span class="menu-price"></span>
	                </div>
	                <img class="menu-img" src="../img/chiken.jpg" alt="" />
	              </li>
              	</c:forEach>
            </ul>
          </div>
        </section>

        <section class="order-table">
          <div class="title">주 문 표</div>
          <ul>
            <li class="order-item">
              <div>페페로니 피자</div>
              <input
                type="number"
                name=""
                id="amount"
                min="1"
                value="1"
                max="10"
              />
              <div>19,900원</div>
              <button type="button">❌</button>
            </li>
            <li class="order-item">
              <div>페페로니 피자</div>
              <input
                type="number"
                name=""
                id="amount"
                min="1"
                value="1"
                max="10"
              />
              <div>19,900원</div>
              <button type="button">❌</button>
            </li>
            <li class="order-item">
              <div>페페로니 피자</div>
              <input
                type="number"
                name=""
                id="amount"
                min="1"
                value="1"
                max="10"
              />
              <div>19,900원</div>
              <button type="button">❌</button>
            </li>
            <li>
              <span class="menu">배달료</span>
              <span class="price">3,000원</span>
            </li>
          </ul>
          <div class="total-price">
            <span class="menu">총 결제 금액</span>
            <span class="price">24,000원</span>
          </div>
          <button type="button" class="order-btn" onclick="<c:url value='/shop/order'/>">주문하기</button>
        </section>
      </div>
	
<script>
	
	const $infoBtn = document.querySelector('.store-info-btn');
	const $reviewBtn = document.querySelector('.store-review-btn')
	
	const $infoWrap = document.querySelector('.info-wrap');
	const $reviewWrap = document.querySelector('.review-wrap');
	
	$infoBtn.addEventListener('click', function(e){
		if($infoWrap.style.display = "none"){
			$infoWrap.style.display = "block";
			$reviewWrap.style.display = "none";
		}
	});
	
	$reviewBtn.addEventListener('click', function(e){
		if($reviewWrap.style.display = "none"){
			$reviewWrap.style.display = "block";
			$infoWrap.style.display = "none";
		}
	});
	
</script>

<%@ include file="../include/footer.jsp"%>