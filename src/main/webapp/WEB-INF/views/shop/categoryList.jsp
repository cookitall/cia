<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<%@ include file="../include/header.jsp"%>

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

<section class="category-container">

	<div class="category-store" id="id"><!-- id 역시 el태그 $중괄호shopId중괄호 -->
	<!-- '' 안에 감싸진 텍스트는 EL형식으로 불러올 것임 $중괄호 -->  
	<!-- 이미지 링크도 /img/$중괄호열기category중괄호닫기 로 하면 됨 -->	
		<img class="store-logo" src="<c:url value='/img/chicken.png' />" alt="">
		<div class="store-info">
			<span class="store-title">'교촌치킨'</span>
			<div class="store-etc">
				<div class="delivery-fee">배달비 '5000'원</div>
				<span class="star">★ '4.8'</span> | 
				<span class="review">리뷰 '162' 개</span> | 
				<span class="store-comment">사장님 댓글 '102'</span>
			</div>
		</div>
	</div>

	<div class="category-store" id="id">
		<img class="store-logo" src="<c:url value='/img/chicken.png' />" alt="">
		<div class="store-info">
			<span class="store-title">'교촌치킨'</span>
			<div class="store-etc">
				<div class="delivery-fee">배달비 '5000'원</div>
				<span class="star">★ '4.8'</span> | 
				<span class="review">리뷰 '162' 개</span> | 
				<span class="store-comment">사장님 댓글 '102'</span>
			</div>
		</div>
	</div>
	
	<div class="category-store" id="id">
		<img class="store-logo" src="<c:url value='/img/chicken.png' />" alt="">
		<div class="store-info">
			<span class="store-title">'교촌치킨'</span>
			<div class="store-etc">
				<div class="delivery-fee">배달비 '5000'원</div>
				<span class="star">★ '4.8'</span> | 
				<span class="review">리뷰 '162' 개</span> | 
				<span class="store-comment">사장님 댓글 '102'</span>
			</div>
		</div>
	</div>

	<div class="category-store" id="id">
		<img class="store-logo" src="<c:url value='/img/chicken.png' />" alt="">
		<div class="store-info">
			<span class="store-title">'교촌치킨'</span>
			<div class="store-etc">
				<div class="delivery-fee">배달비 '5000'원</div>
				<span class="star">★ '4.8'</span> | 
				<span class="review">리뷰 '162' 개</span> | 
				<span class="store-comment">사장님 댓글 '102'</span>
			</div>
		</div>
	</div>
	
	<div class="category-store" id="id">
		<img class="store-logo" src="<c:url value='/img/chicken.png' />" alt="">
		<div class="store-info">
			<span class="store-title">'교촌치킨'</span>
			<div class="store-etc">
				<div class="delivery-fee">배달비 '5000'원</div>
				<span class="star">★ '4.8'</span> | 
				<span class="review">리뷰 '162' 개</span> | 
				<span class="store-comment">사장님 댓글 '102'</span>
			</div>
		</div>
	</div>
	
	<div class="category-store" id="id">
		<img class="store-logo" src="<c:url value='/img/chicken.png' />" alt="">
		<div class="store-info">
			<span class="store-title">'교촌치킨'</span>
			<div class="store-etc">
				<div class="delivery-fee">배달비 '5000'원</div>
				<span class="star">★ '4.8'</span> | 
				<span class="review">리뷰 '162' 개</span> | 
				<span class="store-comment">사장님 댓글 '102'</span>
			</div>
		</div>
	</div>
	
	<div class="category-store" id="id">
		<img class="store-logo" src="<c:url value='/img/chicken.png' />" alt="">
		<div class="store-info">
			<span class="store-title">'교촌치킨'</span>
			<div class="store-etc">
				<div class="delivery-fee">배달비 '5000'원</div>
				<span class="star">★ '4.8'</span> | 
				<span class="review">리뷰 '162' 개</span> | 
				<span class="store-comment">사장님 댓글 '102'</span>
			</div>
		</div>
	</div>
	
	<div class="category-store" id="id">
		<img class="store-logo" src="<c:url value='/img/chicken.png' />" alt="">
		<div class="store-info">
			<span class="store-title">'교촌치킨'</span>
			<div class="store-etc">
				<div class="delivery-fee">배달비 '5000'원</div>
				<span class="star">★ '4.8'</span> | 
				<span class="review">리뷰 '162' 개</span> | 
				<span class="store-comment">사장님 댓글 '102'</span>
			</div>
		</div>
	</div>

</section>



<form action="#" name="pageForm" class="pageForm">
	<div class="text-center clearfix">
		<hr>
		<ul class="pagination" id="pagination">
			<!-- <c:if test="${pc.prev}"> -->
			<li><a href="#" data-pageNum="${pc.beginPage-1}">이전</a></li>
			<!--</c:if>-->

			<!--<c:forEach var="num" begin="${pc.beginPage}" end="${pc.endPage}">-->
			<li class="${pc.paging.pageNum == num ? 'active' : ''}"><a
				href="#" data-pageNum="${num}">${num}</a></li>
			<!--</c:forEach>-->

			<!--<c:if test="${pc.next}">-->
			<li><a href="#" data-pageNum="${pc.endPage+1}">다음</a></li>
			<!--</c:if>-->
		</ul>


		<input type="hidden" name="pageNum" value="${pc.paging.pageNum}">
		<input type="hidden" name="countPerPage"
			value="${pc.paging.countPerPage}"> <input type="hidden"
			name="keyword" value="${pc.paging.keyword}"> <input
			type="hidden" name="condition" value="${pc.paging.condition}">


	</div>
</form>

<%@ include file="../include/footer.jsp"%>

<script>
	const $scc = document.querySelector('.category-container');
	const $cs = document.querySelector('.category-store');
	$scc.addEventListener('click', function(e){
	      if(!e.target.matches('$scc > $cs')){
	          return;
	      }
	      console.log(e.target.id);
	      const $id = e.target.id;
	      location.href ="/shop/shopContent?shopId=" + $id;
	  });
</script>













