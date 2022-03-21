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
            <li><a href="<c:url value='/userMenu/userPoint'/>">내 포인트</a></li>
            <li><a href="<c:url value='/userMenu/orderHistory'/>">주문내역</a></li>
            <li><a href="<c:url value='/userMenu/likeList'/>">찜 목록</a></li>
            <li><a href="<c:url value='/userMenu/reviewList'/>">리뷰 목록</a></li>
            <li><a href="<c:url value='/userInfo/modify'/>">내 정보 수정</a></li>
          </ul>
	</aside>
	
    <div class="content">
          <section class="review-wrap">
          <h2 class="title">리뷰 목록</h2>
            
            <!-- 반복문 요소 -->
          <c:forEach var="review" items="${reviews}">
	          <div class="review">
	          	<div class="user">
	            	<div class="buy-info">
	            		<div class="name">${review.shopName}</div>
	                    <div class="star-time">${review.reviewDate}</div>
	                    <ul>
	                    	<li class="menu">${review.menuName}</li>
	                    	
	                    </ul>
	                </div>
	                <div class="btn-wrap">
	                  <a class="pink-btn" href="">삭제</a>
	                </div>
				</div>
	            <div class="text-wrap">
	            	<textarea name="" cols="60" rows="2" readonly>
						${review.reviewContent}
					</textarea>
	           </div>
	           
	           <c:forEach var="reply" items="${replys}">
	           	   <c:if test="${reply.reviewNum == review.reviewNum}">
			           <div class="ceo">
			           		<div class="text-wrap">
			           	
			                	<textarea name="" cols="60" rows="2" readonly>
							  		${reply.shopName} : "${reply.replyContent}"
							  	</textarea>
			                </div>
			            </div>
		        	</c:if>
	            </c:forEach>
			</div>
		</c:forEach>
            <!-- 반복문 요소 end -->
                       
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


<%@ include file="../include/footer.jsp"%>
    
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