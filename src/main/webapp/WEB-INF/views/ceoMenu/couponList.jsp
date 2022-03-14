<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="../include/header.jsp"%>
<title>사업자 쿠폰관리</title>
<div class="ceo-page">
	<aside id="aside">
		<div class="aside-title">판매자 메뉴</div>
		<ul>
			<li>주문현황</li>
			<li>매출내역</li>
			<li>메뉴관리</li>
			<li>리뷰관리</li>
			<li>쿠폰관리</li>
			<li>정보관리</li>
		</ul>
	</aside>
    <div class="content">
          <div class="content-title">쿠폰관리</div>
          <div class="coupon-content">

            <div class="coupon-create">
                <div class="coupon-title">
                    <h2>쿠폰 생성</h2>
                </div>
                <form>
                    <div class="coupon-wrap">
                        <label for="coupon-name">쿠폰 이름</label>
                        <input name="coupon-name" type="text">
                    </div>
                    <div class="coupon-wrap">
                        <label for="coupon-deadline">사용 기한</label>
                        <input name="coupon-deadline-start" type="date">
                        ~
                        <input name="coupon-deadline-end" type="date">
                    </div>
                    <div class="coupon-wrap">
                        <label for="coupon-condition">사용 조건</label>
                        <input name="coupon-condition" type="number" value="0" step="1000">
                        원 이상
                    </div>
                    <div class="coupon-wrap">
                        <label for="coupon-discount">할인 금액</label>
                        <input name="coupon-discount" type="number" value="500" min="500" step="500">
                        원 할인
                    </div>
                    <div class="coupon-wrap">
                        <label for="coupon-">쿠폰 수량</label>
                        <input name="coupon-name" type="number" value="100" min="100" step="100"> 개
                    </div>
                    <button type="reset">취소</button>
                    <button>쿠폰 코드 생성하기</button>
                </form>
            </div>
            <hr>
            <div class="coupon-code">
                <div class="coupon-title">
                    <h4>생성된 쿠폰 코드</h4>
                </div>
                <textarea name="coupon-code" cols="30" rows="1" readonly>${쿠폰코드}</textarea>
            </div>
            <hr>
            <div class="coupon-code">
              <div class="coupon-title">
                  <h2>쿠폰 목록</h2>
              </div>
              <div class="coupon-list-wrap">
                <table class="coupon-list">
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
                </table>
              </div>
            </div>
        </div>
        </div>
</div><!-- aside -->

<%@ include file="../include/footer.jsp"%>