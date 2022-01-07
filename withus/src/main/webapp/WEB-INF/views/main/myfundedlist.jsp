<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>펀딩 목록</title>
<link href="CSS/myfundedlist.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<style>
table {
	width: 100%;
}

table, th, td {
	border-collapse: collapse;
	text-align: center;
}

.hide {
	display: none;
}

.table>thead {
	background-color: #77ACF1;
}
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
	crossorigin="anonymous">
	
</script>

<script>
	$(document)
			.ready(
					function() {
						var myKey = "hJrXoHejoIn4lim78kfSqQ"; // sweet tracker에서 발급받은 자신의 키 넣는다.

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


	<header>
		<%@include file="header.jsp"%>
	</header>

	<table class="table table-hover">
		<thead>
			<tr style="color: #FFFFFF">
				<th>신청한 프로젝트</th>
				<th>배송현황</th>
				<th>신청 날짜</th>
			</tr>
		</thead>

		<c:choose>
			<c:when test="${empty myflist || fn:length(myflist) == 0 }">
			</c:when>
			<c:otherwise>
				<c:forEach var="fl" items="${myflist }" varStatus="status">
					<tbody>
						<tr>
							<td><a href="http://localhost:8086/fund?prnum=${fl.prnum }">${gettitle[status.index].title }
							</a></td>
							<td>
								<form action="http://info.sweettracker.co.kr/tracking/5"
									method="post">
									<input type="hidden" id="t_key" name="t_key"
										value="hJrXoHejoIn4lim78kfSqQ"> <span class="hide"
										id="tekbeCompnayName">택배회사명: </span> <select class="hide"
										id="t_code" name="t_code"></select> <span id="invoiceNumber">
									</span> <input class="hide" type="text" id="t_invoice"
										name="t_invoice" value="1234567890"
										required> <input type="submit" class="myfdl-button"
										value="조회하기"></input>
								</form>
							</td>
							<td>${fl.fundingdate }</td>
						</tr>
					</tbody>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</table>
	
	<div style="display: inline-block; width: 30%; text-align: center; margin: 0 30%;">
      <c:if test="${paging.startPage != 1 }">
         <a
            href="myfundedlist?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>
      </c:if>
      <c:forEach begin="${paging.startPage }" end="${paging.endPage }"
         var="p">
         <c:choose>
            <c:when test="${p == paging.nowPage }">
               <b>${p }</b>
            </c:when>
            <c:when test="${p != paging.nowPage }">
               <a href="myfundedlist?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a>
            </c:when>
         </c:choose>
      </c:forEach>
      <c:if test="${paging.endPage != paging.lastPage}">
         <a
            href="myfundedlist?nowPage=${paging.endPage +1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
      </c:if>
   </div>



	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<script src="js/jquery-3.1.1.js"></script>
	<script src="js/bootstrap.js"></script>

</body>
</html>
