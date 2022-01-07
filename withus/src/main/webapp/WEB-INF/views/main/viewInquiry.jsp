<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/CSS/myinquiry.css">
</head>
<body>
	<header>
		<%@include file="header.jsp"%>
	</header>
	<main>
		<div class="view-inquiry">
			<h1 class="subject">문의 내용</h1>
			<p class="sub-title">프로젝트</p>
			<p class="inList"><a href="/fund?prnum=${inList[0].prnum }">${inList[0].prnum }</a></p>
			<br>
			<p class="sub-title">제목</p>
			<p class="inList">${inList[0].title }</p>
			<br>
			<p class="sub-title">작성자</p>
			<p class="inList">${inList[0].useremail }</p>
			<br>
			<p class="sub-title">등록일</p>
			<p class="inList">${inList[0].regdate }</p>
			<br>
			<p class="inList content">${inList[0].content }</p>
		</div>
		<c:choose>
		<c:when test="${empty ansList || fn:length(ansList) == 0}">
			<h2 class="warning">작성된 답변이 없습니다.</h2>
		</c:when>
		<c:otherwise>
		<div class="view-inquiry-answer">
			<h1 class="subject">답변 내용</h1>
			<p class="sub-title">등록일</p>
			<p class="inList">${ansList[0].regdate }</p>
			<br>
			<p class="inList content">${ansList[0].content }</p>
		</div>
		</c:otherwise>
		</c:choose>
	</main>
	<footer>
		<%@include file="footer.jsp"%>
	</footer>
</body>
</html>