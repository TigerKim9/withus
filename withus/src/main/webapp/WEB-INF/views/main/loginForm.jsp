<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<link href="${pageContext.request.contextPath }CSS/loginForm.css"
	rel="stylesheet" type="text/css">
<meta charset="UTF-8">
<title>로그인 페이지</title>
</head>

<body>
	<h1 id="logo">
		<a href="/main"> <img
			src="${pageContext.request.contextPath }images/withus-logo1.png"
			width="300px">
		</a>
	</h1>
	<div class="idfrm">

		<form action="/loginOk" method="POST">
			<div class="input-box">
				<input id="userid" type="email" name="userid" placeholder="아이디">
				<label for="userid">아이디</label>
			</div>
			<div class="input-box">
				<input id="password" type="password" name="password"
					placeholder="비밀번호"> <label for="password">비밀번호</label>
			</div>
			<button>로그인</button>

		</form>
	</div>
	<div class="login-api">
		<div class="google">
			<a id="google" href="/oauth2/authorization/google"> <img
				src="${pageContext.request.contextPath }images/btn_google_dark_normal_ios@2x.png"
				width="50px"> <!-- 구글 아이디로 로그인 --> <img
				src="${pageContext.request.contextPath }images/btn_google_dark_focus_ios@2x.png"
				width="50px"> <!-- 구글 아이디로 로그인 --> <img
				src="${pageContext.request.contextPath }images/btn_google_dark_pressed_ios@2x.png"
				width="50px"> <!-- 구글 아이디로 로그인 -->
			</a>
		</div>

		<div class="naver">
			<a id="naver" href="/oauth2/authorization/naver"> 
			<img src="${pageContext.request.contextPath }images/btnG_아이콘원형.png" width="50px">
			<img src="${pageContext.request.contextPath }images/btnG_아이콘원형hover.png" width="50px">
				 <!-- 네이버 아이디로 로그인 -->
			</a>
		</div>

		<div class="kakao">
			<a id="kakao" href="/oauth2/authorization/kakao"> 
			<img src="${pageContext.request.contextPath }images/kakao_login_medium_button.png" width="50px"> <!-- 카카오 아이디로 로그인 -->
			<img src="${pageContext.request.contextPath }images/kakao_login_medium_button_hover.png" width="50px"> <!-- 카카오 아이디로 로그인 -->
			</a>
		</div>
	</div>
	<hr>
	<div class="registJoin">
		<a href="/join">회원가입</a>
	</div>
</body>
</html>
