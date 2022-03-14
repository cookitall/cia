<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>	
<!DOCTYPE html>
<%@ include file="../include/header.jsp"%>
    <title>내 리뷰 목록</title>


 <div class="user-page">
	<aside id="aside">
		<div class="aside-title">
            My<br /><br />
            쿡잇올!
          </div>
          <ul>
            <li>내 포인트</li>
            <li>주문내역</li>
            <li>찜 목록</li>
            <li>리뷰 목록</li>
            <li>내 정보 수정</li>
          </ul>
	</aside>
	
    <div class="content">
          <section class="review-wrap">
          <h2 class="title">리뷰 목록</h2>
            
            <!-- 반복문 요소 -->
          <div class="review">
          	<div class="user">
            	<div class="buy-info">
            		<div class="name">손오공 마라탕 ></div>
                    <div class="star-time">⭐⭐⭐⭐⭐ 2021년 12월 13일</div>
                    <ul>
                    	<li class="menu">마라탕</li>
                    	<li class="menu">마라샹궈</li>
                    </ul>
                </div>
                <div class="btn-wrap">
                  <a class="yellow-btn" href="">수정</a>
                  <a class="pink-btn" href="">삭제</a>
                </div>
			</div>
            <div class="text-wrap">
            	<textarea name="" cols="60" rows="2" readonly>
					맛있게 잘 먹었습니다~
				</textarea>
           </div>
           <div class="ceo">
           		<div class="text-wrap">
                	<textarea name="" cols="60" rows="2" readonly>
				  		손오공 마라탕: 주문해 주셔서 감사합니다
				  	</textarea>
                </div>
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


<%@ include file="../include/footer.jsp"%>