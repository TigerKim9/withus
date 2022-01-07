<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>관리자 메인페이지</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/CSS/admin/admin.css" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
	<link rel="stylesheet"
	href="${pageContext.request.contextPath }/CSS/tailwind/public/tailwind.css">
</head>
<body>
	<nav>
		<ul class="nav-ul">
			<li class="nav-li"><a href="/main">사용자 메인</a>
			<li class="nav-li now"><a href="/admin/main">메인</a>
			<li class="nav-li"><a href="managingProject">펀딩 프로젝트 관리</a></li>
			<li class="nav-li"><a href="managingUser">사용자 관리</a></li>
			<li class="nav-li"><a href="managingNotice">글 관리</a></li>
			<li class="nav-end-li">${prc }</li>
			<li class="nav-end-li"><a
				href="${pageContext.request.contextPath }/logout">로그아웃</a></li>
		</ul>
	</nav>
	<main>
		<div class="todaysInfo">
			<p class="left">오늘의 프로젝트 수</p>
			<p class="right">${tdProjs }</p>
			<div class="clear"></div>
			<p class="left">오늘의 가입자 수</p>
			<p class="right">${tdUsers }</p>
			<div class="clear"></div>
			<p class="left">WithUs를 통해 펀딩된 금액</p>
			<p class="right">${allFundPrice }원</p>
			<div class="clear"></div>
		</div>
		<br>
		<div class="charts">
			<div class="myChart" style="width: 60%;">
			<div class="font-bold text-xl text-blue-600">전년대비 매출비교</div>
				<canvas id="myChart10"></canvas>
			</div>
			<div class="myChart" style="width: 30%;">
			<div class="font-bold text-xl text-blue-600">카테고리 점유율</div>
				<canvas id="myChart11"></canvas>
			</div>
		</div>
	</main>
<script>	
 var context10 = document.getElementById('myChart10').getContext('2d');
var context11 = document.getElementById('myChart11').getContext('2d');

var myChart10 = new Chart(context10, {
    type: 'line', // 차트의 형태
    data: { // 차트에 들어갈 데이터
        labels: [
            //x 축
           "Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"
        ],
        datasets: [
            { //데이터
                label: '2021년 매출액', //차트 제목
                 fill: false,  // line 형태일 때, 선 안쪽을 채우는지 안채우는지
                data: [
                    <c:forEach var="list" items="${admin_totalPrice}">
                    <c:out value="${list.jan}"/>,
                    <c:out value="${list.feb}"/>,
                    <c:out value="${list.mar}"/>,
                    <c:out value="${list.apr}"/>,
                    <c:out value="${list.may}"/>,
                    <c:out value="${list.jun}"/>,
                    <c:out value="${list.jul}"/>,
                    <c:out value="${list.aug}"/>,
                    <c:out value="${list.sep}"/>,
                    <c:out value="${list.oct}"/>,
                    <c:out value="${list.nov}"/>,
                    <c:out value="${list.dec}"/>,
                   </c:forEach> 
                   
                   /* //x축 label에 대응되는 데이터 값 */
                ],
                backgroundColor: [
                    //색상
                    'rgba(255, 99, 132, 0.2)',
                    'rgba(54, 162, 235, 0.2)',
                    'rgba(255, 206, 86, 0.2)',
                    'rgba(75, 192, 192, 0.2)',
                    'rgba(153, 102, 255, 0.2)',
                    'rgba(255, 159, 64, 0.2)'
                ],
                borderColor: [
                    //경계선 색상
                    'rgba(255, 99, 132, 1)',
                    'rgba(54, 162, 235, 1)',
                    'rgba(255, 206, 86, 1)',
                    'rgba(75, 192, 192, 1)',
                    'rgba(153, 102, 255, 1)',
                    'rgba(255, 159, 64, 1)'
                ],
                borderWidth: 1, //경계선 굵기
                pointRadius:4,
                pointHoverRadius:8
            },
            {
                label: '2020년 매출액',
                 fill: false, 
                data: [
                   
                  <c:forEach var="list" items="${admin_lastTotalPrice}">
                     <c:out value="${list.jan}"/>,
                     <c:out value="${list.feb}"/>,
                     <c:out value="${list.mar}"/>,
                     <c:out value="${list.apr}"/>,
                     <c:out value="${list.may}"/>,
                     <c:out value="${list.jun}"/>,
                     <c:out value="${list.jul}"/>,
                     <c:out value="${list.aug}"/>,
                     <c:out value="${list.sep}"/>,
                     <c:out value="${list.oct}"/>,
                     <c:out value="${list.nov}"/>,
                     <c:out value="${list.dec}"/>,
                    </c:forEach> 
                  
                ],
                backgroundColor: "white",
                borderColor: '#900'
            } 
        ]
    },
    options: {
       maintainAspectRatio : false,
       legend:{
    	   /* display:false */
       },
        scales: {
            yAxes: [
                   {stacked : true }   
            ]
        }
    }
}); 
var myChart11 = new Chart(context11, {
    type: 'pie', // 차트의 형태
    data: { // 차트에 들어갈 데이터
        labels: [
            //x 축
           <c:forEach var="list" items="${admin_category}">
           "<c:out value="${list.category}"/>",
           </c:forEach>
           
        ],
        datasets: [
            { //데이터
                label: '매출데이터', //차트 제목
                fill: false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
                data: [
                   <c:forEach var="list" items="${admin_category}">
                   <c:out value="${list.count}"/>,
                   </c:forEach> //x축 label에 대응되는 데이터 값
                ],
                backgroundColor: [
                    //색상
                    'rgba(255, 99, 132, 0.2)',
                    'rgba(54, 162, 235, 0.2)',
                    'rgba(255, 206, 86, 0.2)',
                ],
                borderColor: [
                    //경계선 색상
                    'rgba(255, 99, 132, 1)',
                    'rgba(54, 162, 235, 1)',
                    'rgba(255, 206, 86, 1)',
                ],
                borderWidth: 1 //경계선 굵기
            }/* ,
            {
                label: 'test2',
                fill: false,
                data: [
                    8, 34, 12, 24
                ],
                backgroundColor: 'rgb(157, 109, 12)',
                borderColor: 'rgb(157, 109, 12)'
            } */
        ]
    },
    options: {
    	 legend:{
      	   /* display:false */
         },
        scales: {
            yAxes: [
                {
                    ticks: {
                        beginAtZero: true
                    }
                }
            ]
        }
    }
});
</script>
</body>
</html>