<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/CSS/sellerHeader.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/CSS/tailwind/public/tailwind.css">

<div class="topnav" id="myTopnav">
  <a href="/seller/main" class="active">홈</a>
  <a href="/seller/myProject" class="myProject">내 프로젝트</a>
        <c:choose>
            <c:when test="${selid != null }">
               <sec:authorize access="isAuthenticated()">
               		<a class="logout " href="/logout">logout</a>
               </sec:authorize>
            </c:when>
            <c:otherwise>
            	<a class="logout " href="/loginForm">Sign in</a>
            </c:otherwise>
         </c:choose>
  
  <a href="javascript:void(0);" class="icon" onclick="myFunction()">
    <i class="fa fa-bars"></i>
  </a>
</div>
</body>
</html>