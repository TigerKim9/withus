<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>

.btn{display:block; width: 200px; height: 50px; background: #4ac4f3;
text-decoration: none; text-align: center; line-height: 50px; color: #fff;
border-radius: 50px;
}


</style>

<body>

<a href="#" class="btn" onclick="popup()">배송 조회</a>
<script>
function popup(){
    window.open("http://localhost:8086/main/shippingForm", "s", "width= 640, height= 480, left=0, top=0, resizable=yes, toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=yes, resizable=no, copyhistory=no").blur();
    	window.focus();
    	}</script>

</body>
</html>

