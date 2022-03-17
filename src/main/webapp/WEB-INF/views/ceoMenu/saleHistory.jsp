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

              <div class="month-period">
                <h4>월간 내역 검색</h4>
                <form action="#">
                  <input name="monthHistorySta" type="date" max="9999-12-31" />
                  ~
                  <input name="monthHistoryEnd" type="date" max="9999-12-31" />
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
                    <td>${monthHistorySta} ~ ${monthHistoryEnd}</td>
                    <td>${historyCount}</td>
                    <td>${historyAllcount}</td>
                    <td>${historyDiscount}</td>
                    <td>${historyAlldel}</td>
                    <td>${netSale}</td>
                  </tr>
                </table>
              </div>

              <div class="week-period">
                <h4>주간 내역 검색</h4>
                <form action="#">
                  <input name="weekHistorySta" type="date" max="9999-12-31" />
                  ~
                  <input name="weekHistoryEnd" type="date" max="9999-12-31" />
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
                    <td>${weekHistorySta} ~ ${weekHistoryEnd}</td>
                    <td>${historyCount}</td>
                    <td>${historyAllcount}</td>
                    <td>${historyDiscount}</td>
                    <td>${historyAlldel}</td>
                    <td>${netSale}</td>
                  </tr>
                </table>
              </div>

              <div class="day-period">
                <h4>일간 내역 검색</h4>
                <form action="test" method="post">
                  <input name="dayHistorySta" type="date" max="9999-12-31"/>
                  ~
                  <input name="dayHistoryEnd" type="date" max="9999-12-31"/>
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
                    <td>${dayHistorySta} ~ ${dayHistoryEnd}</td>
                    <td>${historyCount}</td>
                    <td>${historyAllcount}</td>
                    <td>${historyDiscount}</td>
                    <td>${historyAlldel}</td>
                    <td>${netSale}</td>
                  </tr>
                </table>
              </div>
            </div>
          </div>
        </div>
      </div><!-- aside -->

<%@ include file="../include/footer.jsp" %>