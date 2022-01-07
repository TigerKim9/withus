<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<link href="${pageContext.request.contextPath }CSS/regSeller.css"
	rel="stylesheet" type="text/css">
<meta charset="UTF-8">
<title>판매자 등록</title>
</head>
<body>
	<h1 id="title">판매자 등록</h1>
	<hr>
	
	<div class="idfrm">
	<form name="frm" action="/regSellerOk" onsubmit="return makeSelid()" method="POST">
		<input type="hidden" name="useremail" value="${prc }" /><h1>${prc }</h1><br><p class="introduce">판매자로 등록하셔서 나만의 아이템을 보여주세요!<br>판매자등록을 하시면 나의 획기적인 아이디어를 프로젝트로 탄생시킬 수 있습니다!<p><br>
		<input type="hidden" name="selid" />
		<div class="input-box">
		<input type="text" name="name" placeHolder="대표자명 입력" value="${s.name }"/>
		<label for="userid">대표자명</label>
		</div>
		<span>${ERROR1.NAME }</span><br>
		<div class="input-box">
		<input type="text" name="business" placeHolder="사업자번호 입력" value="${s.business }"/>
		<label for="userid">사업자번호</label></div>
		<span>${ERROR2.BUSINESS }</span><br>
		<div class="input-box">
		<input type="text" name="jumin" id="business" placeHolder="주민번호 입력" value="${s.jumin }"/>
		<label for="userid">주민등록번호</label></div>
		<span>${ERROR3.JUMIN }</span><br>
		<input type="submit" value="판매자등록">

	</form>
</div>
	<script>
		function makeSelid() {
			var frm = document.frm;
			var userEmail = frm.useremail.value;
			/* var business=document.getElementById('business').value; */
			
			/* var businessCode=^(\d{3,3})+[-]+(\d{2,2})+[-]+(\d{5,5}); */

			userEmail = userEmail.split("@");
			var rand = Math.floor(Math.random() * (10000 - 1)) + 1;

			frm.selid.value = userEmail[0] + rand; // input name="selid" 의 value 값 지정
			
			/* if(businessCode.text(business))===true){
				return true;	
			}else{
				alert("사업자번호를 다시 입력해주세요!")
				return false;
			} */
		}
	</script>

</body>
</html>