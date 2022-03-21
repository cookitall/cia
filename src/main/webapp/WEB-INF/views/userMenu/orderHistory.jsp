<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ include file="../include/header.jsp"%>
        <title>과거 주문내역</title>
    
    
<div class="user-page">
	<aside id="aside">
		<div class="aside-title">
            My<br /><br />
            쿡잇올!
          </div>
          <ul>
            <li><a href="<c:url value='/userMenu/userPoint'/>">내 포인트</a></li>
            <li><a href="<c:url value='/userMenu/orderHistory'/>">주문내역</a></li>
            <li><a href="<c:url value='/userMenu/likeList'/>">찜 목록</a></li>
            <li><a href="<c:url value='/userMenu/reviewList'/>">리뷰 목록</a></li>
            <li><a href="<c:url value='/userInfo/modify'/>">내 정보 수정</a></li>
          </ul>
	</aside>
	
    <div class="content">
		<section class="order-wrap">
        	<h2 class="title">주문내역</h2>
        	
        	<c:forEach var="oh" items="${ohList}">
	            <div class="ordered-content">
	              	<div class="store-content">
	                	<div class="left-side">
	                  		<p class="ordered-date">${oh.orderDate}</p>
	                  		<p class="ordered-store">${oh.shopName}</p>
	                	</div>
	                	<div class="menu-wrap">
	                  		<p class="ordered-menu">메뉴</p>
	                	</div>
	                	<div class="right-side">
	                  		<p class="ordered-price">${oh.odvo.orderPrice}원</p>
	                	</div>
	            	</div>
	            </div>
			</c:forEach>

		</section>
		
		 <form action="<c:url value='/userMenu/likeList' />" name="pageForm">
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
	</div>
</div>
        
    
    <%@ include file="../include/footer.jsp" %>
        
 <script>
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