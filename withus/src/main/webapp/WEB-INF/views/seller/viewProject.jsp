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
		<html>
<head>
<meta charset="UTF-8">
<title>프로젝트 읽기</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/CSS/viewProject.css" />
<script>
function chkDelete(prnum){
	// 삭제여부, 다시 확인한뒤 진행
	var r = confirm("삭제하시겠습니까?");
	if(r){
		location.href = 'deleteProject?prnum=' + ${list[0].prnum };
	}
}
</script>
</head>
<body>
<header>
		<%@include file="sellerHeader.jsp"%>
	</header>
	<main>
		<div class="main-view">
			<div class="pic">
				<c:choose>
						<c:when test="${list[0].filePath == null}">
						</c:when>
						<c:otherwise>
			<img src="${pageContext.request.contextPath}/images/${list[0].filePath}">
						</c:otherwise>
					</c:choose>
			</div>
			<br>
			<h1>${list[0].title }</h1>
			<br>
			<p class="sub-title">프로젝트 번호</p>
			<p>${list[0].prnum }</p>
			<br>
			<p class="sub-title">판매자</p>
			<p>${list[0].selid }</p>
			<br>
			<p class="sub-title">카테고리</p>
			<p>${list[0].category }</p>
			<br>
			<p class="sub-title">좋아요</p>
			<p>${likes}</p>
			<br>
			<p class="sub-title">조회수</p>
			<p>${list[0].viewcnt }</p>
			<br>
			<p class="sub-title">아이템 가격</p>
			<p>${list[0].itemprice }</p>
			<br>
			<p class="sub-title">목표 가격</p>
			<p>${list[0].price }</p>
			<br>
			<p class="sub-title">등록일</p>
			<p>${list[0].regDate }</p>
			<br>
			<p class="sub-title">시작일</p>
			<p>${list[0].startDate }</p>
			<br>
			<p class="sub-title">종료일</p>
			<p>${list[0].endDate }</p>
			<br> <br>
			<p class="sub-title">내용</p>
			<br>
			<div class="div-content">
				<p class="content">${list[0].content }
			</div>
			<br> <br>
			<p class="sub-title">새소식</p>
			<br>
			<div class="div-newctn">
				<p class="newctn">${list[0].newctn }</p>
			</div>
			<br> <br>
			<hr>
			<div class="btns right">
				<button class="main-btn"
					onclick="location.href='updateProject?prnum=${list[0].prnum }'">수정하기</button>
				<button class="main-btn" onclick="location.href='myProject'">목록보기</button>
				<button class="main-btn" onclick="chkDelete(${list[0].prnum })">삭제하기</button>
			</div>
		</div>
	</main>
</body>
		</html>
	</c:otherwise>
</c:choose>