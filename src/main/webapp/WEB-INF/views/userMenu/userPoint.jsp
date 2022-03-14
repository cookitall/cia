<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>	
<!DOCTYPE html>
<%@ include file="../include/header.jsp"%>

    <title>내 포인트</title>

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
    	<section class="mypointMain">
        	<div class="pointbox">
              <h1>홍길동님 환영합니다!</h1>
              <div class="point">보유포인트 35,600원</div>
              <br />
              <span>1원 이상 1원 단위로 사용 가능</span> <br />
              <span>최대 50만원까지 보유 가능</span><br /><br />

              <ul id="btn_line">
                <li><button class="btn-open-popup-refund">환급하기</button></li>
                <li><button class="btn-open-popup-charge">충전하기</button></li>
              </ul>
            </div>
          </section>
          <div class="user-info">
            
          </div>
	</div>
</div>

      <!-- 환불 모달창 -->
<div class="modal hidden modal-refund">
	<div class="modal_body">
		<div class="panel">
			<div class="panel-heading">환급하기</div>

            <div class="user-point">
              현재 보유중인 포인트<br>
              23.000원
            </div>
            <form action="">
              <input type="number" min="1" value="1000" required>
            </form>
        </div>
        <div class="comment-btn">
            <button class="close">취소</button>
            <button>확인</button>
        </div>
	</div>
</div>

      <!-- 충전 모달창 -->
<div class="modal hidden modal-charge">
	<div class="modal_body">
		<div class="panel">
			<div class="panel-heading">충전하기</div>

            <div class="panel-body">
            	<div class="user-point">
                	현재 보유중인 포인트<br>
                	23.000원
              	</div>
				<form action="/member/pointCharge" method="post" name="updatePoint" th:object="${member}">
                	<input type="hidden" name="memberId" id="memberId" th:value="${member.memberId}">
                	<input type="hidden" name="pointType" id="pointType" value="포인트 충전">
                	<div class="form-check">
                    	<input class="form-check-input" type="radio" id="10000" name="pointPoint"
                        	th:value="10000" checked>
                    	<label class="form-check-label" for="10000">
                        	10,000p
                    	</label>
                	</div>
                	<div class="form-check">
                    	<input class="form-check-input" type="radio" name="pointPoint" id="50000"
                        	th:value="50000">
                    	<label class="form-check-label" for="50000">
                        	50,000p
                    	</label>
                	</div>
                	<div class="form-check">
                    	<input class="form-check-input" type="radio" name="pointPoint" id="100000"
                        	th:value="100000">
                    	<label class="form-check-label" for="100000">
                        	100,000p
                    	</label>
                	</div>
				</form>
			</div>
		</div>
        <div class="comment-btn">
            <button class="close">취소</button>
            <button>확인</button>
        </div>
	</div>
</div>

    
    <%@ include file="../include/footer.jsp"%>
    
    
    <!-- modal 스크립트 -->
    <!-- 모달 오픈 클래스 class="btn-open-popup" -->
    <script>
      //환급하기
      const modalRefund = document.querySelector(".modal-refund");
      const btnOpenPopupRefund = document.querySelector(
        ".btn-open-popup-refund"
      );
      const closeRefund = document.querySelector(".modal-refund .close");
      btnOpenPopupRefund.addEventListener("click", function () {
        modalRefund.classList.remove("hidden");
      });
      closeRefund.addEventListener("click", function () {
        modalRefund.classList.add("hidden");
      });

      // 충전하기
      const modalCharge = document.querySelector(".modal-charge");
      const btnOpenPopupCharge = document.querySelector(
        ".btn-open-popup-charge"
      );
      const closeCharge = document.querySelector(".modal-charge .close");
      btnOpenPopupCharge.addEventListener("click", function () {
        modalCharge.classList.remove("hidden");
      });
      closeCharge.addEventListener("click", function () {
        modalCharge.classList.add("hidden");
      });
    </script>