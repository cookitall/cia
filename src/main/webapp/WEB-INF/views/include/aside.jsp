<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>

<aside id="aside">
	<div class="aside-title">판매자 메뉴</div>
	<ul>
		<li><a href="<c:url value='/ceoMenu/orderList'/>">주문현황</a></li>
		<li><a href="<c:url value='/ceoMenu/saleHistory'/>">매출내역</a></li>
		<li><a href="<c:url value='/ceoMenu/menuList'/>">메뉴관리</a></li>
		<li><a href="<c:url value='/ceoMenu/shopReviewList'/>">리뷰관리</a></li>
		<li><a href="<c:url value='/ceoMenu/couponList'/>">쿠폰관리</a></li>
		<li><a href="<c:url value='/ceoInfo/ceoModify'/>">정보관리</a></li>
	</ul>
</aside>
