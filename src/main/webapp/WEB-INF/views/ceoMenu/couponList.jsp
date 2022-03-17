<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="../include/header.jsp"%>
<title>사업자 쿠폰관리</title>
<div class="ceo-page">
	<%@ include file="../include/aside.jsp"%>

    <div class="content">
          <div class="content-title">쿠폰관리</div>
          <div class="coupon-content">

            <div class="coupon-create">
                <div class="coupon-title">
                    <h2>쿠폰 생성</h2>
                </div>
                <form action="test2" method="POST">
                    <div class="coupon-wrap">
                        <label for="couponName">쿠폰 이름</label>
                        <input name="couponName" type="text">
                    </div>
                    <div class="coupon-wrap">
                        <label for="couponRegDate">사용 기한</label>
                        <input name="couponRegDate" type="date">
                       
                        <input name="couponEndDate" type="date">
                    </div>
                    <div class="coupon-wrap">
                        <label for="couponTermPrice">사용 조건</label>
                        <input name="couponTermPrice" type="number" value="0" step="1000">
                        원 이상
                    </div>
                    <div class="coupon-wrap">
                        <label for="couponDiscount">할인 금액</label>
                        <input name="couponDiscount" type="number" value="500" min="500" step="500">
                        원 할인
                    </div>
                    <div class="coupon-wrap">
                        <label for="couponRemain">쿠폰 수량</label>
                        <input name="couponRemain" type="number" value="100" min="100" step="100"> 개
                    </div>
                    <button type="reset">취소</button>
                    <button type="submit" id="#couponSubmit">쿠폰 코드 생성하기</button>
                </form>
            </div>
            <hr>
            <div class="coupon-code">
                <div class="coupon-title">
                    <h4>생성된 쿠폰 코드</h4>
                </div>
                <textarea name="coupon-code" id="generated-code" cols="30" rows="1" readonly></textarea>
            </div>
            <hr>
            <div class="coupon-code">
              <div class="coupon-title">
                  <h2>쿠폰 목록</h2>
              </div>
              <div class="coupon-list-wrap">
                <table class="coupon-list">
                  <thead>
	                  <tr>
	                      <th>코드</th>
	                      <th>이름</th>
	                      <th>사용 기한</th>
	                      <th>사용 조건</th>
	                      <th>할인 금액</th>
	                      <th>잔여수량</th>
	                      <th></th>
	                      <th></th>
	                  </tr>
                  </thead>
                  <tbody>
                  <c:forEach items="${list}" var="list">
	                  <tr>
	                      <td>aas4f86461</td>
	                      <td>오픈기념 쿠폰</td>
	                      <td>${startDate} ~ ${endDate}</td>
	                      <td>${minPrice}원 이상</td>
	                      <td>${discount}원</td>
	                      <td>1000개</td>
	                      <td><button>수량추가</button></td>
	                      <td><button>매진처리</button></td>
	                  </tr>
                  </c:forEach>
                  
                  </tbody>
                </table>
              </div>
            </div>
        </div>
        </div>
</div><!-- aside -->

<%@ include file="../include/footer.jsp"%>