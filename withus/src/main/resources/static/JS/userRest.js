var page = 1;	// 현재 페이지
var pageRows = 30;	// 페이지당 글의 개수
var viewItem = undefined;	// 가장 최근에 view 한 글의 데이터

$(document).ready(function() {
	// 페이지 최초 로딩되면 1페이지 내용을 로딩
	loadPage(page);

	$(".modal .close").click(function() {
		$(this).parents(".modal").hide();
	});

	// 삭제 버튼 누르면
	$("#btnDel").click(function() {
		chkDelete();
	});

	// (view) 상자에서 '삭제' 버튼 누르면 해당 사용자 (aiid) 삭제 진행
	$("#viewDelete").click(function() {
		if (deleteAiid(viewItem.aiid)) {
			$(this).parents(".modal").hide();   // 삭제 하면 대화상자 닫기
		}
	});

	// (view) 대화 상자에서 '수정' 버튼 누르면
	$('#viewUpdate').click(function() {
		setPopup("update");
	})
	
	// 수정 완료 버튼 누르면
	$("#updateOk").click(function() {
		chkUpdate();
	})

});


function loadPage(page) {
	$.ajax({
		// url : /board/{page}/{pageRows}
		url: "./" + page + "/" + pageRows,
		type: "GET",
		cache: false,
		success: function(data, status) {
			if (status == "success") {
				// response가 application/json이면 parse된 결과가 data에 담겨있음
				if (updateList(data)) {
					addViewEvent();
				}
			}
		}
	});
}

// 목록 업데이트 -> 성공하면 true, 실패하면 false
function updateList(jsonObj) {
	var result = "";	// 최종 결과

	if (jsonObj.status == "OK") {
		var count = jsonObj.count;

		window.page = jsonObj.page;
		window.pageRows = jsonObj.pagerows;

		var items = jsonObj.data;
		for (var i = 0; i < count; i++) {
			result += "<tr>\n";
			result += "<td><input type='checkbox' name='aiid' value='" + items[i].aiid + "'></td>\n";
			result += "<td>" + items[i].aiid + "</td>\n";
			result += "<td><span class='email' data-aiid='" + items[i].aiid + "'>" + items[i].email + "</span></td>\n";
			result += "<td>" + items[i].name + "</td>\n";
			result += "<td>" + items[i].role + "</td>\n";
			result += "</tr>\n";
		}
		$("#list tbody").html(result);

		// 페이지 정보 업데이트
		$("#pageinfo").text(jsonObj.page + "/" + jsonObj.totalpage + " 페이지, " + jsonObj.totalcnt + "명의 User");

		// pageRows
		var txt = "<select id='rows' onchange='changePageRows()'>\n";
		txt += "<option " + ((window.pageRows == 30) ? "selected" : "") + " value='30'>30개씩</option>\n";
		txt += "<option " + ((window.pageRows == 50) ? "selected" : "") + " value='50'>50개씩</option>\n";
		txt += "<option " + ((window.pageRows == 100) ? "selected" : "") + " value='100'>100개씩</option>\n";
		txt += "</select>\n";
		$("#pageRows").html(txt);

		// [페이징] 정보 업데이트
		var pagination = buildPagination(jsonObj.userpages, jsonObj.totalpage, jsonObj.page, jsonObj.pagerows);
		$("#pagination").html(pagination);

	} else {
		alert("내용이 없습니다.");
		return false;
	}

	return true;

}

// [페이징] 생성
// 한 [페이징]에 표시될 페이지수 -> userPages
// 총 페이지수 -> totalPage
// 현재 페이지 -> curPage
function buildPagination(userPages, totalPage, curPage, pageRows) {
	var str = "";   // 최종적으로 페이징에 나타날 HTML 문자열 <li> 태그로 구성

	// 페이징에 보여질 숫자들 (시작숫자 start_page ~ 끝숫자 end_page)
	var start_page = ((parseInt((curPage - 1) / userPages)) * userPages) + 1;
	var end_page = start_page + userPages - 1;
	
	if (end_page >= totalPage) {
		end_page = totalPage;
	}

	// << 표시 여부
	if (curPage > 1) {
		str += "<li><a onclick='loadPage(" + 1 + ")' class='tooltip-top' title='처음'><i class='fas fa-angle-double-left'></i></a></li>\n";
	}

	// < 표시 여부
	if (start_page > 1)
		str += "<li><a onclick='loadPage(" + (start_page - 1) + ")' class='tooltip-top' title='이전'><i class='fas fa-angle-left'></i></a></li>\n";

	// 페이징 안의 '숫자' 표시	
	if (totalPage > 1) {
		for (var k = start_page; k <= end_page; k++) {
			if (curPage != k)
				str += "<li><a onclick='loadPage(" + k + ")'>" + k + "</a></li>\n";
			else
				str += "<li><a class='active tooltip-top' title='현재페이지'>" + k + "</a></li>\n";
		}
	}

	// > 표시
	if (totalPage > end_page) {
		str += "<li><a onclick='loadPage(" + (end_page + 1) + ")' class='tooltip-top' title='다음'><i class='fas fa-angle-right'></i></a></li>\n";
	}

	// >> 표시
	if (curPage < totalPage) {
		str += "<li><a onclick='loadPage(" + totalPage + ")' class='tooltip-top' title='맨끝'><i class='fas fa-angle-double-right'></i></a></li>\n";
	}

	return str;

}

// <select>에서 pageRows 값 변경될 때마다
function changePageRows() {
	window.pageRows = $("#rows").val();
	loadPage(window.page);
}

function chkDelete() {
	var aiids = [];  // check 된 aiid 들을 담을 배열
	$("#list tbody input[name=aiid]").each(function() {
		if ($(this).is(":checked")) {   // jQuery 에서 check 여부 확인 함수
			aiids.push(parseInt($(this).val()));  // aiids 배열에 check 된 aiid 값 추가
		}
	});

	if (aiids.length == 0) {
		alert("삭제할 User를 체크해주세요.");
	} else {
		if (!confirm(aiids.length + "명의 User를 삭제하시겠습니까?"))
			return false;

		var data = $("#frmList").serialize();

		$.ajax({
			url: ".", // URL : /board
			type: "DELETE",
			data: data,
			cache: false,
			success: function(data, status) {
				if (status == "success") {
					if (data.status == "OK") {
						alert("DELETE 성공 : " + data.count + "개")
						loadPage(window.page);   // 현재 페이지 목록 리로딩
					} else {
						alert("DELETE 실패 " + data.message);
						return false;
					}
				}
			}
		});
	}
}

// 현재 글 목록 list에 대해 이벤트 등록
// 제목(subject) 클릭하면 view 팝업 화면 뜰 수 있게
function addViewEvent() {
	$("#list .email").click(function() {
		/*alert($(this).text() + " : " + $(this).attr('data-aiid'));*/

		$.ajax({
			url: "./" + $(this).attr('data-aiid'),
			type: "GET",
			cache: false,
			success: function(data, status) {
				if (status == "success") {
					if (data.status == "OK") {
						// 글 1개 읽어오기 성공하면, 내부 데이터에 세팅하고 팝업 대화상자 보여주기
						window.viewItem = data.data[0];

						// 글 읽기 팝업 띄우기
						setPopup("view");
						$("#dlg_write").show();

					} else {
						alert("VIEW 실패 : " + data.meesage);
					}
				}
			}
		});
	})
}

// 글 쓰기, 읽기, 수정 대화상자 세팅
function setPopup(mode) {
	// 읽기
	if (mode == "view") {
		$("#dlg_write .title").text("User 정보");
		$("#dlg_write .btn_group_header").show()
		$("#dlg_write .btn_group_view").show();
		$("#dlg_write .btn_group_update").hide();

		$("#dlg_write #regdate").text(viewItem.regdate);

		$("#dlg_write input[name='aiid']").val(viewItem.aiid);	// 나중에 삭제, 수정 위해 필요

		$("#dlg_write input[name='email']").val(viewItem.email);
		$("#dlg_write input[name='email']").attr("readonly", true);
		$("#dlg_write input[name='email']").css("border", "none");

		$("#dlg_write input[name='name']").val(viewItem.name);
		$("#dlg_write input[name='name']").attr("readonly", true);
		$("#dlg_write input[name='name']").css("border", "none");

		$("#dlg_write input[name='phone']").val(viewItem.phone);
		$("#dlg_write input[name='phone']").attr("readonly", true);
		$("#dlg_write input[name='phone']").css("border", "none");
		
		$("#dlg_write input[name='addr']").val(viewItem.addr);
		$("#dlg_write input[name='addr']").attr("readonly", true);
		$("#dlg_write input[name='addr']").css("border", "none");
		
		$("#dlg_write input[name='cash']").val(viewItem.cash);
		$("#dlg_write input[name='cash']").attr("readonly", true);
		$("#dlg_write input[name='cash']").css("border", "none");
		
		$("#dlg_write input[name='role']").val(viewItem.role);
		$("#dlg_write input[name='role']").attr("readonly", true);
		$("#dlg_write input[name='role']").css("border", "none");
		
		$("#dlg_write input[name='regdate']").val(viewItem.regdate);
		$("#dlg_write input[name='regdate']").attr("readonly", true);
		$("#dlg_write input[name='regdate']").css("border", "none");
	}
	
	// 수정
	if (mode == "update") {
		$("#dlg_write .title").text("수정");
		$("#dlg_write .btn_group_header").show();
		$("#dlg_write .btn_group_view").hide();
		$("#dlg_write .btn_group_update").show();

		$("#dlg_write input[name='email']").attr("readonly", false);
		$("#dlg_write input[name='email']").css("border", "1px solid #ccc");

		$("#dlg_write input[name='name']").attr("readonly", false);
		$("#dlg_write input[name='name']").css("border", "1px solid #ccc");
		
		$("#dlg_write input[name='phone']").attr("readonly", false);
		$("#dlg_write input[name='phone']").css("border", "1px solid #ccc");
		
		$("#dlg_write input[name='addr']").attr("readonly", false);
		$("#dlg_write input[name='addr']").css("border", "1px solid #ccc");
		
		$("#dlg_write input[name='role']").attr("readonly", false);
		$("#dlg_write input[name='role']").css("border", "1px solid #ccc");
	}
}

function deleteAiid(aiid) {

	if (!confirm(aiid + "번 유저를 삭제하시겠습니까?")) return false;

	// DELETE 방식
	$.ajax({
		url: ".",  // URL : /board
		type: "DELETE",
		data: "aiid=" + aiid,
		cache: false,
		success: function(data, status) {
			if (status == "success") {
				if (data.status == "OK") {
					alert("DELETE 성공: " + data.count + "개");
					loadPage(window.page);  // 현재 페이지 리로딩
				} else {
					alert("DELETE 실패: " + data.message);
					return false;
				}
			}
		}
	});

	return true;
}

// 
function chkUpdate() {
	var data = $("#frmWrite").serialize();

	// PUT 방식 
	$.ajax({
		url: ".",  // URL: /board
		type: "PUT",
		cache: false,
		data: data,

		success: function(data, status) {
			if (status == "success") {
				if (data.status == "OK") {
					alert("UPDATE 성공: " + data.count + "개");
					loadPage(window.page);   // 현재 페이지 리로딩
				} else {
					alert("UPDATE 실패: " + data.staus + " : " + data.message);
				}

				//현재 팝업 닫기
				$("#dlg_write").hide();
			}
		}
	});
	
}