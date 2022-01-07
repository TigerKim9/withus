<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>나의 문의 목록</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/CSS/myinquiry.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
	<header>
		<%@include file="header.jsp"%>
	</header>
	<main>
	<h1 class="subject">나의 문의 목록</h1>
		<c:choose>
			<c:when test="${empty inList || fn:length(inList) == 0 }">
				<h2 class="warning">작성된 글이 없습니다.</h2>
			</c:when>
			<c:otherwise>
				<c:forEach var="inList" items="${inList }">
					<div class="main-myinList">
						<p class="sub-title">프로젝트 번호</p>
						<p class="list-p">${inList.prnum  }</p>
						<br>
						<p class="sub-title">제목</p>
						<p class="list-p">
							<a href="viewInquiry?innum=${inList.num }" id="title">${inList.title }</a>
						</p>
						<br>
						<p class="sub-title">작성일</p>
						<p class="list-p last">${inList.regdate }</p>
						<br>
					</div>
				</c:forEach>
			</c:otherwise>
		</c:choose>
		   <div style="display: inline-block; width: 30%; text-align: center; margin: 0 22%;">
      <c:if test="${paging.startPage != 1 }">
         <a
            href="myInquiryList?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>
      </c:if>
      <c:forEach begin="${paging.startPage }" end="${paging.endPage }"
         var="p">
         <c:choose>
            <c:when test="${p == paging.nowPage }">
               <b>${p }</b>
            </c:when>
            <c:when test="${p != paging.nowPage }">
               <a href="myInquiryList?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a>
            </c:when>
         </c:choose>
      </c:forEach>
      <c:if test="${paging.endPage != paging.lastPage}">
         <a
            href="myInquiryList?nowPage=${paging.endPage +1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
      </c:if>
   </div>
	</main>
	<footer>
		<%@include file="footer.jsp"%>
	</footer>
</body>
</html>