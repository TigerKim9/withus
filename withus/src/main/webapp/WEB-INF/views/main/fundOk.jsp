<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>fundOk</title>
</head>
<body>
	<c:choose>

		<c:when test="${result==0 }">
			<script type="text/javascript">
				alert("펀딩 실패")
				history.back();
			</script>
		</c:when>
		<c:otherwise>
			<script type="text/javascript">
				alert("펀딩 성공");
			</script>
		</c:otherwise>
	</c:choose>
	<input value="${result }">
	
</body>
</html>