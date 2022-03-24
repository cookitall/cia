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
					<th class="menu-order">순서</th>
					<th class="menu-img">이미지</th>
					<th class="menu-name">이 름</th>
					<th class="menu-price">가 격</th>
					<th class="menu-info">정 보</th>
					<th class="menu-btn"></th>
				</tr>
				<c:forEach var="result" items="${result}" varStatus="status" >
					<tr>
						<td class="menu-order">
							<button class="up">🔼</button> <br />
							<button class="down">🔽</button>
						</td>
						<td class="menu-img"><img src="data:image/jpeg;base64,${result.encodedString}" alt="" /></td>
						<td class="menu-name">${result.menuName}</td>
						<td class="menu-price">${result.menuPrice}</td>
						<td class="menu-info">
						<textarea name="" id="" cols="60"
								rows="3">${result.menuInfo}</textarea>
						</td>
						<td class="menu-btn">
							<button class="for-sail-btn">판매</button>
							<button class="sold-out-btn">매진</button> <br />
							<button class="modify-btn btn-open-popup">수정</button>
							<button class="del-btn">삭제</button>
						</td>
					</tr>
				</c:forEach>
			</table>
		</div>
		<!-- 메뉴 container end -->
		<div class="content-title">메뉴추가</div>
		<div class="add-menu">
			<form class="add-form" action="menuList/menuSubmit" method="POST" enctype="multipart/form-data">
				
				<label for="img">이미지</label> 
				<input class="menu-image" name="menuImage" type="file" accept="image/jpeg, image/jpg, image/png" required /> 
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

<!-- 모달창 -->
<div class="modal hidden">
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
					<form class="add-form" action="">
						<label for="img">이미지</label> 
						<input name="img" type="file" accept="image/jpeg, image/jpg, image/png"
							onchange="readURL(this);" required /> 
						<br/> 
						<label for="name">이름</label>
						<input name="name" type="text" required /> 
						<br/> 
						<label for="price">가격</label> 
						<input name="price" type="number"
								min="1000" required /> 
						<br/> 
						<label for="info">정보</label>
						<br/>
						<textarea name="info" id="" cols="50" rows="4" required></textarea>
					</form>
				</div>
			</div>
		</div>
		<div class="comment-btn">
			<button class="close">취소</button>
			<button>확인</button>
		</div>
	</div>
</div>

<%@ include file="../include/footer.jsp"%>
<script>

	
      // 이미지 미리보기
      /* 
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
      */
      //이미지 미리보기 end

      // modal 스크립트
      // 모달 오픈 클래스 class="btn-open-popup"
      const modal = document.querySelector(".modal");
      const btnOpenPopup = document.querySelector(".btn-open-popup");

      const close = document.querySelector(".close");
      btnOpenPopup.addEventListener("click", function () {
        modal.classList.remove("hidden");
      });
      close.addEventListener("click", function () {
        modal.classList.add("hidden");
      });
    </script>
