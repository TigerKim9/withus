<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>Inquiry Ok 들어옴</h1>
<c:choose>

		<c:when test="${result==0 }">
			<script type="text/javascript">
				alert("문의 글 작성 실패")
				history.back();
			</script>
		</c:when>
		<c:otherwise>
			<script type="text/javascript">
			alert("문의 글 작성 성공")
			location.href="/viewInquiry?innum=${last[0].num}";
			</script>
		</c:otherwise>
	</c:choose>
</body>
</html>