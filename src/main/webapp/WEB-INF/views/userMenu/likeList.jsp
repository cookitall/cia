<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ include file="../include/header.jsp"%>
<title>내 찜 목록</title>
    
    
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
		<section class="like-container">
    		<p class="like-title">찜 목록</p>

            <div class="like-wrap">
            	<div class="like-item">
                	<img class="store-logo" src="../img/chiken.jpg" alt="" />
                	<p class="like-store">마라탕 고양점</p>
                	<p class="star">⭐ 4.8</p>
              	</div>

              	<div class="like-item">
                	<img class="store-logo" src="../img/chiken.jpg" alt="" />
                	<p class="like-store">마라탕 고양점</p>
                	<p class="star">⭐ 4.8</p>
              	</div>

              	<div class="like-item">
                	<img class="store-logo" src="../img/chiken.jpg" alt="" />
                	<p class="like-store">마라탕 고양점</p>
                	<p class="star">⭐ 4.8</p>
              	</div>

              	<div class="like-item">
                	<img class="store-logo" src="../img/chiken.jpg" alt="" />
               	 	<p class="like-store">마라탕 고양점</p>
               	 	<p class="star">⭐ 4.8</p>
              	</div>

              	<div class="like-item">
                	<img class="store-logo" src="../img/chiken.jpg" alt="" />
                	<p class="like-store">마라탕 고양점</p>
                	<p class="star">⭐ 4.8</p>
              	</div>

              	<div class="like-item">
                	<img class="store-logo" src="../img/chiken.jpg" alt="" />
                	<p class="like-store">마라탕 고양점</p>
                	<p class="star">⭐ 4.8</p>
              	</div>
            </div>
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
    
    <%@ include file="../include/footer.jsp" %>