<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>InquiryBynum</title>
<link rel="stylesheet"
   href="${pageContext.request.contextPath }/CSS/inquiry.css">
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<%-- <script src="${pageContext.request.contextPath }/JS/Inquiryanswer.js"></script> --%>
</head>
<body>
<header>
		<%@include file="sellerHeader.jsp"%>
	</header>
   <main>
      <div class="view-inquiry">
         <h1 class="subject">문의 내용</h1>
         <div class="list2">
            <p class="sub-title">번호</p>
            <p class="list2s">${list[0].num}</p>
            <br>
            <p class="sub-title">작성자</p>
            <p class="list2s">${list[0].useremail}</p>
            <br>
            <p class="sub-title">작성일</p>
            <p class="list2s">${list[0].regdate}</p>
            <br>
            <p class="sub-title">제목</p>
            <p class="list2s">${list[0].title}</p>
            <br>
            <p class="sub-title">내용</p>
            <p class="list2s">${list[0].content}</p>
            <br>
         </div>
         <br>

         <!-- 댓글 넣기  -->
         <h1 class="subject-2">답변 내용</h1>
         <div id="answer_container">
         </div>
         <br>
         <c:choose>
         <c:when test="${empty answer || fn:length(answer) == 0}">
         <div id="dlg_write" class="modal">
            <form action="writeAnswer" id="frmWrite" name="frmWrite" method="post">
               <div class="container">
                  <label for="innum" class="sub-title">번호</label>
                  <input id="innum" name="innum" value="${list[0].num}" readonly><br>
                  <label for="writer" class="sub-title">작성자</label>
                  <input id="writer" name="writer" value="${prc }" readonly> <br>
                  <label for="content" class="sub-title">내용</label><br>
                  <textarea id="content" name="content"></textarea>

                  <%--하단버튼 : 글 작성 --%>
                  <div class="d01 btn_group_write">
                     <button type="submit" id="answer" class="answer">답글달기</button>
                  </div>
               </div>
            </form>
         </div>
         </c:when>
         </c:choose>
         <button class="view-btn" type="button" onclick="history.back()">뒤로가기</button>
      </div>
   </main>
   <!-- 초기 페이지 로딩   -->
   <script type="text/javascript">
   $(document).ready(function(){         
      var result = document.getElementById('answer_container');
      $.ajax({
         url : "answerOk/"+${list[0].num},
         method : "GET",
         dataType : "json", 
         success : function(data){
            console.log(data);
            console.log(data.length);
            for(var i=0; i<data.length; i++){
               var output = "<div class='div-answer'>";
               output += "<p class='sub-title'>번호</p><p class='p-answer'>" + data[i].num  + "</p><br>";
               output += "<p class='sub-title'>작성일</p><p class='p-answer'>" + data[i].regdate + "</p><br>";
               output += "<p class='sub-title-c'>내용</p><p class='p-answer-c'>" + data[i].content + "</p></div>";
               
               $("#answer_container").append(output);
            }
         },
         error : function(XMLHttpRequest, textStatus, errorThrown){
            console.log("통신 실패");
         }
      });
   });
</script>
</body>
</html>