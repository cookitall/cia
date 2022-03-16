<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@ include file="../include/header.jsp"%>


<title>매출 내역</title>

<%@ include file="../include/aside.jsp"%>

<% 
String cName = (String) request.getAttribute("cName");
String cRDate = (String) request.getAttribute("cRDate");
String cEDate = (String) request.getAttribute("cEDate");
String cTPrice = (String) request.getAttribute("cTPrice");
String cDiscount = (String) request.getAttribute("cDiscount");
String cRemain = (String) request.getAttribute("cRemain");
%>

<%=cName %>
<%=cRDate %>
<%=cEDate %>
<%=cTPrice %>
<%=cDiscount %>
<%=cRemain %>
<%@ include file="../include/footer.jsp"%>