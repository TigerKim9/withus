<%@page import="com.fasterxml.jackson.annotation.JsonInclude.Include"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
String title = "프로필 관리";
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<title><%=title%></title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="${pageContext.request.contextPath }/JS/header.js"></script>
<link href="${pageContext.request.contextPath }CSS/profileForm.css" rel="stylesheet" type="text/css">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath }/CSS/header.css">
<script src="${pageContext.request.contextPath }JS/header.js"></script>


<style>
@font-face {
	font-family: 'Pretendard-Light';
	src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Light.woff') format('woff');
	font-weight: 300;
	font-style: normal;
}

div,ul, li, a {
	font-family: 'Pretendard-Light';
}
body{
min-height: 600px;
}
</style>
</head>

<body>
<header>
		<%@include file="header.jsp"%>
	</header>

	<ul class="btn-menu">
		<li><a href="myfundedlist"><i class="fas fa-list fa-4x "></i><br>내
				펀딩 목록</a></li>

		<li><a href="regSeller"><i class="fas fa-briefcase fa-4x "></i>
				<br> 프로젝트관리(판매자)</a></li>

		<li><a href="profileMgt"><i class="fas fa-user-alt fa-4x"></i>
				<br> 프로필 관리</a></li>

		<li><a href="myInquiryList"><i
				class="fas fa-clipboard-list fa-4x"></i><br>문의 목록</a></li>
	</ul>
	
	<br><br>
	<footer>
	<%@include file="footer.jsp"%>
	</footer>	
</body>
</html>