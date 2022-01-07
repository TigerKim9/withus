$(document).ready(function() {
	$('#apibtn').click(function iamport(){
		
		var name = $('#name').val();
		var amount = $('#amount').val();
		var tel = $('#tel').val();
		var uid = $('#uid').val();
		var useremail = $('#useremail').val();
		var addr=$('#addr').val();
		console.log("name : "+name);
		console.log("amount : "+amount);
		console.log("tel : "+tel);
		console.log("uid : "+uid);
		console.log("useremail : "+useremail);
		console.log("addr : " +addr);
		
		if(useremail==""){
			alert("로그인하셔야 펀딩이 가능합니다!");
			location.href="loginForm";
		}else if(addr==""||addr==null){
			alert("주소를 입력해주셔야 펀딩이 가능합니다!");
			location.href="payment"
		}else{
			alert("펀딩금액은 : "+amount+"원 입니다.");
			IMP.init('imp65452177');
		IMP.request_pay({
      pg : 'kakaopay', // 결제방식
       pay_method : 'card',	// 결제 수단
       merchant_uid : uid+"skdj348u2j",
      name : '주문명: 결제 테스트',	// order 테이블에 들어갈 주문명 혹은 주문 번호
       amount : amount,	// 결제 금액
       buyer_email : '12333',	// 구매자 email
      buyer_name :  '1233333',	// 구매자 이름
       buyer_tel :  '12333',	// 구매자 전화번호
       buyer_addr :  '123123333',	// 구매자 주소
       buyer_postcode :  '123123333',	// 구매자 우편번호
       m_redirect_url : '/payFinished'	// 결제 완료 후 보낼 컨트롤러의 메소드명
   }, function(rsp) {
	if ( rsp.success ) { // 성공시
		console.log(rsp);
		var msg = '결제가 완료되었습니다.\n';
		/*msg += '고유ID : ' + rsp.imp_uid;
		msg += '상점 거래ID : ' + rsp.merchant_uid;*/
		msg += '결제 금액 : ' + rsp.paid_amount + "원";
		/*msg += '카드 승인번호 : ' + rsp.apply_num;*/
		var sendData = {"prnum":uid,"useremail":useremail};
		alert(msg);
		$.ajax({
			type:"POST",
			dataType:"text",
			contentType:"application/json;charset=UTF-8",
			data: JSON.stringify(sendData),
			url:"/payFinished",
			success:function(data){
			}
		})
	} else { // 실패시
		var msg = '결제에 실패하였습니다.';
		msg += '에러내용 : ' + rsp.error_msg;
		alert(msg);
	}
});
		}	
	});
});
	/* {
		//가맹점 식별코드
		var name = $('#name').val();
		var amount = $('#amount').val();
		var tel = $('#tel').val();
		var uid = $('#uid').val();

		IMP.init('imp65452177');
		IMP.request_pay({
			 pg : 'kakaopay',
		    pay_method : 'card', //생략 가능
		    merchant_uid: "order_no_2342340001", // 상점에서 관리하는 주문 번호
		    name : '주문명:결제테스트',
		    amount : 14000,
		    buyer_email : 'iamport@siot.do234234',
		    buyer_name : '구매자이름234234',
		    buyer_tel : '010-1234-56782342342',
		    buyer_addr : '서울특별시 강남구 삼성동4234234',
		    buyer_postcode : '123-452342346'
		}, function(rsp) {
			if(rsp.success){
				$.ajax({
					url:"/payFinished",
					type : "post",
					data : {
						imp_uid : rsp.imp_uid
					}
				}).done(function(data){
					if(everythings_fine){
						var msg="결제가 완료되었습니다.";
						msg += '\n고유ID : ' + rsp.imp_uid;
		    			msg += '\n상점 거래ID : ' + rsp.merchant_uid;
		    			msg += '\결제 금액 : ' + rsp.paid_amount;
		    			msg += '카드 승인번호 : ' + rsp.apply_num;
						alert(msg);
					}else{
						alert("결제가 제대로 결제되지 않았습니다.");
						
					}
				});
			}else{
				var msg="결제에 실패했습니다.";
				msg+="에러내용 : "+rsp.error_msg;	
				
				alert(msg);
				console.log(msg);
			}
			
			
			/*$.ajax({
				type: "POST",
				url: "/verifyIamport/" + rsp.imp_uid,
				dataType:"json",
				success:function(data){
					alert(JSON.stringify(data));
					//값 들어오는거 확인함
					var uid=data.response.amount;
				}
			}).done(function(data) {
				console.log("done")
				console.log(data);

				if (rsp.paid_amount == data.response.amount) {
					alert("결제 및 결제검증완료");

					asdfjasdflgjsd;flgjsdf	asdf
					
				} else {
					alert("결제 실패");
				}
			});*/
			/*console.log(rsp);
			$.ajax({
				type: "POST",
				url: "/verifyIamport/" + rsp.imp_uid,
				success:function(data){
					
					alert(JSON.stringify(data));
				}
			}).done(function(data) {
				console.log(data);

				if (rsp.paid_amount == data.response.amount) {
					alert("결제 및 결제검증완료");
					
					
				} else {
					alert("결제 실패");
				}
			});*/
			/*if (rsp.success) {
				$.ajax({
					url: "/payFinished",
					method: "POST",
					headers: { "Content-Type": "application/json" },				
					data : {
						merchant_uid : rsp.merchant_uid,
						name : rsp.name
					}
					
				}).done(function(data){
					console.log("결제성공하셨습니다.");
					console.log(data);
				})
			} else {
				var msg = '결제에 실패하였습니다.';
				msg += '에러내용 : ' + rsp.error_msg;
			}
			alert(msg);*/
			

/*		});
	});
});

$(document).ready(function() {
	$('#charge').click(function() {
		IMP.init('imp65452177');
		var money = $('#chargeByMoney option:selected').val();

		//확인
		/*console.log(money);*/
		/*IMP.request_pay({
			pg: 'kakao',
			merchant_uid: 'merchant_' + new Date().getTime(),

			name: '주문명 : 주문명 설정',
			amount: money,
			buyer_email: 'iamport@siot.do',
			buyer_name: '구매자이름',
			buyer_tel: '010-1234-5678',
			buyer_addr: '인천광역시 부평구',
			buyer_postcode: '123-456'
		}, function(rsp) {
			console.log(rsp);
			if (rsp.success) {
				var msg = '결제가 완료되었습니다.';
				msg += '고유ID : ' + rsp.imp_uid;
				msg += '상점 거래ID : ' + rsp.merchant_uid;
				msg += '결제 금액 : ' + rsp.paid_amount;
				msg += '카드 승인번호 : ' + rsp.apply_num;
				$.ajax({
					type: "GET",
					url: "/charge", //충전 금액값을 보낼 url 설정
					data: {
						"amount": money
					},
				});
			} else {
				var msg = '결제에 실패하였습니다.';
				msg += '에러내용 : ' + rsp.error_msg;
			}
			alert(msg);
		});

	});
});
*/

/*$(document).ready(function() {

	$('.funding1').click(function() {
		var name = $('#name').val();
		var amount = $('#amount').val();
		var tel = $('#tel').val();

		console.log(name);
		console.log(amount);
		console.log(tel);
	});
})*/