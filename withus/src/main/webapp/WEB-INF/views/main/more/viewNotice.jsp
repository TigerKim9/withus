<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:choose>
	<c:when test="${empty list || fn:length(list) == 0 }">
		<script>
			alert("해당 정보가 삭제되거나 없습니다");
			history.back();
		</script>
	</c:when>
	<c:otherwise>

		<!DOCTYPE html>
		<html lang="ko">
<head>
<meta charset="UTF-8">
<title>${list[0].title }</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/CSS/notice.css" />
</head>
<body>
	<header>
		<%@include file="../header.jsp"%>
	</header>
	<main>
		<div class="main-notice-view">
			<h2 id="title">${list[0].title }</h2>
			<p id="regdate">${list[0].regDate }</p>
			<br> <br>
			<div class="main-content"><p id="content">${list[0].content }</p></div>
		</div>
	</main>
	<footer>
		<%@include file="../footer.jsp"%>
	</footer>
</body>
		</html>
	</c:otherwise>
</c:choose>