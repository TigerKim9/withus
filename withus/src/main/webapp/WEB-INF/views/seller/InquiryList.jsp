<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의글 목록</title>
</head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/CSS/inquiry.css">
<body>
<header>
		<%@include file="sellerHeader.jsp"%>
	</header>
	<main>
		<div class="inList">
			<h1 class="subject">문의글</h1>
			<br>
			<table>
				<c:choose>
					<c:when test="${empty quiry || fn:length(quiry) == 0 }">
						<h3>작성된 글이 없습니다.</h3>
					</c:when>
					<c:otherwise>
						<tr>
							<th class="number">번호</th>
							<th class="prnum">프로젝트</th>
							<th class="title">제목</th>
							<th class="email">이메일</th>
							<th class="regdate">작성일</th>
						</tr>
						<c:forEach var="list" items="${quiry}">
							<tr>
								<td class="number">${list.num }</td>
								<td class="prNum">${list.prnum }</td>
								<td class="title"><a href="inquiryBynum?num=${list.num }">${list.title }</a></td>
								<td class="email">${list.useremail }</td>
								<td class="regdate">${list.regdate }</td>
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</table>
			<br>
			<button class="inList-btn" type="button" onclick="history.back()">뒤로가기</button>
		</div>
	</main>
</body>
</html>