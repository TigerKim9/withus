<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>User 정보</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/CSS/common.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/CSS/admin/admin.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://kit.fontawesome.com/bb29575d31.js"></script>
<script src="${pageContext.request.contextPath }/JS/userRest.js"></script>
</head>
<body>
	<nav>
		<ul class="nav-ul">
		<li class="nav-li"><a href="/main">사용자 메인</a>
		
			<li class="nav-li"><a href="main">메인으로</a></li>
			<li class="nav-li"><a href="managingProject">펀딩 프로젝트 관리</a></li>
			<li class="nav-li now"><a href="#">사용자 관리</a></li>
			<li class="nav-li"><a href="managingNotice">글 관리</a></li>
			<li class="nav-end-li">${prc }</li>
			<li class="nav-end-li"><a
				href="${pageContext.request.contextPath }/logout">로그아웃</a></li>
		</ul>
	</nav>
	<main>
		<div id="list">
			<div class="d01">
				<div class="left" id="pageinfo"></div>
				<div class="right" id="pageRows"></div>
			</div>
			<div class="clear"></div>

			<%-- 목록 --%>
			<form id="frmList" name="frmList">
				<table>
					<thead>
						<th>#</th>
						<th>aiid</th>
						<th>Email</th>
						<th>Name</th>
						<th>ROLE</th>
					</thead>
					<tbody>
					</tbody>
				</table>
			</form>

			<br>
			<%-- 페이징 --%>
			<div class="center">
				<ul class="pagination" id="pagination"></ul>
			</div>
			
			<%-- button --%>
			<div class="d01">
				<div class="right">
					<button type="button" id="btnDel" class="btn restBtn">사용자
						삭제</button>
				</div>
			</div>
		</div>
		<div class="clear"></div>

		<%-- 보기 / 수정 대화상자 --%>
		<div id="dlg_write" class="modal">
			<form class="modal-content animate" id="frmWrite" name="frmWrite"
				method="post">
				<div class="container">
					<h3 class="title"></h3>
					<span class="close" title="Close Modal">&times;</span>
					<%-- 닫기 버튼 --%>

					<input type="hidden" name="aiid" value="0">
					<%-- 읽기, 삭제, 수정 위해 필요 --%>

					<div class="d01 btn_group_header">
						<div class="left">
							<p id="viewcnt"></p>
						</div>
						<div class="right">
							<p id="regdate"></p>
						</div>
						<div class="clear"></div>
					</div>

					<label for="email"><strong>Email</strong></label> <input
						type="text" name="email" required> <label for="name"><strong>Name</strong></label>
					<input type="text" name="name" required> <label for="phone"><strong>Phone
							Number</strong></label> <input type="text" name="phone" required> <label
						for="addr"><strong>Address</strong></label> <input type="text"
						name="addr" required> <label for="cash"><strong>Cash</strong></label>
					<input type="text" name="cash" required> <label for="role"><strong>ROLE</strong></label>
					<input type="text" name="role" required>

					<%-- 조회 --%>
					<div class="d01 btn_group_view">
						<div class="left">
							<button type="button" class="btn restBtn" id="viewDelete">삭제</button>
						</div>
						<div class="right">
							<button type="button" class="btn restBtn info" id="viewUpdate">수정</button>
						</div>
						<div class="clear"></div>
					</div>

					<%-- 수정 --%>
					<div class="d01 btn_group_update">
						<div>
							<button type="button" class="btn restBtn info fullbtn "
								id="updateOk">수정</button>
						</div>
						<div class="clear"></div>
					</div>
				</div>
			</form>
		</div>
	</main>
</body>
</html>