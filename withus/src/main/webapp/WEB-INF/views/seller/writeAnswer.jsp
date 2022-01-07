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
<c:choose>
		<c:when test="${result==0 }">
			<script type="text/javascript">
				alert("문의글 답글 작성실패");
				history.back();
			</script>
		</c:when>
		<c:otherwise>
			<script type="text/javascript">
			alert("문의글 답글 성공");
			location.href="inquiryBynum?num=${dto.innum}"; 
			</script>
		</c:otherwise>
	</c:choose>
</body>
</html>