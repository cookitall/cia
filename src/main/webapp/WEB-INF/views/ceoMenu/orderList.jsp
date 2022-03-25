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
                  <th class="order-menu">메 뉴</th>
                  <th class="order-addr">주 소</th>
                  <th class="order-price">가 격</th>
                  <th class="order-btn"></th>
                </tr>
                
                <!-- 반복문 요소 -->
                <c:forEach var="newo" items="${newList}">
	                <tr>
	                  <td class="order-num">${newo.orderNum}</td>
	                  <td class="order-time">${newo.orderDate}</td>
	                  <td class="order-menu">
	                    <ul>
	                      <li><span>${newo.orderMenu.mVo.menuName}</span> <span>${newo.orderMenu.amount}</span></li>
	                    </ul>
	                  </td>
	                  <td class="order-addr">
	                    ${newo.odvo.userAddr1}
	                  </td>
	                  <td class="order-price">${newo.odvo.orderPrice}</td>
	                  <td class="order-btn">
	                    <button class="accetp-btn">수락</button>
	                    <button class="cancel-btn">취소</button>
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
                  <th class="order-menu">메 뉴</th>
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
	                      <li><span>${commit.orderMenu.mVo.menuName}</span> <span>${commit.orderMenu.amount}</span></li>
	                    </ul>
	                  </td>
	                  <td class="order-addr">
	                    ${commit.odvo.userAddr1}
	                  </td>
	                  <td class="order-price">${commit.odvo.orderPrice}</td>
	                  <td class="order-btn">
	                    <button class="accetp-btn">수락</button>
	                    <button class="cancel-btn">취소</button>
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
                  <th class="order-menu">메 뉴</th>
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
	                      <li><span>${cook.orderMenu.mVo.menuName}</span> <span>${cook.orderMenu.amount}</span></li>
	                    </ul>
	                  </td>
	                  <td class="order-addr">
	                    ${cook.odvo.userAddr1}
	                  </td>
	                  <td class="order-price">${cook.odvo.orderPrice}</td>
	                  <td class="order-btn">
	                    <button class="accetp-btn">수락</button>
	                    <button class="cancel-btn">취소</button>
	                  </td>
	                </tr>
                </c:forEach>
                
              </table>
            </div>
          </div>
        </div>
      </div><!-- aside 포함 -->

<%@ include file="../include/footer.jsp" %>