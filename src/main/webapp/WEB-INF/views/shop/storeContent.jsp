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
          <div class="store-title">잭슨피자 xx점</div>
          <div class="store-wrap">
            <img class="store-logo" src="../img/chiken.jpg" alt="" />
            <div class="store-info">
              <span class="store-intr"
                >모두에게 저렴하고 맛있는 피자 잭슨피자 신촌점입니다.</span
              >
              <br />
              <span class="star">★★★★★ 4.8</span> <br />
              <span class="min-price">최소 주문 금액 19,800원</span> <br />
            </div>
          </div>

          <div class="btn-container">
            <button class="store-info-btn">정보</button>
            <button class="store-review-btn">리뷰</button>
          </div>

          <!-- 메뉴 상세 리스트 -->
          <div class="menu-container">
            <ul>
              <li>
                <div class="menu-item">
                  <span class="menu-title">하와이안 피자 </span>
                  <p class="menu-info">간장 양념을 바른 달콤한 치킨입니다.</p>
                  <span class="menu-price">12,000원</span>
                </div>
                <img class="menu-img" src="../img/chiken.jpg" alt="" />
              </li>
              <li>
                <div class="menu-item">
                  <span class="menu-title">하와이안 피자 </span>
                  <p class="menu-info">간장 양념을 바른 달콤한 치킨입니다.</p>
                  <span class="menu-price">12,000원</span>
                </div>
                <img class="menu-img" src="../img/chiken.jpg" alt="" />
              </li>
              <li>
                <div class="menu-item">
                  <span class="menu-title">하와이안 피자 </span>
                  <p class="menu-info">간장 양념을 바른 달콤한 치킨입니다.</p>
                  <span class="menu-price">12,000원</span>
                </div>
                <img class="menu-img" src="../img/chiken.jpg" alt="" />
              </li>
              <li>
                <div class="menu-item">
                  <span class="menu-title">하와이안 피자 </span>
                  <p class="menu-info">간장 양념을 바른 달콤한 치킨입니다.</p>
                  <span class="menu-price">12,000원</span>
                </div>
                <img class="menu-img" src="../img/chiken.jpg" alt="" />
              </li>
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


<%@ include file="../include/footer.jsp"%>