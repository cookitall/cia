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
	
	<!-- <div>
		<select class="orderBy" name="orderBy">
			<option value="orderQuantity">주문량 많은순</option>
			<option value="orderQuantity">별점순</option>
			<option value="orderQuantity">거리 가까운 순</option>
		</select>
	</div> -->
	
	<c:forEach var="vo" items="${shopList}">
		<div class="category-store" id="${vo.shopName}">
			<img class="store-logo" src="<c:url value='/img/${vo.shopCategory}.png' />" alt="">
			<div class="store-info">
				<span class="store-title">${vo.shopName}</span>
				<div class="store-etc">
					<span class="star">★ ${vo.avgStar}</span> <br> 
					<span class="review">리뷰 ${vo.reviewCount}개</span> | 
					<span class="store-comment">사장님 댓글 ${vo.replyCount}개</span>
				</div>
			</div>
		</div>
	</c:forEach>
</section>



				<form action="<c:url value='/shop/categoryList' />" name="pageForm">
	                        <div class="text-center clearfix">
	                            <hr>
	                            <ul class="pagination" id="pagination">
	                            	<c:if test="${pc.prev}">
	                                	<li><a href="#" data-pageNum="${pc.beginPage-1}">이전</a></li>
	                                </c:if>
	                                
	                                <c:forEach var="num" begin="${pc.beginPage}" end="${pc.endPage}">
	                                	<li class="${pc.paging.pageNum == num ? 'active' : 'nop'}"><a href="#" data-pageNum="${num}">${num}</a></li>
	                                </c:forEach>
	                                
	                                <c:if test="${pc.next}">
	                               		<li><a href="#" data-pageNum="${pc.endPage+1}">다음</a></li>
	                                </c:if>
	                            </ul>
	                            
	                            <input type="hidden" name="pageNum" value="${pc.paging.pageNum}">
	                            <input type="hidden" name="countPerPage" value="${pc.paging.countPerPage}">
	                        </div>
                        </form>

<%@ include file="../include/footer.jsp"%>

<script>
	const $scc = document.querySelector('.category-container');
	const $cs = document.querySelector('.category-store');
	$scc.addEventListener('click', function(e){
		if(!e.target.matches('.category-container > .category-store *')){
			return;
		};
		let $tag = e.target;
		for(;$tag.className != 'category-store' ; $tag=$tag.parentElement);
		console.log($tag + '클릭 이벤트 발생')
	    location.href ="<c:url value='/shop/storeContent?shopName=' />" + $tag.id;
	});
	
	$(function() {
		$('#pagination').on('click', 'a', function(e) {
			e.preventDefault();
			console.log($(this));
			const value = $(this).data('pagenum');
			console.log(value);
			document.pageForm.pageNum.value = value;
			document.pageForm.submit();
		});
	});
	
</script>













