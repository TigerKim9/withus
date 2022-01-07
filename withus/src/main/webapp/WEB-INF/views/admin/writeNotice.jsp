<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>글쓰기</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/CSS/admin/adminWrite.css" />
<script src="${pageContext.request.contextPath }/ckeditor/ckeditor.js"></script>
<script>
	function chkSubmit() {
		var frm = document.forms['frm'];
		var title = frm['title'].value.trim();
		var content = frm['content'].value.trim();

		if (title == "") {
			alert("제목은 반드시 입력해야 합니다.");
			frm['title'].focus();
			return false;
		}


		return true;
	}
</script>
</head>
<body>
	<main>
	<div class="main-notice-form">
		<form name="frm" action="writeOkNotice" method="post" onsubmit="return chkSubmit()">
			<select name="category" id="cg-select" class="right">
					<option value="notice">공지</option>
					<option value="event">이벤트</option>
			</select><br>
			<input type="hidden" name="userEmail" value="${userEmail }" /><br>
			<label for="title" class="sub-title">제목</label><br>
			<input type="text" id="title" name="title" value="${w.title }" /><br><br>
			<label for="content" class="sub-title">내용</label><br>
			<textarea name="content" id="content">${w.content }</textarea>
				<script>
					CKEDITOR
							.replace(
									'content',
									{
										width : '640px',
										height : '400px',
										filebrowserImageUploadUrl : '${pageContext.request.contextPath}/seller/imageUpload',
										font_names : "맑은 고딕/Malgun Gothic;굴림/Gulim;돋움/Dotum;바탕/Batang;궁서/Gungsuh;Arial/Arial;Comic Sans MS/Comic Sans MS;Courier New/Courier New;Georgia/Georgia;Lucida Sans Unicode/Lucida Sans Unicode;Tahoma/Tahoma;Times New Roman/Times New Roman;MS Mincho/MS Mincho;Trebuchet MS/Trebuchet MS;Verdana/Verdana",
										font_defaultLabel : "맑은 고딕/Malgun Gothic",
										fontSize_defaultLabel : "12"

									});
					$('#submit').click(function() {
						alert(CKEDITOR.instances.editor.getData())
					});
				</script>
				<br>
			<br> <input type="submit" value="작성" class="main-btn right" style="width: 107px;" />
		</form>
		<button class="main-btn left" type="button" onclick="location.href='managingNotice'">목록으로</button>
		</div>
	</main>
	
	<script>
	function onChange() {
		var key = window.event.keyCode;
		
		if (key === 13) {
			document.getElementById("content").value = document.getElementById("content").value + "\n<br>"; 
			return false;
		} else {
			return true;
		}
	}
	</script>
</body>
</html>