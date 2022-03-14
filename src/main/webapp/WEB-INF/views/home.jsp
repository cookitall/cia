<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<title>CIA</title>


<%@ include file="include/header.jsp"%>


	<main id="main">
		<div class="main-banner" style="background-image: url(<c:url value='/img/banner.jpg'/>)"></div>
		<div class="main-container">
			<ul class="category-list">
				<li style="background-image: url(<c:url value='/img/all.png'/>)" id="all">전체목록</li>
				<li style="background-image: url(<c:url value='/img/chicken.png'/>)" id="chicken">치킨</li>
				<li style="background-image: url(<c:url value='/img/pizza.png'/>)" id="pizza">피자</li>
				<li style="background-image: url(<c:url value='/img/ham.png'/>)" id="ham">햄버거</li>
				<li style="background-image: url(<c:url value='/img/korea.png'/>)" id="korea">한식</li>
				<li style="background-image: url(<c:url value='/img/china.png'/>)" id="china">중식</li>
				<li style="background-image: url(<c:url value='/img/west.png'/>)" id="west">양식</li>
				<li style="background-image: url(<c:url value='/img/jap.png'/>)" id="jap">일식</li>
			</ul>
		</div>
	</main>



	<%@ include file="include/footer.jsp"%>
  <!--  li 클릭시 해당 벨류에 맞는 링크로 이동 이벤트 -->
        <script>
           const $ul = document.querySelector('ul');

           $ul.addEventListener('click', function(e){
               if(!e.target.matches('ul > li')){
                   return;
               }
               console.log(e.target.id);
               const $id = e.target.id;
               location.href ="<c:url value='/shop/categoryList?category=' />" + $id;
           });
        </script>