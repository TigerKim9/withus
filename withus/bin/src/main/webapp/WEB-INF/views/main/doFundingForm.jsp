<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>펀딩하기</title>
</head>
<body onload="">
	<header>
		<%@include file="header.jsp"%>
	</header>
	<div class="container">
		<div class="payment-circle-icons">
			<p>펀딩하기</p>
			<p>결제하기</p>
			<p>결제완료</p>
		</div>
		<hr>
		<div class="form">
		<form name="frm" action="doFundingOk" method="post">
		<input type="submit" value="다음 단계로"/>
		</form>
		<a href="payment">임시</a>
		</div>
		
	</div>
</body>
</html>