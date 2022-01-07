<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>글 수정</title>
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

		if (content == "") {
			alert("내용은 반드시 입력해야 합니다.");
			frm['content'].focus();
			return false;
		}

		return true;
	}
</script>
</head>
<body>
	<main>
		<div class="main-notice-form">
			<form name="frm" action="updateOkNotice" method="post"
				onsubmit="return chkSubmit()">
				<input type="hidden" name="num" value="${list[0].num }" /><br>
				<p class="sub-title left">작성자</p>
				<p id="writer" class="right">${list[0].userEmail }</p>
				<br>
				<div class="clear"></div>
				<label for="title" class="sub-title">제목</label><br> <input
					type="text" name="title" id="title" value="${list[0].title }" /><br>
				<br> <label for="content" class="sub-title">내용</label><br>
				<textarea name="content" id="content">${list[0].content }</textarea>
				<script>
					CKEDITOR
							.replace(
									'content',
									{
										width : '640px',
										height : '400px',
										filebrowserImageUploadUrl : '${pageContext.request.contextPath}/admin/imageUpload',
										font_names : "맑은 고딕/Malgun Gothic;굴림/Gulim;돋움/Dotum;바탕/Batang;궁서/Gungsuh;Arial/Arial;Comic Sans MS/Comic Sans MS;Courier New/Courier New;Georgia/Georgia;Lucida Sans Unicode/Lucida Sans Unicode;Tahoma/Tahoma;Times New Roman/Times New Roman;MS Mincho/MS Mincho;Trebuchet MS/Trebuchet MS;Verdana/Verdana",
										font_defaultLabel : "맑은 고딕/Malgun Gothic",
										fontSize_defaultLabel : "12"

									});
					$('#submit').click(function() {
						alert(CKEDITOR.instances.editor.getData())
					});
				</script>
				<br> <br> <input type="submit" value="수정하기"
					class="main-btn" />
			</form>
			<div class="clear"></div>
			<br>
			<button class="main-btn right" type="button" onclick="history.back()">이전으로</button>
			<button class="main-btn left" type="button"
				onclick="location.href='managingNotice'">목록보기</button>
		</div>
	</main>
</body>
</html>