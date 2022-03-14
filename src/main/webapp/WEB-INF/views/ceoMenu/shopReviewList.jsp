<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@ include file="../include/header.jsp" %>
<title>상점 리뷰 관리</title>
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
  <div class="content">
          <div class="content">
            <section class="review-wrap">
              <h2 class="title">리뷰 목록</h2>
              
              <!-- 반복문 요소 -->
              <div class="review">
                <div class="user">
                  <div class="buy-info">
                    <div class="name">홍길동 회원님</div>
                    <div class="star-time">⭐⭐⭐⭐⭐ 2021년 12월 13일</div>
                    <ul>
                      <li class="menu">마라탕</li>
                      <li class="menu">마라샹궈</li>
                    </ul>
                  </div>
                </div>
                <div class="text-wrap">
                  <textarea name="" cols="60" rows="2" readonly>맛있게 잘 먹었습니다~</textarea>
                </div>
                <div class="ceo">
                  <div class="text-wrap">
                    <textarea name="" cols="60" rows="2" placeholder="댓글을 작성해 보세요"></textarea>
                  </div>
                </div>
                <div class="btn-wrap">
                  <a class="yellow-btn" href="">등록</a>
                  <a class="yellow-btn" href="">수정</a>
                  <a class="pink-btn" href="">삭제</a>
                </div>
              </div>
              <!-- 반복문 요소 end -->
            </section>
            
            <ul class="pagination">
              <li><a href="#">이전</a></li>
              <li><a href="#">1</a></li>
              <li><a href="#">2</a></li>
              <li><a href="#">3</a></li>
              <li><a href="#">4</a></li>
              <li><a href="#">5</a></li>
              <li><a href="#">다음</a></li>
          </ul>
          
          </div>
        </div>
      </div><!-- aside -->


<%@ include file="../include/footer.jsp" %>