<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@ include file="../include/header.jsp" %>


<title>매출 내역</title>
<div class="ceo-page">
	<%@ include file="../include/aside.jsp"%>
<div class="content">
          <div class="content-title">매출내역</div>
          <div class="saleHistoryMain">
            <div class="saleHistoryBox">
              <h2>판매내역</h2>
              <h5>*배달 완료건</h5>

           
 
              <div class="day-period">
                <h4>매출 내역 검색</h4>
                <form action="#" method="post">
                  <input name="daySta" id="daySta" type="date" max="9999-12-31"/>
                  ~
                  <input name="dayEnd" id="dayEnd" type="date" max="9999-12-31"/>
                  <button type="submit">조회</button>
                </form>
                <table>
                  <tr>
                    <th>기간</th>
                    <th>건수</th>
                    <th>금액</th>
                    <th>할인</th>
                    <th>배달대행료</th>
                    <th>순매출</th>
                  </tr>

                  <tr>
                    <td>${daySta} ~ ${dayEnd}</td>
                    <td>${order.hisCount}</td>
                    <td>${order.pay.originalPrice}</td>
                    <td>${order.pay.couponDiscount}</td>
                    <td>${order.deli.deliveryPrice}</td>
                    <td>${order.pay.orderPrice}</td>
                  </tr>
                </table>
              </div>
            </div>
          </div>
        </div>
      </div><!-- aside -->

<%@ include file="../include/footer.jsp" %>