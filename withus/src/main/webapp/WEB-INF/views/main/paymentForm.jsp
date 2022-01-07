<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="${pageContext.request.contextPath }CSS/payment.css"
	rel="stylesheet" type="text/css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script language="javascript">
	function goPopup() {
		var pop = window.open("/popup/jusoPopup", "pop",
				"width=570,height=420, scrollbars=yes, resizable=yes");
	}

	function jusoCallBack(roadFullAddr, roadAddrPart1, addrDetail, jibunAddr,
			zipNo) {
		document.form.roadFullAddr.value = roadFullAddr; // 전체 도로명 주소
		document.form.roadAddrPart1.value = roadAddrPart1; // 도로명주소 (참고항목 제외)
		document.form.addrDetail.value = addrDetail; // 고객 입력 상세 주소
		document.form.jibunAddr.value = jibunAddr; // 지번 정보
		document.form.zipNo.value = zipNo; // 우편번호
	}
</script>

<script type="text/javascript">
	function chkaddr() {
		frm = document.forms['form'];

		var roadAddrPart1 = frm['roadAddrPart1'].value.trim();
		var addrDetail = frm['addrDetail'].value.trim();
		var zipNo = frm['zipNo'].value.trim();

		console.log(roadAddrPart1);
		console.log(addrDetail);
		console.log(zipNo);

		if (roadAddrPart1 == "" || roadAddrPart1 == null) {
			alert("도로명 주소 입력해주세요");
			console.log("도로명 주소 입력해주세요")
			return false;
		}
		if (addrDetail == "" || addrDetail == null) {
			alert("상세주소 입력해주세요");
			console.log("상세주소 입력해주세요")
			return false;
		}
		if (zipNo == "" || zipNo == null) {
			alert("우편번호 입력해주세요");
			console.log("우편번호 입력해주세요")
			return false;
		}
		return true;
	};

	/* $(document).ready(function() {
		
	}); */
</script>
<title>결제하기</title>
</head>
<body>
	<header><%@include file="header.jsp"%></header>
	<main>
	<div class="payment-delivery">
		<h2 class="subject">배송지 입력</h2>
		<form name="form" id="form" method="post" action="paymentOk"
			onsubmit="return chkaddr();">
			<input type="button" onClick="goPopup();" value="우편번호 검색"
				class="searchBtn" />
			<div id="list"></div>
			<div id="callBackDiv">
				<!-- 도로명주소 전체(포맷) -->
				<input type="hidden" id="roadFullAddr" name="roadFullAddr" />
				<p class="sub-title">도로명주소</p>
				<p class="input">
					<input type="text" id="roadAddrPart1" name="roadAddrPart1" readonly/>
				</p>
				<p class="sub-title">상세주소</p>
				<p class="input">
					<input type="text" id="addrDetail" name="addrDetail" />
				</p>
				<!-- 지번 -->
				<input type="hidden" id="jibunAddr" name="jibunAddr" />
				<p class="sub-title">우편번호</p>
				<p class="input">
					<input type="text" id="zipNo" name="zipNo" readonly/>
				</p>
			</div>
			<button type="submit" id="submit" class="submitBtn">등록</button>
		</form>
	</div>
	</main>
	<footer><%@include file="footer.jsp"%></footer>
</body>
</html>