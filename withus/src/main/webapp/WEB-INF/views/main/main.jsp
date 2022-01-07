<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>메인페이지</title>
<link href="${pageContext.request.contextPath }CSS/main.css" rel="stylesheet" type="text/css">

</head>
<body>
	<header>
		<%@include file="header.jsp"%>
	</header>


	
    <div class="main_image">
    	<div class="main_background"> </div>
        <div class="main_title">
	        <span class="title">With US</span>
	        <span class="description">끊임없는 도전으로 더 나아진 내일을 향해 갑니다<br>
			With US는 창의력이 있다면 누구든 도전 할 수 있는 크라우드 펀딩 플랫폼입니다</span>
		</div>
    </div>
    
    <div class="contents_container">
    	<div class="service_introduce">
    		<p class="title">새로운 한발을 내딛기 위한<br>
도전과 지지의 장</p><br>
With US는 크라우드펀딩을 기반으로 한<br>
온라인 플랫폼을 통해 고민하고 도전하는<br>
삶의 방식을 지지합니다.<br>
더 나은 삶을 향한 가능성을 만들어가는<br>
With US와 함께 하세요.</p>
    		

		</div>
		<div class="ranking">
			<div class="title">조회수 많은 프로젝트</div>
    		<div class="category">
    			<div>
	    			<c:forEach var="list" items="${viewcnt}" varStatus="status">
	    			<div class = "element">
						<span class = "ranked">${status.count}</span>
						<span class = "title"><a href="/fund?prnum=${list.prnum}"><c:out value='${list.content.replaceAll("\\\<.*?\\\>","")}'></c:out></a></span>
					</div>
					</c:forEach>
    			</div>
    		</div>
    		
    		<div class="title">서포터 많은 프로젝트</div>
    		<div class="category">
    			<div>
	    			<c:forEach var="list" items="${support}" varStatus="status">
	    			<div class = "element">
						<span class = "ranked">${status.count}</span>
						<span class = "title"><a href="/fund?prnum=${list.prnum}"><c:out value='${list.content.replaceAll("\\\<.*?\\\>","")}'></c:out></a></span>
					</div>
					</c:forEach>
    			</div>
    		</div>
    		
    		<div class="title">인기 많은 프로젝트</div>
    		<div class="category">
    			<div>
	    			<c:forEach var="list" items="${popular}" varStatus="status">
	    			<div class = "element">
						<span class = "ranked">${status.count}</span>
						<span class = "title"><a href="/fund?prnum=${list.prnum}"><c:out value='${list.content.replaceAll("\\\<.*?\\\>","")}'></c:out></a></span>
					</div>
					</c:forEach>
    			</div>
    		</div>
		</div>
	</div>
	
	
	
	<footer>
		<%@include file="footer.jsp"%>
	</footer>
</body>
</html>