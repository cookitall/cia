<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@ include file="../include/header.jsp"%>


<title>매출 내역</title>

<%@ include file="../include/aside.jsp"%>

<% 
String dayHistorySta = (String) request.getAttribute("dayHistorySta");
String dayHistoryEnd = (String) request.getAttribute("dayHistoryEnd");
%>

<%=dayHistorySta %>
<%=dayHistoryEnd %>
<%@ include file="../include/footer.jsp"%>