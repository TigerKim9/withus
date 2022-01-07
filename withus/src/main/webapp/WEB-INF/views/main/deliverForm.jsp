<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>배송 목록</title>
<style>
table {
	width: 100%;
}

table, th, td {
	border: 1px solid black;
	border-collapse: collapse;
	text-align: center;
}
.hide { display:none; }

</style>
<script type="text/javascript">
	function showPopup() {
		var _width = '650';
		var _height = '380';
		// 팝업을 가운데 위치시키기 위해 아래와 같이 값 구하기
		var _left = Math.ceil((window.screen.width - _width) / 2);
		var _top = Math.ceil((window.screen.height - _height) / 2);

		window.open("shippingForm", 'width=' + _width + ', height=' + _height
				+ ', left=' + _left + ', top=' + _top);
	}
</script>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"
	integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
	crossorigin="anonymous"></script>

<script>
	$(document)
			.ready(
					function() {
						var myKey = "HbFCR6ON7a0wj7fE3ekJHA"; // sweet tracker에서 발급받은 자신의 키 넣는다.

						// 택배사 목록 조회 company-api
						$
								.ajax({
									type : "GET",
									dataType : "json",
									url : "http://info.sweettracker.co.kr/api/v1/companylist?t_key="
											+ myKey,
									success : function(data) {

										// 방법 1. JSON.parse 이용하기
										var parseData = JSON.parse(JSON
												.stringify(data));
										console.log(parseData.Company); // 그중 Json Array에 접근하기 위해 Array명 Company 입력

										// 방법 2. Json으로 가져온 데이터에 Array로 바로 접근하기
										var CompanyArray = data.Company; // Json Array에 접근하기 위해 Array명 Company 입력
										console.log(CompanyArray);

										var myData = "";
										$
												.each(
														CompanyArray,
														function(key, value) {
															myData += ('<option value='+value.Code+'>'
																	+ value.Name + '</option>');
														});
										$("#t_code").html(myData);
									}
								});

					});
</script>


</head>

<body>

	<table>
		<tr>
			<th>프로젝트번호</th>
			<th>구매자</th>
			<th>배송현황</th>
		</tr>


		<c:choose>
			<c:when test="${empty list || fn:length(list) == 0 }">
			</c:when>
			<c:otherwise>
				<c:forEach var="pagelist" items="${list }">
					<tr>
						<td>${pagelist.dv_prnum }</td>
						<td>${pagelist.dv_useremail }</td>
						<td>
							<form action="http://info.sweettracker.co.kr/tracking/5"
								method="post">
								<input type="hidden" id="t_key" name="t_key" value="hJrXoHejoIn4lim78kfSqQ"> 
									<span class="hide" id="tekbeCompnayName">택배회사명: </span> 
									<select class="hide" id="t_code" name="t_code"></select>
								 <span id="invoiceNumber">운송장번호: </span> 
								<input type="text" id="t_invoice" name="t_invoice" value="${pagelist.dv_num }" required>
								 <input type="submit" class="btn btn-default" value="조회하기"></input>
							</form>
						</td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</table>

	<br>

	<br>
	<br>
	<br>
	<br>
	<br>
	<br>

</body>
</html>
