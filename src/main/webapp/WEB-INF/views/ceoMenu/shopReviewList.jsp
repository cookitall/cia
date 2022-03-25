<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@ include file="../include/header.jsp"%>
<title>상점 리뷰 관리</title>
<div class="ceo-page">
	<%@ include file="../include/aside.jsp"%>
	<div class="content">
		<div class="content">
			<section class="review-wrap">
				<h2 class="title">리뷰 목록</h2>

				<!-- 반복문 요소 -->

			<c:forEach var="review" items="${reviews}">
				<div class="review">
					<div class="user">
						<div class="buy-info">
							<div class="name">${review.userId}회원님</div>
							<div class="star-time">${review.reviewDate}</div>
							<div class="star">별점: ${review.reviewStar}</div>

						</div>
					</div>
					<div class="text-wrap">
						<textarea name="" cols="60" rows="2" readonly>${review.reviewContent}</textarea>
					</div>


						<c:choose>
							<c:when test="${review.reviewReply == 1}">
								<c:forEach var="reply" items="${replys}">
									<c:if test="${reply.reviewNum == review.reviewNum}">
										<form action="<c:url value='/ceoMenu/replyModify'/>">
											<div class="ceo">
												<div class="text-wrap">
												<input type="hidden" name="replyNum" id="replyNum" value="${reply.replyNum}">
												<textarea name="replyContent" id="replyContent" cols="60" rows="2">${reply.shopName} : "${reply.replyContent}"</textarea>
												</div>
											</div>
											<div class="btn-wrap">
												<button type="submit" class="yellow-btn">수정</button> 
												<button type="button" class="pink-btn" onclick="location.href='<c:url value="/ceoMenu/replyDelete?replyNum=${reply.replyNum}&reviewNum=${review.reviewNum}"/>'" >삭제</button>
											</div>
										</form>
									</c:if>
								</c:forEach>
							</c:when>	
			
			
							<c:otherwise>
								<form action="<c:url value='/ceoMenu/replyWrite'/>">
									<div class="ceo">
										<div class="text-wrap">
											<input type="hidden" name="writeReviewNum" id="writeReviewNum" value="${review.reviewNum}">
											<input type="hidden" name="writeShopName" id="writeShopName" value="${review.shopName}">
											<textarea name="writeReplyContent" id="writeReplyContent" cols="60" rows="2"></textarea>
										</div>
									</div>
									<div class="btn-wrap">
										<button type="submit" class="yellow-btn">작성</button>
									</div>
					            </form>	
							</c:otherwise>
						</c:choose>
					
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
							<li class="${pc.paging.pageNum == num ? 'active' : 'nop'}"><a
								href="#" data-pageNum="${num}">${num}</a></li>
						</c:forEach>

						<c:if test="${pc.next}">
							<li><a href="#" data-pageNum="${pc.endPage+1}">다음</a></li>
						</c:if>
					</ul>

					<input type="hidden" name="pageNum" value="${pc.paging.pageNum}">
					<input type="hidden" name="countPerPage"
						value="${pc.paging.countPerPage}">
				</div>
			</form>

		</div>
	</div>
</div>
<!-- aside -->


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
