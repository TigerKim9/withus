<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>글 관리</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/CSS/admin/admin.css" />
</head>
<body>
	<nav>
		<ul class="nav-ul">
		<li class="nav-li"><a href="/main">사용자 메인</a>
		
			<li class="nav-li"><a href="main">메인으로</a></li>
			<li class="nav-li"><a href="managingProject">펀딩 프로젝트 관리</a></li>
			<li class="nav-li"><a href="managingUser">사용자 관리</a></li>
			<li class="nav-li now"><a href="#">글 관리</a></li>
			<li class="nav-end-li">${prc }</li>
			<li class="nav-end-li"><a
				href="${pageContext.request.contextPath }/logout">로그아웃</a></li>
		</ul>
	</nav>
	<main>
		<div class="main-form right">
			<button class="submitBtn" type="button"
				onclick="location.href='writeNotice'">글 작성</button>
		</div>
		<div class="clear"></div>
		<br>
		<div class="main-table">
			<h1>글 관리</h1>
			<hr>
			<br>

			<c:choose>
				<c:when test="${empty list || fn:length(list) == 0 }">
					<h3>작성된 글이 없습니다.</h3>
				</c:when>
				<c:otherwise>
					<table>
						<tr>
							<th style="width: 10%;">분류</th>
							<th style="width: 50%;">제목</th>
							<th style="width: 15%;">작성일자</th>
							<th style="width: 25%;">작성자</th>
						</tr>
						<c:forEach var="dto" items="${list }">
							<tr>
								<td>${dto.category }</td>
								<td><a href="viewNotice?num=${dto.num }" id="title">${dto.title }</a></td>
								<td>${dto.regDate }</td>
								<td>${dto.userEmail }</td>
							</tr>
						</c:forEach>
				</c:otherwise>
			</c:choose>
			</table>
		</div>
		<br>
		<div
			style="display: inline-block; width: 30%; text-align: center; margin: 0 22%;">
			<c:if test="${paging.startPage != 1 }">
				<a
					href="managingNotice?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>
			</c:if>
			<c:forEach begin="${paging.startPage }" end="${paging.endPage }"
				var="p">
				<c:choose>
					<c:when test="${p == paging.nowPage }">
						<b>${p }</b>
					</c:when>
					<c:when test="${p != paging.nowPage }">
						<a
							href="managingNotice?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a>
					</c:when>
				</c:choose>
			</c:forEach>
			<c:if test="${paging.endPage != paging.lastPage}">
				<a
					href="managingNotice?nowPage=${paging.endPage +1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
			</c:if>
		</div>


	</main>
</body>
</html>