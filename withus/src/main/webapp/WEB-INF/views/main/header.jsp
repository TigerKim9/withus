<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Header</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }CSS/header.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="${pageContext.request.contextPath }/JS/header.js"></script>
<script src="https://kit.fontawesome.com/81666d0663.js" crossorigin="anonymous"></script>
</head>
<body>
	<div class="header-bar">
		<div class="header-bar-small">
			<button type="button" class="header-btn">
				<span class="fa fa-bars" title="MENU"></span>
			</button>
			<a href="/main" class="header-logo"><img src="${pageContext.request.contextPath }/images/logo.png"></a>
		</div>
		<nav class="header-nav">
			<ul class="left">
				<li><a href="/comingsoon">펀딩예정</a></li>
				<li><a href="/fundpage">펀딩하기</a></li>
				<li class="more">더보기 <i class="fas fa-angle-down"></i>
					<ul class="more-ul">
						<li onclick="location.href='/notice'">공지사항</li>
						<li onclick="location.href='/event'">이벤트</li>
					</ul>
				</li>
			</ul>
		</nav>
		<div class="right signin-btn">
		         <c:choose>
            <c:when test="${prc != null }">
               <sec:authorize access="isAuthenticated()">
                  <a href="/profileForm" class="headA"><i class="fas fa-user"></i></a>
                  <button class="headBtn" type="button" onClick="location.href='/logout'">Logout</button>
               </sec:authorize>
            </c:when>
            <c:otherwise>
                  <button class="headBtn" type="button" onClick="location.href='/loginForm'">Sign in</button>
            </c:otherwise>
         </c:choose>
		</div>
	</div>
	<div class="clear"></div>
</body>
</html>