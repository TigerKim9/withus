<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<head>
<meta charset="UTF-8">
<title>Seller Main</title>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.14.0/css/all.css"
	integrity="sha384-HzLeBuhoNPvSl5KYnjx0BT+WB0QEEqLprO+NBkkk5gbc67FTaL7XIGa2w1L0Xbgc"
	crossorigin="anonymous">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/CSS/sellerHeader.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/CSS/sellerMain.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/CSS/tailwind/public/tailwind.css">
<%-- <script
	src="${pageContext.request.contextPath }/CSS/tailwind/public/tailwind.config.js"></script> --%>
</head>
</head>
<body>
<header>
		<%@include file="sellerHeader.jsp"%>
	</header>
	

<div class="bg-gray-100">
	<div class="inline-grid grid-cols-2 gap-x-10 px-16 py-16 w-full">
		<div id="sellerImg" class="flex justify-start px-8 py-4 sm:h-40 lg:h-20 bg-white  w-full">
			<i class="fas fa-user-md fa-2x py-2"></i> <span class="px-4 py-3">${selid }</span>
			<span class="px-4 py-3">Q&A</span>
			<span class="text-4xl text-red-500 font-bold"><a href="inquiryList"> ${seller_inquiryCount[0].count}</a></span> 
			<span class="px-4 py-3">서포터 수</span> 
			<strong class="text-4xl text-red-500 font-bold">${seller_supportCount[0].count}</strong>
		</div>
	</div>
	<div class="grid grid gap-4 grid-cols-2 px-16 gap-x-10">
			<div class="bg-white ">
				<i class="fas fa-bullhorn fa-1x text-red-500  pl-4"></i><span class="font-bold text-xl">&nbsp;공지사항&nbsp;</span><i class="fas fa-bullhorn fa-1x fa-flip-horizontal text-red-500"></i>	
			<div>
				<c:forEach var="list" items="${notice }" varStatus="status">
					<c:choose>
						<c:when test="${empty list || fn:length(notice)==0}">
							<h3>작성된 글이 없습니다.</h3>
						</c:when>
						<c:otherwise>
							<span class="px-4 text-left fond-bold">${status.count }</span> <a href="/viewNotice?num=${list.num}"><c:out value='${list.title.replaceAll("\\\<.*?\\\>","")}'></c:out></a><br><hr>	
						</c:otherwise>
					</c:choose>
				
					
				</c:forEach>
			</div>
			</div>
			<div class="bg-white">
		
				<i class="fas fa-fire-alt text-red-500 pl-4"></i><span class="font-bold text-xl">&nbsp;인기 프로젝트&nbsp;</span><i class="fas fa-fire-alt text-red-500"></i><br>
				<c:forEach var="list" items="${popular }" varStatus="status">
					<c:choose>
						<c:when test="${empty list || fn:length(popular)==0}">
							<h3>작성된 글이 없습니다.</h3>
						</c:when>
						<c:otherwise>
							<span class="px-4 text-left fond-bold">${status.count }</span> <a href="/fund?prnum=${list.prnum}"><c:out value='${list.content.replaceAll("\\\<.*?\\\>","")}'></c:out></a><br><hr>	
						</c:otherwise>
					</c:choose>
				
					
				</c:forEach>
				
			</div>
			
		</div>
		
		
		<div class="grid grid-cols-2 gap-10 my-24 px-16 sm:h-72 md:h-auto">
			
			<div class=" bg-white">
				<!-- <strong class="flex justify-center text-4xl ">매출데이터</strong> -->
				<div class="mx-12">
				<div class="font-bold text-xl text-blue-600">매출 현황</div>
				<br>
				<!--차트가 그려질 부분-->
				<canvas id="myChart"></canvas>
				</div>
			</div>
			<div class="flex justify-center bg-white">
				<div style="width:350px;" class="" >
				<!--차트가 그려질 부분-->
				<div class="font-bold text-xl text-blue-600">카테고리 점유율</div>
				<br>
				<canvas id="myChart3" class=""></canvas>
				</div>
			</div>
			<div class=" bg-white">
				<div class="mx-12 py-16">
				<!--차트가 그려질 부분-->
				<div class="font-bold text-xl text-blue-600">전년대비 매출비교</div>
			<br>
				<canvas id="myChart4"></canvas>
				</div>
			</div>
			<div class="flex justify-center bg-white ">
			<div style="width:350px;" class="mx-12" >
			<!--차트가 그려질 부분-->
			<div class="font-bold text-xl text-blue-600">분기별 매출</div>
			<br>
			<canvas id="myChart5"></canvas>
			</div>
			</div>
		</div>



		
		<c:forEach var="list" items="${untilToday }">
			<input type="hidden" id="selid" value="${selid}">
			<input type="hidden" id="todayItemprice" value="${list.sumprice }">
			<input type="hidden" id="WeekItemprice"
				value="${untilWeek[0].sumprice }">
			<input type="hidden" id="MonthItemprice"
				value="${untilMonth[0].sumprice }">
			<input type="hidden" id="comingsoon" value="${comingsoon[0].count }">
			<input type="hidden" id="open" value="${open[0].count }">
			<input type="hidden" id="seller_totalPrice"
				value="${seller_totalPrice[0].sumprice }">
			<input type="hidden" id="sellerToday"
				value="${sellerToday[0].sumprice }">
			<input type="hidden" id="sellerWeek"
				value="${sellerWeek[0].sumprice }">
			<input type="hidden" id="sellerMonth"
				value="${sellerMonth[0].sumprice }">
			<br>
			<input type="hidden" id="seller_comingsoonProject"
				value="${seller_comingsoonProject[0].count }">
			<br>
			<input type="hidden" id="seller_openingProject"
				value="${seller_openingProject[0].count }">
			<br>
			<input type="hidden" id="seller_likeCount"
				value="${seller_likeCount[0].count }">
			<input type="hidden" id="seller_firstQuarter"
				value="${seller_firstQuarter[0].sumprice }">
			<br>
			<input type="hidden" id="seller_secondQuarter"
				value="${seller_secondQuarter[0].sumprice }">
			<br>
			<input type="hidden" id="seller_thridQuarter"
				value="${seller_thridQuarter[0].sumprice }">
			<br>
			<input type="hidden" id="seller_fourthQuarter"
				value="${seller_fourthQuarter[0].sumprice }">
			<br>
			<input type="hidden" id="seller_visitorCount"
				value="${seller_visitorCount[0].sumprice }">
			<br>
			<input type="hidden" id="seller_supportCount"
				value="${seller_supportCount[0].count }">
			<input type="hidden" id="seller_payFinshed"
				value="${seller_payFinshed[0].count }">
			<br>
		</c:forEach>

	</div>

		
 <script type="text/javascript">
 
/*  Chart.defaults.global.legend.labels.fontStyle='italic';
 */ 
	//-------------------------------------------------------------------
 //어드민으로 들어가면됨
  var selid=document.getElementById('selid').value; 
  var today=document.getElementById('todayItemprice').value; 
  var Week=document.getElementById('WeekItemprice').value; 
  var Month=document.getElementById('MonthItemprice').value; 
  var comingsoon=document.getElementById('comingsoon').value; 
  var open=document.getElementById('open').value; 
  //-------------------------------------------------------------------
  
  //판매자별 데이터
  var sellerToday=document.getElementById('sellerToday').value; 
   var sellerWeek=document.getElementById('sellerWeek').value; 
  var sellerMonth=document.getElementById('sellerMonth').value;
  var seller_comingsoonProject=document.getElementById('seller_comingsoonProject').value;   
  var seller_openingProject=document.getElementById('seller_openingProject').value;   
  var seller_likeCount=document.getElementById('seller_likeCount').value; 
  var seller_totalPrice=document.getElementById('seller_totalPrice').value; 
  var seller_firstQuarter=document.getElementById('seller_firstQuarter').value; 
  var seller_secondQuarter=document.getElementById('seller_secondQuarter').value; 
  var seller_thridQuarter=document.getElementById('seller_thridQuarter').value; 
  var seller_fourthQuarter=document.getElementById('seller_fourthQuarter').value; 
  
  
 
  
 $(document).ready(function(){
	 var context = document
     .getElementById('myChart')
     .getContext('2d');
 var context3 = document
 .getElementById('myChart3')
 .getContext('2d');
 var context4 = document
 .getElementById('myChart4')
 .getContext('2d');
 var context5 = document
 .getElementById('myChart5')
 .getContext('2d');
 

  
  
  
  


 
 
 var myChart = new Chart(context, {
     type: 'bar', // 차트의 형태
     data: { // 차트에 들어갈 데이터
         labels: [
             //x 축
                 '총매출','하루','1주일','한달'
         ],
         datasets: [
             { //데이터
                 label: '', //차트 제목
                 /* fill: true, */ // line 형태일 때, 선 안쪽을 채우는지 안채우는지
                 data: [
                	 seller_totalPrice,sellerToday,sellerWeek,sellerMonth //x축 label에 대응되는 데이터 값
                 ],
                 backgroundColor: [
                     //색상
                     'rgba(255, 99, 132, 0.2)',
                     'rgba(54, 162, 235, 0.2)',
                     'rgba(255, 206, 86, 0.2)',
                     'rgba(75, 192, 192, 0.2)',
                 ],
                 borderColor: [
                     //경계선 색상
                     'rgba(255, 99, 132, 1)',
                     'rgba(54, 162, 235, 1)',
                     'rgba(255, 206, 86, 1)',
                     'rgba(75, 192, 192, 0.2)',
                 ],
                 borderWidth: 1, //경계선 굵기
                 
             },
             ]
     },
     //옵션 주는 곳
             options: {
            	 legend : {
            		 display:false
            	 },
            	 //부모태그 안에 꽉 채워서 들어가기
            	  /* maintainAspectRatio : false */ 
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
 
 var myChart3 = new Chart(context3, {
     type: 'pie', // 차트의 형태
     data: { // 차트에 들어갈 데이터
         labels: [
             //x 축
         	<c:forEach var="list" items="${seller_category}">
         	"<c:out value="${list.category}"/>",
         	</c:forEach>
				
         ],
         datasets: [
             { //데이터
                 label: '매출데이터', //차트 제목
                 fill: false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
                 data: [
                 	<c:forEach var="list" items="${seller_category}">
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
    	 legend : {
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
 /* seller_monthPrice */
 var myChart4 = new Chart(context4, {
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
                 	 <c:forEach var="list" items="${seller_monthPrice}">
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
                	 
                	<c:forEach var="list" items="${seller_lastTotalPrice}">
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
    	 legend: {
         	/* display: false */
         },
         scales: {
             yAxes: [
                    /* {stacked : true }    */
             ]
         }
     }
 });
                     var myChart5 = new Chart(context5, {
                         type: 'doughnut', // 차트의 형태
                         data: { // 차트에 들어갈 데이터
                             labels: [
                                 //x 축
                             	"1분기", "2분기", "3분기", "4분기"
                             ],
                             datasets: [
                                 { //데이터
                                     label: '분기별 매출액', //차트 제목
                                     fill: false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
                                     data: [
                                     	seller_firstQuarter,seller_secondQuarter,seller_thridQuarter,seller_fourthQuarter 
                                     	
                                     	
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
                        	 legend: {
                             	/* display: false */
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
                        	 //도넛 안의 넓이 조절
                         }
                     });
                    
                     
                                         
                     });
           
        </script>
</body>
</html>