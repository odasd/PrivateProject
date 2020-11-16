<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<title>설명서</title>
<style>
	* {text-align:center;}
	#back {width:100px; height:50px; font-size:20px;}
	#next {width:100px; height:50px; font-size:20px;}
</style>
</head>
<body>
	<h1>설명서</h1>
	<div id="divSignUpPage">
		<br><div class="title"><b>설문조사 설명</b></div><br><br>
		<!-- <div class="checks"><input type="checkbox" id="ex_chk"> <label for="ex_chk">이용약관, 개인정보 수집 및 이용에 모두 동의합니다.</label></div><br><br> -->
		<!-- <div class="checks"><input type="checkbox" id="ex_chk1" class="ex_chk"> <label for="ex_chk1">회원약관 (필수)</label></div> -->
		<div class="text"><textarea rows="30" cols="100" readonly style="overflow:hidden;">
제 1 조 (목적)
1. 본 약관은 기업마당 사이트가 제공하는 모든 서비스(이하 "서비스")의 이용조건 및 절차, 이용자와 기업마당 사이트의 권리, 의무, 책임사항과 기타 필요한 사항을 규정함을 목적으로 합니다.

제 2 조 (약관의 효력과 변경)
1. 기업마당 사이트는 귀하가 본 약관 내용에 동의하는 경우 기업마당 사이트의 서비스 제공 행위 및 귀하의 서비스 사용 행위에 본 약관이 우선적으로 적용됩니다.
2. 기업마당 사이트는 본 약관을 사전 고지 없이 변경할 수 있고 변경된 약관은 기업마당 사이트 내에 공지하거나 e-mail을 통해 회원에게 공지하며, 공지와 동시에 그 효력이 발생됩니다.
이용자가 변경된 약관에 동의하지 않는 경우, 이용자는 본인의 회원등록을 취소 (회원탈락)할 수 있으며 계속 사용의 경우는 약관 변경에 대한 동의로 간주 됩니다.

제 3 조 (약관 외 준칙)
1. 본 약관에 명시되지 않은 사항은 전기통신기본법, 전기통신사업법, 정보통신윤리위원회심의규정, 정보통신 윤리강령, 프로그램보호법 및 기타 관련 법령의 규정에 의합니다.

제 4 조 (용어의 정의)
본 약관에서 사용하는 용어의 정의는 다음과 같습니다.
1. 이용자 : 본 약관에 따라 기업마당 사이트가 제공하는 서비스를 받는 자.
2. 가입 : 기업마당 사이트가 제공하는 신청서 양식에 해당 정보를 기입하고, 본 약관에 동의하여 서비스 이용계약을 완료시키는 행위.
3. 회원 : 기업마당 사이트에 개인 정보를 제공하여 회원 등록을 한 자로서 기업마당 사이트가 제공하는 서비스를 이용할 수 있는 자.
4. 비밀번호 : 이용자와 회원ID가 일치하는지를 확인하고 통신상의 자신의 비밀보호를 위하여 이용자 자신이 선정한 문자와 숫자의 조합.
5. 탈퇴 : 회원이 이용계약을 종료시키는 행위.
</textarea></div><br>
		<div class="btn">
			<input type="button" id="back" value="BACK"/>
			<input type="button" id="next" value="NEXT"/>
		</div>
		<br>
	</div>
</body>
<script>

	/* //각 행에있는 체크버튼을 클릭 했을 때
	$("#divSignUpPage").on("click", ".checks .ex_chk", function() {
	   var isChkAll = true;
	   $("#divSignUpPage .checks .ex_chk").each(function() {
	      if (!$(this).is(":checked")) {
	         isChkAll = false;
	      }
	   });
	   if (isChkAll) {
	      $("#divSignUpPage #ex_chk").prop("checked", true);
	   } else {
	      $("#divSignUpPage #ex_chk").prop("checked", false);
	   }
	});
	
	//전체 체크버튼을 클릭 했을때
	$("#divSignUpPage").on("click", "#ex_chk", function() {
	   if ($(this).is(":checked")) {
	      $("#divSignUpPage .checks .ex_chk").each(function() {
	         $(this).prop("checked", true);
	      });
	   } else {
	      $("#divSignUpPage .checks .ex_chk").each(function() {
	         $(this).prop("checked", false);
	      });
	   }
	}); 
	
	 $("#next").on("click",function(){
		if($("#ex_chk").is(":checked") == true) {
			location.href="/select";
	      } else {
	         alert("약관을 모두 동의해주세요!");
	         return;
	      }
	}) */
	
	$("#next").on("click", function(){
		
		var gender="${param.gender}";
		var age="${param.age}";
		
		$.ajax({
			type:"post",
			url:"/userInsert",
			data:{"gender":gender, "age":age},
			success:function(){
				
			}
		});
		location.href="select";
	});
	
	 
	$("#back").on("click", function(){
		location.href="/index";
	});
</script>
</html>