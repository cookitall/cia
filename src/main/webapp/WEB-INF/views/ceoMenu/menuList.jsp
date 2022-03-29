<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>

<%@ include file="../include/header.jsp"%>

<title>사업자 메뉴 관리</title>

<div class="ceo-page">
	<%@ include file="../include/aside.jsp"%>
	<div class="content">
		<div class="content-title">메뉴관리</div>
		<div class="menu-container">
			<table class="menu-list">
				<caption>현재 메뉴</caption>
				<tr>
					<th class="menu-order">메뉴 번호</th>
					<th class="menu-img">이미지</th>
					<th class="menu-name">이 름</th>
					<th class="menu-price">가 격</th>
					<th class="menu-info">정 보</th>
					<th class="menu-btn"></th>
				</tr>
				<c:forEach var="result" items="${result}" varStatus="status" >
					<tr>
						<td class="menu-order">${result.menuNum}</td>
						<td class="menu-img"><img src="data:image/jpeg;base64,${result.encodedString}" alt="" /></td>
						<td class="menu-name">${result.menuName}</td>
						<td class="menu-price">${result.menuPrice}</td>
						<td class="menu-info">
						<textarea name="" id="" cols="60"
								rows="3">${result.menuInfo}</textarea>
						</td>
						<td class="menu-btn">
							<c:if test="${result.menuOpen eq 'open' }">
								<button type="button" class="btn sold-out-btn" style="background-color: var(--pink)"
								onclick="location.href='<c:url value="/ceoMenu/menuSold?menuOpen=close&menuNum=${result.menuNum}" />'">매진처리</button>
							</c:if>
							<c:if test="${result.menuOpen eq 'close' }">
								<button type="button" class="btn for-sale-btn" style="background-color: var(--prime-yellow)"
								onclick="location.href='<c:url value="/ceoMenu/menuSold?menuOpen=open&menuNum=${result.menuNum}" />'">판매시작</button>
							</c:if>
							<button type="button" class="btn modify-btn" onclick="popup${status.index}()">수정</button>
							<button type="button" class="btn del-btn" onclick="location.href='<c:url value="/ceoMenu/menuDelete?menuNum=${result.menuNum}" />'">삭제</button>
						</td>
					</tr>
					
					<!-- 모달창 -->
					<div class="modal hidden" id="modalModi${status.index}">
						<div class="modal_body">
							<div class="panel">
								<div class="panel-heading">메뉴 수정하기</div>
					
								<div class="panel-body">
									<div class="add-menu">
										<div class="menu-img">
											이미지 미리보기
											<br /> 
											<img id="preview" />
										</div>
										<form class="add-form" action="<c:url value='/ceoMenu/menuModi'/>" method="POST" enctype="multipart/form-data">
											<label for="img">이미지</label> 
											<input name="menuImage" id="menuImage" type="file" accept="image/jpeg, image/jpg, image/png" onchange="readURL(this);" required /> 
											<br/> 
											
											<label for="name">이름</label>
											<input name="menuName" id="menuName" type="text" required value="${result.menuName}" /> 
											<br/> 
											
											<label for="price">가격</label> 
											<input name="menuPrice" id="menuPrice" type="number" min="1000" required value="${result.menuPrice}"/> 
											<br/> 
											
											<label for="info">정보</label>
											<br/>
											<textarea name="menuInfo" id="menuInfo" cols="50" rows="4" required>${result.menuInfo}</textarea>
											
											<input type="hidden" name="menuNum" id="menuNum" value="${result.menuNum}">
											
											<div class="comment-btn">
												<button class="modalClose${status.index}">취소</button>
												<button>확인</button>
											</div>
										</form> 
									</div>
								</div>
							</div>
						</div>
					</div><!-- 모달종료 -->
				
					<script>
				      // 모달 오픈 클래스
				    const modal${status.index} = document.getElementById("modalModi${status.index}");
				  	const closeRefund${status.index} = document.querySelector(".modalClose${status.index}");
				  	
				  	function popup${status.index}() {
				  		modal${status.index}.classList.remove("hidden");
					}
						
					closeRefund${status.index}.addEventListener("click", function () {
						modal${status.index}.classList.add("hidden");
					});
					// modal 스크립트
					</script>
			
				</c:forEach>
				
			      
					
			</table>
		</div>
		<!-- 메뉴 container end -->
		<div class="content-title">메뉴추가</div>
		<div class="add-menu">
			<form class="add-form" action="menuList/menuSubmit" method="POST" enctype="multipart/form-data">
				
				<label for="img">이미지</label> 
				<input class="menu-image" name="menuImage" id="menuImage" type="file" accept="image/jpeg, image/jpg, image/png" required /> 
				<br /> 
				
				<label for="name">이름</label> 
				<input class="menu-name" name="menuName" type="text" required /> 
				<br /> 
				
				<label for="price">가격</label> 
				<input class="menu-price" name="menuPrice" type="number" min="1000" required /> 
				<br /> 
					
				<label for="info">정보</label>
				<br />
				<textarea class="menu-info" name="menuInfo" id="" cols="50" rows="4" required></textarea>
				<br />
				
				<input type="reset" value="취소" /> 
				<input type="submit" class="menu-submit-btn" value="등록하기"/>
			
			</form>
			<div class="menu-img">
				이미지 미리보기<br /> <img id="preview" />
			</div>
		</div>
	</div>
</div><!-- 여는 태그 aside에 포함 -->



<%@ include file="../include/footer.jsp"%>
<!-- 
<script>	
      // 이미지 미리보기
      function readURL(input) {
        if (input.files && input.files[0]) {
          var reader = new FileReader();
          reader.onload = function (e) {
            document.getElementById("preview").src = e.target.result;
          };
          reader.readAsDataURL(input.files[0]);
        } else {
          document.getElementById("preview").src = "";
        }
      }
      //이미지 미리보기 end      										
    </script>
 -->
