<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<!-- 결제 api 삽입 예정 -->
<%@ include file="../include/header.jsp" %>
<title>결제 성공</title>
<body>
    <div class="payment-success">
        <img
          class="suc-img"
          src="../include/img/android-chrome-192x192.png"
          alt=""
        />
        <p class="payment-suc">결제성공!</p>
        <p class="payment-massage">업소에서 주문을 접수하게 되면</p>
        <p class="payment-massage">SMS로 접수 완료를 알려드립니다.</p>
        <img class="pay-complet-img" src="../img/chiken.jpg" alt="" />
        <button>주문내역 확인하기</button>
        <button class="btn-open-popup">별점 리뷰 남기기</button>
        <small>*리뷰는 주문 2시간 후에 작성가능합니다</small>
      </div>

      <!-- 모달창 -->
      <div class="modal hidden">
        <div class="modal_body">
          <div class="panel">
            <div class="panel-heading">음식 후기</div>
            <div class="star-rating space-x-4 mx-auto">
              <input
                type="radio"
                id="5-stars"
                name="rating"
                value="5"
                v-model="ratings"
              />
              <label for="5-stars" class="star pr-4">★</label>
              
              <input
                type="radio"
                id="4-stars"
                name="rating"
                value="4"
                v-model="ratings"
              />
              <label for="4-stars" class="star">★</label>
              
              <input
                type="radio"
                id="3-stars"
                name="rating"
                value="3"
                v-model="ratings"
              />
              <label for="3-stars" class="star">★</label>
              
              <input
                type="radio"
                id="2-stars"
                name="rating"
                value="2"
                v-model="ratings"
              />
              <label for="2-stars" class="star">★</label>
              
              <input
                type="radio"
                id="1-star"
                name="rating"
                value="1"
                v-model="ratings"
              />
              <label for="1-star" class="star">★</label>
              
            </div>
            
            <div class="panel-body">
              <textarea
                class="form-control"
                rows="15"
                cols="30"
                name="request"
                maxlength="300"
                placeholder="후기를 남겨주세요"
              ></textarea>
            </div>
          </div>
          <div class="comment-btn">
            <button class="close">취소</button>
            <button>확인</button>
          </div>
        </div>
      </div>

    <script>
        const modal = document.querySelector('.modal');
        const btnOpenPopup = document.querySelector('.btn-open-popup'); btnOpenPopup.addEventListener('click', () => { modal.style.display = 'block'; });
    </script>

</body>

<%@ include file="../include/footer.jsp" %>

 <!-- modal 스크립트 -->
    <!-- 모달 오픈 클래스 class="btn-open-popup" -->
    <script>
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