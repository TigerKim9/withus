<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:choose>
	<c:when test="${empty list || fn:length(list) == 0 }">
		<script>
			alert("해당 정보가 삭제되거나 없습니다");
			history.back();
		</script>
	</c:when>
	<c:otherwise>
		<!DOCTYPE html>
		<html lang="ko">
<head>
<meta charset="UTF-8">
<title>${list[0].title }수정</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/CSS/admin/adminWrite.css" />
<script src="${pageContext.request.contextPath }/ckeditor/ckeditor.js"></script>
<script>
	function chkSubmit() {
		frm = document.forms['frm'];

		var title = frm['title'].value.trim();

		if (title == "") {
			alert("제목은 반드시 작성해야 합니다");
			frm['title'].focus();
			return false;
		}
		return true;
	}
</script>
</head>
<body>
	<main>
		<div class="main-update-form">
			<h2>
				<strong>${list[0].title }</strong>
			</h2><br>
			<form name="frm" action="updateOkProject" method="post"
				onsubmit="return chkSubmit()"  enctype="multipart/form-data">
				<input type="hidden" name="prnum" value="${list[0].prnum }">
				<p class="sub-title">판매자</p><p id="seller">${list[0].selid }</p><br>
				<label for="title" class="sub-title">제목</label>
				<input type="text" name="title" id="title" value="${list[0].title }" /><br>
				<label for="itemprice" class="sub-title">아이템 가격</label>
				<input type="number" name="itemprice" id="itemprice" value="${list[0].itemprice }" /><br>
				<label for="price" class="sub-title">목표 가격</label>
				<input type="number" name="price" value="${list[0].price }" /><br>
				
				<label for="category" class="sub-title">분류</label>
				<c:set var="value" value="${list[0].category }"></c:set>
				<c:choose>
					<c:when test="${value=='뷰티' }">
						<select name="category" id="category">
							<option value="가전">가전</option>
							<option value="뷰티" selected="selected">뷰티</option>
							<option value="푸드">푸드</option>
							<option value="여행">여행</option>
						</select>
					</c:when>
					<c:when test="${value=='가전' }">
						<select name="category" id="category">
							<option value="가전" selected="selected">가전</option>
							<option value="뷰티">뷰티</option>
							<option value="푸드">푸드</option>
							<option value="여행">여행</option>
						</select>
					</c:when>
					<c:when test="${value=='푸드' }">
						<select name="category" id="category">
							<option value="가전">가전</option>
							<option value="뷰티">뷰티</option>
							<option value="푸드" selected="selected">푸드</option>
							<option value="여행">여행</option>
						</select>
					</c:when>
					<c:otherwise>
						<select name="category" id="category">
							<option value="가전">가전</option>
							<option value="뷰티">뷰티</option>
							<option value="푸드">푸드</option>
							<option value="여행" selected="selected">여행</option>
						</select>
					</c:otherwise>
				</c:choose>
				<br>
				<label for="startDate" class="sub-title">시작일</label> 
				<input type="date" name="startDate" id="startDate" value="${list[0].startDate }" /><br>
				<label for="endDate" class="sub-title">종료일</label>
				<input type="date"name="endDate" id="endDate" value="${list[0].endDate }" /><br><br>
				<textarea name="content" id="content">${list[0].content }</textarea>
				<script>
					CKEDITOR
							.replace(
									'content',
									{
										width : '800px',
										height : '250px',
										filebrowserImageUploadUrl : '${pageContext.request.contextPath}/seller/imageUim;돋움/Dotum;바탕/Batang;궁서/Gungsuh;Arialpload',
										font_names : "맑은 고딕/Malgun Gothic;굴림/Gul/Arial;Comic Sans MS/Comic Sans MS;Courier New/Courier New;Georgia/Georgia;Lucida Sans Unicode/Lucida Sans Unicode;Tahoma/Tahoma;Times New Roman/Times New Roman;MS Mincho/MS Mincho;Trebuchet MS/Trebuchet MS;Verdana/Verdana",
										font_defaultLabel : "맑은 고딕/Malgun Gothic",
										fontSize_defaultLabel : "12"

									});
					$('#submit').click(function() {
						alert(CKEDITOR.instances.editor.getData())
					});
				</script>
				<br><br><input type="submit" class="main-btn right" value="수정">
			</form>
			<button class="main-btn" onclick="history.back()">이전으로</button>
			<button class="main-btn" onclick="location.href='managingProject'">목록보기</button>
			<br>
		</div>
	</main>
	
	<script>
function chkSubmit() {
   frm = document.forms['frm'];

   var title = frm['title'].value.trim();
   var content = frm['content'].value.trim();
   var itemprice = frm['itemprice'].value.trim();
   var price = frm['price'].value.trim();
   var category = frm['category'].value.trim();
   var startDate = frm['startDate'].value.trim();
   var endDate = frm['endDate'].value.trim();
   console.log("아이템 " + itemprice)
   console.log("목표 " + price)

   if (title == "" || title == null) {
      alert("제목을 입력해주세요 !");
      frm['title'].focus();
      return false;
   }
   if (content == "" || content == null) {
      alert("내용을 입력해주세요 !");
      frm['content'].focus();
      return false;
   }
   if (itemprice == ""|| itemprice == null) {
      alert("아이템 가격을 입력해주세요 !");
      frm['itemprice'].focus();
      return false;
   }
   if (price == ""|| price == null) {
      alert("목표 금액을 입력해주세요 !");
      frm['price'].focus();
      return false;
   }
   if (category == ""|| category == null) {
      alert("카테고리를 입력해주세요 !");
      frm['category'].focus();
      return false;
   }
   if (startDate == ""|| startDate == null) {
      alert("시작날짜를 입력해주세요 !");
      frm['startDate'].focus();
      return false;
   }
   if (endDate == ""|| endDate == null) {
      alert("끝낼 날짜를 입력해주세요 !");
      frm['endDate'].focus();
      return false;
   }
   if(parseInt(price)<=parseInt(itemprice)){
	   console.log("아이템22 " + itemprice)
 	   console.log("목표22 " + price)
 	  alert("물품가격이 목표금액과 같거나 높을 수 없습니다 ! \n낮은 금액을 입력해주세요 !");
 	 
 	  frm['itemprice'].focus();
 	  return false;
   } 
   if(startDate>endDate){
 	  alert("종료날짜보다 시작날짜가 작아야합니다.");
 	  frm['startDate'].focus();
 	  return false;
   }
   return true;
} // end chkSubmit()
</body>
		</html>
	</c:otherwise>
</c:choose>