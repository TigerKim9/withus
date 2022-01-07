<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- <%@ taglib prefix="c"  uri="http://java.sun.com/jstl/core_rt" %> --%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>펀딩하기</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/CSS/fundpage.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/CSS/header.css">
<script src="${pageContext.request.contextPath }JS/header.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/CSS/tailwind/public/tailwind.css">
<script
	src="${pageContext.request.contextPath }/CSS/tailwind/public/tailwind.config.js"></script>
	
<style>
* {
	box-sizing: border-box;
}

.mySlides {
	display: none;
}

img {
	vertical-align: middle;
}

/* Slideshow container */
#slideshow-container {
	max-width: 100% position: relative;
	margin: auto;
}

/* Caption text */
.text {
	color: #f2f2f2;
	font-size: 15px;
	padding: 8px 12px;
	position: absolute;
	bottom: 8px;
	width: 100%;
	text-align: center;
}

/* Number text (1/3 etc) */
.numbertext {
	/* color: #f2f2f2; */
	color: black;
	font-size: 12px;
	padding: 8px 12px;
	position: absolute;
	top: 0;
}

/* The dots/bullets/indicators */
.dot {
	height: 15px;
	width: 15px;
	margin: 0 2px;
	background-color: #bbb;
	border-radius: 50%;
	display: inline-block;
	transition: background-color 0.6s ease;
}

.active {
	background-color: #717171;
}

/* Fading animation */
.fade {
	-webkit-animation-name: fade;
	-webkit-animation-duration: 1.5s;
	animation-name: fade;
	animation-duration: 1.5s;
}

@
-webkit-keyframes fade {
	from {opacity: .4
}

to {
	opacity: 1
}

}
@
keyframes fade {
	from {opacity: .4
}

to {
	opacity: 1
}

}

/* On smaller screens, decrease text size */
@media only screen and (max-width: 300px) {
	.text {
		font-size: 11px
	}
}

img {
	height: 500px;
}
</style>
</head>

<body>
	<header>
		<%@include file="header.jsp"%>
	</header>



	<div class="fund_display"></div>
	<div id="slideshow-container">

		<div class="mySlides fade">
			<!-- <div class="numbertext">1 / 3</div> -->
			<img src="${pageContext.request.contextPath}/images/banner1.png"
				style="width: 100%">
			<!-- <div class="text">Caption Text</div> -->
		</div>

		<div class="mySlides fade">
			<!-- <div class="numbertext">2 / 3</div> -->
			<img src="${pageContext.request.contextPath}/images/banner2.png"
				style="width: 100%">
			<!-- <div class="text">Caption Two</div> -->
		</div>

		<div class="mySlides fade">
			<!-- <div class="numbertext">3 / 3</div> -->
			<img src="${pageContext.request.contextPath}/images/banner3.png"
				style="width: 100%">
			<!-- <div class="text">Caption Three</div> -->
		</div>

	</div>
	<br>

	<div style="text-align: center">
		<span class="dot"></span> <span class="dot"></span> <span class="dot"></span>
	</div>

	<script>
        var slideIndex = 0;
        showSlides();
        
        function showSlides() {
          var i;
          var slides = document.getElementsByClassName("mySlides");
          var dots = document.getElementsByClassName("dot");
          for (i = 0; i < slides.length; i++) {
            slides[i].style.display = "none";  
          }
          slideIndex++;
          if (slideIndex > slides.length) {slideIndex = 1}    
          for (i = 0; i < dots.length; i++) {
            dots[i].className = dots[i].className.replace(" active", "");
          }
          slides[slideIndex-1].style.display = "block";  
          dots[slideIndex-1].className += " active";
          setTimeout(showSlides, 2000); // Change image every 2 seconds
        }
        </script>
	<div id="fund_home">
		<a href="/fundpage">펀딩홈</a>
	</div>
	<div id="fund_category " class="h-28 block flex justify-center">
		<!-- <a href="http://localhost:8086/fundpage/푸드">푸드</a> -->
		<div id="height90" class="h-5/6">
			<a href="/fundpage/푸드"><img
				class="category-circleImg float-left mx-4" alt="이미지 없음"
				src="${pageContext.request.contextPath}/images/food.jpg"></a>
			<a href="/fundpage/뷰티"><img
				class="category-circleImg float-left mx-4" alt="이미지 없음"
				src="${pageContext.request.contextPath}/images/beauty.jpg"></a>
			<a href=/fundpage/가전"><img
				class="category-circleImg float-left mx-4" alt="이미지 없음"
				src="${pageContext.request.contextPath}/images/tech.jpg"></a><br>
			<span class="float-left mx-9 pt-1">푸드</span><span
				class="float-left mx-9 pt-1">뷰티</span><span
				class="float-left mx-10 pt-1">가전</span>
		</div>
		<div id="height10" class=h-1/6></div>
	</div>

	<hr>
	<div id="projectGrid" class="grid grid-cols-3 gap-16 px-32">
		<c:forEach var="list" items="${projectList }">
		<c:set var="length" value="${fn:length(projectList) }"></c:set>
		<c:choose>
		<c:when test="${length>0 }">
			<c:set var="now" value="<%=new java.util.Date()%>" />
			<fmt:parseDate value="${list.endDate }" var="endDate"
				pattern="yyyy-MM-dd" />
			<fmt:parseNumber value="${endDate.time / (1000*60*60*24)}"
				integerOnly="true" var="endDate" />
			<fmt:parseDate value="${list.startDate }" var="startDate"
				pattern="yyyy-MM-dd" />
			<fmt:formatDate value="${now}" var="nowDate1" pattern="yyyy-MM-dd" />
			<fmt:parseNumber value="${startDate.time / (1000*60*60*24)}"
				integerOnly="true" var="startDate" />
			<fmt:parseNumber value="${now.time / (1000*60*60*24)}"
				integerOnly="true" var="nowDate" />
				<c:if test="${list.endDate > nowDate1 }">
				
				<div id="projectlist_container" class="bg-white shadow-2xl ">
					<div id="projectlist" class="flex px-8">
						<a class="text-2xl w-max overflow-hidden"
							href="fund?prnum=${list.prnum}">
							<div class="pic">
							<img src="${pageContext.request.contextPath}/images/${list.filePath}">
							</div><br>${list.title }</a>
					</div>
					
					<div class="py-2">
						<span id="projectCategory" class="text-base px-8">${list.category }</span>
					</div>
					<div>
						<!-- 목표 금액 -->
						<%-- <span class="text-base float-left">목표 금액:${list.price}원</span> --%>
						<span class="text-base float-left px-8">${list.price}원</span>


						<!-- 펀딩액 -->
						<%-- <span class="text-base float-left">&nbsp;물품 금액:${list.itemprice}원</span> --%>
						<span class="text-base float-left">&nbsp;${list.itemprice}원</span>


						<!-- 남은날짜 -->
						<span class="text-base float-right">&nbsp;${endDate - nowDate}일</span>

					</div>
				
			
	</div>
	</c:if>
	</c:when>
	<c:otherwise>
		<h1>프로젝트가 없습니다.</h1>
	</c:otherwise>
	</c:choose>
	</c:forEach>
	<br>

	</div>
	<footer>
		<%@include file="footer.jsp"%>
	</footer>
</body>
</html>