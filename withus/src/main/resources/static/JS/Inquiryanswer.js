/**
 * 
 */

/*$(document).ready(function(){
	
	
	$('#answer').click(function(){
		//확인함
		alert("answer버튼 들어옴");	
		var frm=document.forms.frmWrite;
		var prc=frm.writer.value;
		var content=frm.content.value;
		//확인끝	
		alert(prc);
		alert(content);
		alert("ajax입구")
		$.ajax({
				type:"get",
				url:"selectBynum",
				dataType:"json",
				success:function(data){
					alert("ajax들어옴")
					console.log(data);
				}
			});
		
		alert("ajax끝");
		
		
		
		
	});
	
});*/