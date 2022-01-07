/**
 * 
 */

$(document).ready(function() {
	$('.right_inquiry').click(function() {
		/*alert("들어옴");*/
		setPopup("write");
		$("#dlg_write").show();
		
	});
	
	//모달 대화상자 close 버튼 누르면
	$(".modal .close").click(function(){
		$(this).parents(".modal").hide();
	});
	
	$("#frmWrite").submit(function(){
		$(this).parents(".modal").hide();		
	});
	
	$('#goal').val
	
});

function chkWrite(){
	var data=$("#frmWrite").serialize();
	alert(data);
	
	
	return false;
}

function setPopup(mode) {

	if(mode=="write"){
		
		/*alert("mode : write들어옴");*/
		$('#frmWrite')[0].reset(); 	//fro 내의 기존 내용 reset
		$('#dlg_write .title').text("문의하기");
		$("#dlg_write .btn_group_header").hide();
		$("#dlg_write .btn_group_write").show();
		$("dlg_write input[name='subject']").attr("readonly",false); //리드온리기능 없애기
		$("dlg_write input[name='subject']").css("border","1px solid #ccc");
		$("dlg_write textarea[name='content']").attr("readonly",false); //리드온리기능 없애기
		$("dlg_write textarea[name='content']").css("border","1px solid #ccc");
	}
}
