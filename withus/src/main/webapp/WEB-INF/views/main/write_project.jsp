<%@page import="java.io.File"%>
<%@page import="org.springframework.web.multipart.MultipartRequest"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스토리 작성</title>
<script src="${pageContext.request.contextPath }/ckeditor/ckeditor.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>

<script>
   function chkSubmit() {
      frm = document.forms['frm'];

      var name = frm['name'].value.trim();
      var subject = frm['title'].value.trim();

      if (name == "") {
         alert("작성자 란은 반드시 입력해야 합니다");
         frm['name'].focus();
         return false;
      }
      if (title == "") {
         alert("제목은 반드시 작성해야 합니다");
         frm['title'].focus();
         return false;
      }
      return true;
   } // end chkSubmit()
   
</script>

<body>
	<h1>스토리 작성</h1>
	<form name="frm" action="write_projectOk" method="post"
		onsubmit="return chkSubmit()" enctype="multipart/form-data">

		판매자아이디 : <input name="selid" value="test"><br>
		제목: <input type="text" name="title" /><br>
		내용:<br>
		<textarea name="content" id="content"></textarea>
		<script>
         CKEDITOR
               .replace(
                     'content',
                     {
                        width : '640px',
                        height : '400px',
                        filebrowserImageUploadUrl : '${pageContext.request.contextPath}/imageUpload',
                        font_names : "맑은 고딕/Malgun Gothic;굴림/Gulim;돋움/Dotum;바탕/Batang;궁서/Gungsuh;Arial/Arial;Comic Sans MS/Comic Sans MS;Courier New/Courier New;Georgia/Georgia;Lucida Sans Unicode/Lucida Sans Unicode;Tahoma/Tahoma;Times New Roman/Times New Roman;MS Mincho/MS Mincho;Trebuchet MS/Trebuchet MS;Verdana/Verdana",
                        font_defaultLabel : "맑은 고딕/Malgun Gothic",
                        fontSize_defaultLabel : "12"

                     });
            $('#submit').click(function(){
            alert(CKEDITOR.instances.editor.getData())
         });
      </script>
		아이템 가격 : <input type="number" name="itemprice"><br>
		카테고리 : <select name="category">
			<option value="가전">가전</option>
			<option value="뷰티">뷰티</option>
			<option value="푸드">푸드</option>
		</select> <br>
		시작일 : <input type="date" id="start" name="startDate"><br>
		종료일 : <input type="date" id="end" name="endDate"><br>
		<input type="submit" id="submit" value="등록하기">
	</form>
</body>
</html>