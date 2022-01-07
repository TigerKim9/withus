<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/CSS/notice.css" />
</head>
<body>
	<header>
		<%@include file="../header.jsp"%>
	</header>

	<main>
		<h1 class="subject">공지사항</h1>
		<br>
		<br>
		<div class="main-notice-list">
			<c:choose>
				<c:when test="${empty list || fn:length(list) == 0 }">
					<h3 style="text-align: center;">작성된 글이 없습니다.</h3>
				</c:when>
				<c:otherwise>
					<c:forEach var="dto" items="${list }">
						<p class="title"><a href="viewNotice?num=${dto.num}" id="title">${dto.title }</a></p>
						<p class="regdate">${dto.regDate }</p>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</div>
		
		<div style="display: inline-block; width: 30%; text-align: center; margin: 0 30%;">
		<c:if test="${paging.startPage != 1 }">
			<a
				href="notice?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>
		</c:if>
		<c:forEach begin="${paging.startPage }" end="${paging.endPage }"
			var="p">
			<c:choose>
				<c:when test="${p == paging.nowPage }">
					<b>${p }</b>
				</c:when>
				<c:when test="${p != paging.nowPage }">
					<a href="notice?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a>
				</c:when>
			</c:choose>
		</c:forEach>
		<c:if test="${paging.endPage != paging.lastPage}">
			<a
				href="notice?nowPage=${paging.endPage +1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
		</c:if>
	</div>
		
		
		
	</main>
	<footer>
		<%@include file="../footer.jsp"%>
	</footer>
</body>
</html>