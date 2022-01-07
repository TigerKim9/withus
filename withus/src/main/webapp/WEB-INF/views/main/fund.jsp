<%@page import="java.sql.Statement"%>
<%@page import="org.hibernate.internal.build.AllowSysOut"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"
	type="text/javascript"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/CSS/fund.css">
<script src="${pageContext.request.contextPath }/JS/funding.js"></script>
<script src="${pageContext.request.contextPath }/JS/kakaopay.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/CSS/tailwind/public/tailwind.css">

<title>펀딩하기</title>
<style>
body {
	height: 100%;
}

@font-face {
	font-family: 'SBAggroB';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2108@1.1/SBAggroB.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

.btn-light {
	background: white;
}

.container_float {
	/* border: 1px solid black; */
	position: relative;
}

.container_float .on {
	position: absolute;
	bottom: 350px;
}

.container_left {
	/* border: 1px solid black; */
	margin-right: 50px;
	width: 800px;
}

.funding {
	color: white;
	margin-top: 40px;
	font-size: 20px;
	width: 250px;
	height: 50px;
	background-color: #8ab6d6;
	border: 0;
	outline: 0;
	border-radius: 6px;
}

.funding:hover {
	background-color: #218ede;
	font-style:;
	color: white;
	cursor: pointer;
}

.btn-danger {
	color:red;
}

#news {
	font-family: 'SBAggroB';
	font-size: 20px;
	text-align: center;
}

.right_like buttons btn-light {
	color: white;
}
</style>
</head>
<script src="https://kit.fontawesome.com/682166bb6e.js"
	crossorigin="anonymous"></script>
<style>
.bar-container {
	width: 80%;
	animation: progressbar 2s ease-out;
}

.inquiry-modal input[type="submit"] {
	padding: 2px 6px;
	border: 1px solid #8ab6d6;
	border-radius: 3px;
	width: 60px;
	height: 28px;
	font-size: 16px;
	background-color: #8ab6d6;
	cursor: pointer;
}

.inquiry-modal input[type="submit"]:hover {
	border-color: #FBE0C4;
	background-color: #FBE0C4;
}

//
animation
 @keyframes progressbar { 0% {
	width: 0%;
}
100





%
{
width
:
80




%;
}
}
</style>

<script src="https://kit.fontawesome.com/682166bb6e.js"
	crossorigin="anonymous"></script>
<body>
	<header>
		<%@include file="header.jsp"%>
	</header>
	<c:forEach var="list" items="${page }">

		<div class="fund_title">
			<p>${list.category }</p>
			<br> <span class="text-4xl"> ${list.title }</span>
		</div>
	</c:forEach>

	<br>
	<hr>
	<br>
	<c:forEach var="list" items="${page }">
		<div class="fund_container">

			<div class="container_left">

				<!-- 스토리를 만들면 파일로 만들어서 저장해서 올리기 ? -->
				${list.content }<br>
				<section class="inquiry">
					<div class="inquiryList">
						<h2>문의 목록</h2>
						<br>
						<table>
							<tr>
								<th class="in-title">제목</th>
								<th class="in-writer">작성자</th>
								<th class="in-regdate">작성일</th>
							</tr>
							<c:forEach var="qu" items="${quiry}">
								<tr>
									<td class="in-p-title"><a
										href="viewInquiry?innum=${qu.num }">${qu.title }</a></td>
									<td class="in-p-writer">${qu.useremail }</td>
									<td class="in-p-regdate">${qu.regdate }</td>
								</tr>
							</c:forEach>
						</table>
					</div>
				</section>
			</div>

			<div class="container_right">
				<div class="container_float">
					<!-- <span class="alerttt">움직이는 중</span> -->
					<fmt:parseDate value="${list.endDate }" var="endDate"
						pattern="yyyy-MM-dd" />
					<fmt:parseNumber value="${endDate.time / (1000*60*60*24)}"
						integerOnly="true" var="endDate" />
					<fmt:parseDate value="${list.startDate }" var="startDate"
						pattern="yyyy-MM-dd" />
					<fmt:parseNumber value="${startDate.time / (1000*60*60*24)}"
						integerOnly="true" var="startDate" />
					<fmt:parseDate value="${now }" var="now" pattern="yyyy-MM-dd" />
					<fmt:parseNumber value="${now.time / (1000*60*60*24)}"
						integerOnly="true" var="now" />
					<c:choose>
						<c:when test="${endDate < now}">
							<br>
							<strong style="color: red">이미 종료된 펀딩입니다.</strong>
						</c:when>
						<c:otherwise>
							<br>
							<strong>마감일</strong> ${endDate-now-1 }일 남음 <br>
						</c:otherwise>
					</c:choose>

					<hr>
					<p>
						<strong>펀딩개시일</strong>${list.startDate }<br> <strong>펀딩마감일</strong>${list.endDate }<br>
						<strong>목표금액</strong> ${list.price}원<br> <strong>펀딩금액</strong>
						${list.itemprice}원 <br> <strong>서포터</strong> ${support }명 <br>
						<strong>달성률</strong>
						<fmt:formatNumber value="${(fund[0].itemprice/list.price)*100 }"
							pattern="0" />
						%달성 <br>
					<div class="bar-container">
						<progress class="progressTag"
							value="${(fund[0].itemprice/list.price)*100 }" max="100" />
					</div>


					</p>

					<!-- 
            <form action="fundOk" method="post">
                <input type="hidden" id="f_useremail" name="f_useremail" value="${f_useremail }"><br>
                <input type="hidden" id="f_prnum" name="f_prnum" value="${f_prnum }"><br>
                가격 <input type="number" class ="fund_price" id="f_price" name="f_price" value="${f_price }"><br>
                <button class="fund_bnt">펀딩하기</button>
            </form>
             -->
					<input type="hidden" id="prnum" value="${dto.prnum }" /> <input
						type="hidden" id="userEmail" value="${dto.userEmail }" />
					<c:choose>
						<c:when test="${like ==  0}">
							<button class="right_like buttons btn-light" id="likebtn">
								<i class="fas fa-heart fa-2x"></i> <em class="fund_like">좋아요</em>
							</button>
							<input type="hidden" id="likecheck" value="${like }" />
						</c:when>
						<c:otherwise>
							<button class="right_like buttons btn-danger" id="likebtn">
								<i class="fas fa-heart fa-2x"></i> <em class="fund_like">좋아요</em>
							</button>
							<input type="hidden" id="likecheck" value="${like }" />
						</c:otherwise>
					</c:choose>

					<button class="right_inquiry">
						<i class="far fa-comments fa-2x"></i> <em class="fund_question">문의</em>

					</button>
					<c:choose>
						<c:when test="${startDate <= now && endDate >= now}">
							<br>
							<button id="apibtn" class="funding">펀딩하기</button>
						</c:when>
						<c:when test="${endDate < now}">
							<br>
							<button id="apibtn" class="funding" disabled="disabled">펀딩종료</button>
						</c:when>
						<c:otherwise>
							<br>
							<button id="apibtn" class="funding" disabled="disabled">펀딩예정</button>
						</c:otherwise>
					</c:choose>
					<input type="hidden" id="useremail" value=${prc }> <input
						type="hidden" id="uid" value=${list.prnum }> <input
						type="hidden" id="name" value="${list.title }"> <input
						type="hidden" id="amount" value=${list.itemprice }> <input
						type="hidden" id="tel" value="010-0000-0000"> <input
						type="hidden" id="addr" value="${check[0].addr }">



				</div>
			</div>

		</div>
	</c:forEach>
	<div id="dlg_write" class="modal">
		<form action="InquiryOk" class="modal-content animate" id="frmWrite"
			name="frmWrite" method="post">
			<div class="container">
				<h2 class="title">문의하기</h2>

				<span class="close" title="Close Modal">&times;</span>
				<%-- 닫기버튼 --%>


				<div class="d01 btn_group_header">
					<div class="left">
						<p id="viewcnt"></p>
					</div>
					<div class="right">
						<p id="regdate"></p>
					</div>
					<div class="clear"></div>
				</div>
				<c:forEach var="list" items="${page }">
					<div class="inquiry-modal">
						<input type="hidden" id="prnum" name="prnum"
							value="${list.prnum }"> <input type="hidden" id="email"
							name="useremail" value="${prc }"> <input type="text"
							placeholder="제목 (필수)" id="title" name="title" required> <input
							type="text" placeholder="내용 (필수)" id="content" name="content"
							required>
						<div class="d01 btn_group_write">
							<input type="submit">
						</div>
					</div>
				</c:forEach>




			</div>
		</form>
	</div>

	<footer>
		<%@include file="footer.jsp"%>
	</footer>

	<script>
		$('#likebtn').click(function() {
			updateLike();
		});

		function updateLike() {
			var root = getContextPath(), likeurl = "/updateLike", prnum = $(
					'#prnum').val(), userEmail = $('#userEmail').val(), count = $(
					'#likecheck').val(), data = {
				"prnum" : prnum,
				"userEmail" : userEmail,
				"count" : count
			};

			$.ajax({
				url : likeurl,
				type : 'POST',
				contentType : 'application/json',
				data : JSON.stringify(data),
				success : function(result) {
					if (count == 1) {
						console.log("좋아요 취소");
						$('#likecheck').val(0);
						$('#likebtn').attr('class', 'btn btn-light');
					} else if (count == 0) {
						console.log("좋아요");
						$('#likecheck').val(1);
						$('#likebtn').attr('class', 'btn btn-danger');
					}
				},
				error : function(result) {
					console.log("에러" + result.result)
				}

			});
		};

		function getContextPath() {
			var hostIndex = location.href.indexOf(location.host)
					+ location.host.length;
			return location.href.substring(hostIndex, location.href.indexOf(
					'/', hostIndex + 1));
		};

		$(document).ready(
				function() {

					$(window).scroll(
							function() {
								var currentPosition = parseInt($(
										".container_float").css("top"));
								var scrollTop = $(window).scrollTop();

								var val = $(document).height()
										- $(".container_float").outerHeight()
										- $('footer').outerHeight();

								$(".alerttt").html(
										'documentHeight : '
												+ $(document).height()
												+ '<br>'
												+ 'containerfloatHeight : '
												+ $(".container_float")
														.outerHeight() + '<br>'
												+ 'footerHeight : '
												+ $('footer').outerHeight()
												+ '<br>' + 'scrollTop :'
												+ scrollTop + "<br>"
												+ 'currentPosition : '
												+ currentPosition + "<br>"
												+ 'val : ' + val);
								if (scrollTop < val) {

									$(".container_float").stop().animate({
										"top" : scrollTop + "px"
									//"top" : (val - 200) + "px"
									}, 700);
								} else {
									$(".container_float").stop().animate({
										"top" : (val - 400) + "px"
									});
								}
							});
				});
		//$('.container_right').removeClass('on')
		/*
		// 기본 위치(top)값
		var floatPosition = parseInt($(".container_float").css('top'))

		// scroll 인식
		$(window).scroll(function() {

		// 현재 스크롤 위치
		var currentTop = $(window).scrollTop();
		var bannerTop = currentTop + floatPosition + "px";
		//이동 애니메이션
		$(".container_float").stop().animate({
			"top" : bannerTop
		}, 500);

		}).scroll();
		 */
		/*
		$(function() {

			  var $w = $(window),
			    footerHei = $('footer').outerHeight(),
			    $banner = $('.container_float');
				console.log("랄")
			  $w.on('scroll', function() {

			    var sT = $w.scrollTop();
			    var val = $(document).height() - $w.height() - footerHei;

			    if (sT >= val)
			        $banner.addClass('on')
			    else
			    	$banner.removeClass('on')

			  });
		 */
	</script>
</body>
</html>