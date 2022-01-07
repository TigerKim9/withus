<%@page import="com.fasterxml.jackson.annotation.JsonInclude.Include"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html >
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>내 프로젝트</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link href="${pageContext.request.contextPath }CSS/myProject.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script src="${pageContext.request.contextPath }/JS/shipping.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }CSS/header.css" />
<script src="https://kit.fontawesome.com/81666d0663.js" crossorigin="anonymous"></script>

<style>
table {
   width: 100%;
}

table, th, td {
   border: px solid black;
   border-collapse: collapse;
   text-align: center;
}

.table>thead {
   background-color: #77ACF1;
}

@font-face {
   font-family: 'Pretendard-Light';
   src:
      url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Light.woff')
      format('woff');
   font-weight: 300;
   font-style: normal;
}

table {
   font-family: 'Pretendard-Light';
}
</style>
</head>
<body>
<header>
		<%@include file="sellerHeader.jsp"%>
	</header>

   <table class="table table-hover">
      <thead>
         <tr>
            <th>프로젝트 번호</th>
            <th>제목</th>
            <th>아이템 금액</th>
            <th>가격</th>
            <th>카테고리</th>
            <th>만든 날짜</th>
            <th>시작일</th>
            <th>종료일</th>
            <th>조회수</th>
         </tr>
      </thead>
      <c:choose>
         <c:when test="${empty list || fn:length(list) == 0 }">
            <h3>작성된 글이 없습니다.</h3>
         </c:when>
         <c:otherwise>
            <c:forEach var="dto" items="${viewAll }">
               <tr>
                  <td>${dto.prnum }</td>
                  <td><a href="viewProject?prnum=${dto.prnum }">${dto.title }</a></td>
                  <td>${dto.itemprice }</td>
                  <td>${dto.price }</td>
                  <td>${dto.category }</td>
                  <td>${dto.regDate }</td>
                  <td>${dto.startDate }</td>
                  <td>${dto.endDate }</td>
                  <td>${dto.viewcnt }</td>
               </tr>
            </c:forEach>
         </c:otherwise>
      </c:choose>
   </table>

   <input type="button" class="btn btn-primary" style="position: relative; width: 123px; top: 0; left: 10px; font-family: 'Pretendard-Light';" onclick="location.href='write_project'" value="프로젝트 생성" />
   <div style="display: inline-block; width: 30%; text-align: center; margin: 0 22%;">
      <c:if test="${paging.startPage != 1 }">
         <a
            href="myProject?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>
      </c:if>
      <c:forEach begin="${paging.startPage }" end="${paging.endPage }"
         var="p">
         <c:choose>
            <c:when test="${p == paging.nowPage }">
               <b>${p }</b>
            </c:when>
            <c:when test="${p != paging.nowPage }">
               <a href="myProject?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a>
            </c:when>
         </c:choose>
      </c:forEach>
      <c:if test="${paging.endPage != paging.lastPage}">
         <a
            href="myProject?nowPage=${paging.endPage +1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
      </c:if>
   </div>
   


</body>
</html>