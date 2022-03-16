<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
  	<link rel="stylesheet" href="<c:url value='/css/style.css' />">
      <!-- favicon -->
    <link rel="shortcut icon" href="/img/favicon/favicon.ico" type="image/x-icon">
    <link rel="apple-touch-icon" sizes="180x180" href="<c:url value='/img/favicon/apple-touch-icon.png'/>">
    <link rel="icon" type="image/png" sizes="32x32" href="<c:url value='/img/favicon/favicon-32x32.png'/>">
    <link rel="icon" type="image/png" sizes="16x16" href="<c:url value='/img/favicon/favicon-16x16.png'/>">
    <link rel="manifest" href="/site.webmanifest">
</head>

<body>
<script src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>
<header>
    <div class="logo">
        <a href="<c:url value='/' />"><i class="logo-img" style="background-image: url(<c:url value='/img/logo.png'/>)"></i></a>
    </div>
    <div class="headSearch">
        <input class="btn-search" type="search" placeholder="메뉴을 검색해 보세요">
        <img src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/icon/search.png">
    </div>
    
    <div class="headLogin">
    	<c:choose>
    		<c:when test="${ceoLogin != null}">
        		<li><a href="<c:url value='/ceoInfo/ceoModify' />"><span class="btn-login">사업자 정보</span></a></li>
        	</c:when>
        	<c:when test="${userLogin != null}">
        		<li><a href="<c:url value='/userInfo/moodify' />"><span class="btn-login" >내 정보</span></a></li>
        	</c:when>
        	<c:otherwise>
        		<li><a href="<c:url value='/userInfo/login' />"><span class="btn-login">로그인</span></a></li>
        	</c:otherwise>
        </c:choose>
    </div>
</header>

<main class="main-wrap">
