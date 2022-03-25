<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>

<%@ include file="../include/header.jsp" %>

<title>주문 현황</title>
<div class="ceo-page">
	<%@ include file="../include/aside.jsp"%>
 <div class="content">
 	<div class="content-title">주문내역</div>
    <div class="order-list">
    	<div class="order-wrap">
    	
        	<!-- 신규주문 테이블 -->
            <table class="new-order">
            	<caption>
                  신규 주문
                </caption>
                
                <tr>
                  <th class="order-num">주문 번호</th>
                  <th class="order-time">주문 시간</th>
                  <th class="order-menu">메 뉴/ 수량</th>
                  <th class="order-addr">주 소</th>
                  <th class="order-price">가 격</th>
                  <th class="order-btn"></th>
                </tr>
                
                <!-- 반복문 요소 -->
                <c:forEach var="newo" items="${newList}">
	                <tr>
	                  <td class="orderNum">${newo.orderNum}</td>
	                  <td class="order-time">${newo.orderDate}</td>
	                  <td class="order-menu">
	                    <ul>
                			<c:forEach var="om" items="${newo.orderMenu}">
	                     		<li><span>${om.menu.menuName}</span> <span>/ ${om.amount}</span></li>
	                      	</c:forEach>
	                    </ul>
	                  </td>
	                  <td class="order-addr">
	                    ${newo.odvo.userAddr1}
	                  </td>
	                  <td class="order-price">${newo.odvo.orderPrice}</td>
	                  <td class="order-btn">
	                  	<form action="<c:url value='/ceoMenu/orderCommit' />"> 
	                  		<input type="number" name="orderTimer" id="orderTimer" placeholder="배달 예상시간을 설정하세요">
	                  		<input type="hidden" name="state" id="state" value="commit">
	                  		<input type="hidden" name="orderNum" id="orderNum" value="${newo.orderNum}">
		                    <button type="submit" class="accetp-btn">접수</button>
		                    <button type="button" class="cancel-btn" onclick="location.href='<c:url value="/ceoMenu/orderUpdate?orderNum=${newo.orderNum}&state=calcel"/>'">취소</button>
	                  	</form>               
	                  </td>
	                </tr>
                </c:forEach>
                <!-- 반복문 요소 end -->
                
          
              </table>
            </div>

            <div class="order-wrap">
              <!-- 진행중 테이블 -->
              <table class="prcess-order">
                <caption>
                  접수완료
                </caption>
                <tr>
                  <th class="order-num">주문 번호</th>
                  <th class="order-time">주문 시간</th>
                  <th class="order-menu">메 뉴/ 수량</th>
                  <th class="order-addr">주 소</th>
                  <th class="order-price">가 격</th>
                  <th class="order-btn"></th>
                </tr>
                
                <!-- 반복문 요소 -->
                <c:forEach var="commit" items="${commitList}">
	                <tr>
	                  <td class="order-num">${commit.orderNum}</td>
	                  <td class="order-time">${commit.orderDate}</td>
	                  <td class="order-menu">
	                    <ul>
	                      <c:forEach var="om" items="${commit.orderMenu}">
	                     	 <li><span>${om.menu.menuName}</span> <span>/ ${om.amount}</span></li>
	                      </c:forEach>
	                    </ul>
	                  </td>
	                  <td class="order-addr">
	                    ${commit.odvo.userAddr1}
	                  </td>
	                  <td class="order-price">${commit.odvo.orderPrice}</td>
	                  <td class="order-btn">
	                    <button type="button" class="accetp-btn" onclick="location.href='<c:url value="/ceoMenu/orderUpdate?orderNum=${commit.orderNum}&state=cook"/>'">조리 시작</button>
	                    <button type="button" class="cancel-btn" onclick="location.href='<c:url value="/ceoMenu/orderUpdate?orderNum=${commit.orderNum}&state=calcel"/>'">취소</button>
	                  </td>
	                </tr>
                </c:forEach>
                
              </table>
            </div>

            <div class="order-wrap">
              <!-- 완료 주문 테이블 -->
              <table class="complete-order">
                <caption>
                  조리중
                </caption>
                <tr>
                  <th class="order-num">주문 번호</th>
                  <th class="order-time">주문 시간</th>
                  <th class="order-menu">메 뉴/ 수량</th>
                  <th class="order-addr">주 소</th>
                  <th class="order-price">가 격</th>
                  <th class="order-btn"></th>
                </tr>
                
                <c:forEach var="cook" items="${cookList}">
	                <tr>
	                  <td class="order-num">${cook.orderNum}</td>
	                  <td class="order-time">${cook.orderDate}</td>
	                  <td class="order-menu">
	                    <ul>
                			<c:forEach var="om" items="${cook.orderMenu}">
	                     		<li><span>${om.menu.menuName}</span> <span>/ ${om.amount}</span></li>
	                      	</c:forEach>
	                    </ul>
	                  </td>
	                  <td class="order-addr">
	                    ${cook.odvo.userAddr1}
	                  </td>
	                  <td class="order-price">${cook.odvo.orderPrice}</td>
	                  <td class="order-btn">
	                    <button type="button" class="accetp-btn" onclick="location.href='<c:url value="/ceoMenu/orderUpdate?orderNum=${cook.orderNum}&state=deliGo"/>'">배달 시작</button>
	                    <button type="button" class="cancel-btn" onclick="location.href='<c:url value="/ceoMenu/orderUpdate?orderNum=${cook.orderNum}&state=calcel"/>'">취소</button>
	                  </td>
	                </tr>
                </c:forEach>
                
              </table>
            </div>
          </div>
        </div>
      </div><!-- aside 포함 -->

<%@ include file="../include/footer.jsp" %>