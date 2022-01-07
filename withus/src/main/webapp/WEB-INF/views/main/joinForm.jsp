<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<link href="${pageContext.request.contextPath }CSS/joinForm.css"
	rel="stylesheet" type="text/css">
<title>회원가입</title>
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

  <script type="text/javascript">
    function pwValid() {
    	
    	  var text = document.getElementById('phone').value;

          var regPhone = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/;
          
          
      var p1 = document.getElementById('password').value;
      var p2 = document.getElementById('password1').value;
     
      if( p1 != p2 ){
        alert("비밀번호가 일치 하지 않습니다");
        return false;
      }else{
/*     	  if (regPhone.test(text) === true) {
          }else{
        	  alert("휴대폰 번호를 재대로 입력해주세요 !")
        	  return false;
          }
 */    	  
    	  return true;
      }
    }
  </script>

<body>
<div class="logo">
 <a href="/main" class="header-logo">
			<img src="${pageContext.request.contextPath }/images/withus-logo1.png" width="5%"></a>
</div>
<hr>
<br>
<h1>위드어스 회원가입</h1>
<div class="joinfrm">
<form action="/joinOk"  onsubmit="return pwValid()" method="POST">

	<div class="input-box">
	<input type="email" name="email" placeHolder="아이디(이메일) 입력" value="${w.email }"/>
		<label for="email">이메일</label>
		</div>
	<span>${ERROR1.EMAIL } ${ERROR1.DUPLEMAIL }</span><br>
	
	<div class="input-box">
	<input type="password" name="pw" id="password" placeHolder="패스워드 입력"/>
	<label for="pw">비밀번호 입력</label>
	</div>
	<span>${ERROR3.PW }</span><br>
	
	<div class="input-box">
	<input type="password" name="pw1" id="password1"  placeHolder="패스워드 확인"/>
	<label for="pw1">비밀번호 확인</label><br>
	<span>${ERROR3.PW }</span><br>
	</div>
	<div class="input-box">
	<input type="text" name="name" placeHolder="이름 입력" value="${w.name }"/><br>
	<label for="name">이름</label>
	<span>${ERROR4.NAME }</span><br>
	</div>
	<div class="input-box">
	<input type="text" name="phone" id="phone" placeHolder="핸드폰 번호 입력"/><br>
	<label for="phone">핸드폰번호</label>
	</div>
	
	</div><br>
	<input type="submit" value="회원가입">
	<hr>
	
</form></div>
</body>
</html>