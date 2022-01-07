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
<title>Notice</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/CSS/admin/admin.css" />
<script>
	function chkDelete(num) {
		var r = confirm("삭제하시겠습니까?");
		if (r) {
			location.href='deleteNotice?num=' + num;
		}
	}
</script>
</head>
<body>
	<nav>
		<ul class="nav-ul">
		<li class="nav-li"><a href="/main">사용자 메인</a>
		
			<li class="nav-li"><a href="main">메인으로</a></li>
			<li class="nav-li"><a href="managingProject">펀딩 프로젝트 관리</a></li>
			<li class="nav-li"><a href="managingUser">사용자 관리</a></li>
			<li class="nav-li"><a href="managingNotice">글 관리</a></li>
		</ul>
	</nav>
	<main>
		<div class="main-view">
			<p id="category">${list[0].category }</p><br>
			<h2 id="title">${list[0].title }</h2><br>
			<p id="regdate">${list[0].regDate }</p><br><br>
			<div class="main-content"><p id="content">${list[0].content }</p></div><br>
			<div class="btns right">
				<button class="main-btn" type="button" onclick="location.href='updateNotice?num=${list[0].num}'">글 수정</button>
				<button class="main-btn" type="button" onclick="chkDelete(${list[0].num})">글 삭제</button>
			</div>
		</div>
	</main>
</body>
		</html>
	</c:otherwise>
</c:choose>