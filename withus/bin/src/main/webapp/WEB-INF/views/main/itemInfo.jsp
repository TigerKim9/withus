<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<header>
		<%@include file="header.jsp"%>
	</header>

	<div class="container">
		<div class="section-1">
			<div class="title">
				<p>카테고리</p>
				<h3>프로젝트 제목 | 펀딩 아이템 이름</h3>
			</div>
			<div class="item-info">
				<h3>남은 기간</h3>
				<h4>달성률</h4>
				<h5>펀딩액</h5>
				<h5>서포터 수</h5>
				<a href="doFundingForm">펀딩하기</a>
			</div>
		</div>
		<div class="section-2">
			<div class="item-story"></div>
			<div class="maker-info">
				<h3>메이커 정보</h3>
				<div class="maker-profile">
					<a href="makerInfo"> <img src="#" /> 메이커 닉네임
					</a>
				</div>
			</div>
		</div>
	</div>

	<footer>
		<%@include file="footer.jsp"%>
	</footer>
</body>
</html>