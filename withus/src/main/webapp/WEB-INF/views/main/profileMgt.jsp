<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%-- JSTL 버젼으로 바뀌니, import 의 번잡함 사라진다! JAVA 변수 선언도 사라진다! --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로필 수정</title>
<link href="${pageContext.request.contextPath }CSS/profileMgt.css"
   rel="stylesheet" type="text/css">

<style>
body {
   text-align: center;
}

@font-face {
   font-family: 'Pretendard-Light';
   src:
      url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Light.woff')
      format('woff');
   font-weight: 300;
   font-style: normal;
}

div, label, h1, h2, h3 {
   font-family: 'Pretendard-Light';
   font-size: 18px;
}

input {
   font-family: 'Pretendard-Light';
}

.addrBtn {
   border: 1px solid black !important;
   border-radius: 3px !important;
   width: 200px !important;
   padding-top: 5px !important;
   cursor: pointer;
}

</style>
<script language="javascript">
   function goPopup() {
      var pop = window.open("/popup/jusoPopup", "pop",
            "width=570,height=420, scrollbars=yes, resizable=yes");
   }

   function jusoCallBack(roadFullAddr, roadAddrPart1, addrDetail, jibunAddr,
         zipNo) {
      document.frm.addr.value = roadFullAddr; // 전체 도로명 주소
      document.frm.roadAddrPart1.value = roadAddrPart1; // 도로명주소 (참고항목 제외)
      document.frm.addrDetail.value = addrDetail; // 고객 입력 상세 주소
      document.frm.jibunAddr.value = jibunAddr; // 지번 정보
      document.frm.zipNo.value = zipNo; // 우편번호
   }
</script>
</head>

<script type="text/javascript">
    function pwValid() {
      var p1 = document.getElementById('password1').value;
      var p2 = document.getElementById('password2').value;
      var p3 = document.getElementById('password3').value;
      
      if(p1 == null && p2 == null) {
        return true;
      } else if( p1 != p2 ){
        alert("비밀번호가 일치 하지 않습니다");
        return false;
      }

    }
  </script>

<body>
   <header>
      <%@include file="header.jsp"%>
   </header>

   <h1 style="font-size: 28px;">프로필 관리</h1>
   <br>

   <div style="font-size: 20px;">${prc }</div>
   <br>

   <h2 style="margin-bottom: 5px; font-size: 20px;">${user.name }</h2>
   <div style="font-size: 13px;">※ 개명을 했을 경우 위드어스 문의를 이용해주세요!※</div>
   <br>
   <div>
      <form name="frm" action="profileUpdateOk" onsubmit="return pwValid()"
         method="POST">
         <br> <input type="hidden" name="email" value="${prc }">
         <div class="input-box">
         <input type="button" onClick="goPopup();" value="우편번호 검색"
            class="addrBtn" style="" />
            <label>주소 </label><br>
            <input class="input_1" type="text" name="addr" id="roadFullAddr" placeholder="주소 입력" value="${user.addr }">
            <input type="hidden" id="roadAddrPart1" name="roadAddrPart1" readonly/>
            <input type="hidden" id="addrDetail" name="addrDetail" />
            <input type="hidden" id="jibunAddr" name="jibunAddr" />
            <input type="hidden" id="zipNo" name="zipNo" readonly/>
         </div>
         <br>


         <div class="input-box">
            <label>핸드폰 번호 </label><br> <input class="input_1" type="text"
               name="phone" value="${user.phone }">
         </div>
         <br>


         <div class="input-box">
            <label>비밀번호 변경 </label> <br> <input class="input_1"
               type="password" name="password1" id="password1">
         </div>
         <br>

         <div class="input-box">
            <label>비밀번호 확인 </label><br> <input class="input_1"
               type="password" name="password2" id="password2">
            <input class="input_1" type="hidden" name="pw" id="password3"
               value="${user.pw }">
         </div>
         <br> <br> <input class="input_2" type="submit" value="수정">
      </form>
   </div>
   <br>

   <form action="deleteUser" method="POST">
      <input class="input_2" type="submit" value="회원탈퇴">
   </form>

   <br>
   <br>
   <br>

   <jsp:include page="/WEB-INF/views/main/footer.jsp"></jsp:include>

</body>
</html>