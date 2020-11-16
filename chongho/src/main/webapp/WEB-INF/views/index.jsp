<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<title>시작페이지</title>
<style>
	* {font-family:"배달의민족 주아";}
	#header {border:solid black 5px; border-radius:5px; text-align:center; height:100px; font-size:20px;}
	#content {border:solid black 5px; border-radius:5px; padding:20px; margin-top:10px; font-size:40px; text-align:center; float:center;}
	#next {margin-top:20px;}
	#divButton {margin-top:40px;}
	#divButton2 {margin-top:10px;}
	#btnSignUp {width:540px; height:40px; background:#0096ff; color:white; border:0px; outline:0px; cursor:pointer; font-weight:bold;}
	#btnCancel {width:540px; height:40px; cursor:pointer; font-weight:bold;}
</style>
</head>
<body>
	<div id="page">
		<div id="header">
			<h1>성향별 호전도 조사</h1>
		</div>
		
		<div id="content">
		<h2>확률의 신</h2>
			<h3>성별</h3>
			<input type="radio" name="txtGender" value="남자" style="font-size:17px; width:23px;height:23px" checked>남자
			<input type="radio" name="txtGender" value="여자" style="font-size:17px; width:23px;height:23px;">여자
			<br>
			<h3>나이</h3>
			<input type="text" id="txtAge" placeholder="ex)25"  style="text-align:center; width:200px; height:50px; font-size:40px;" maxlength=3>
			<br>
			<input type="button" value="다음" id="next" style="text-align:center; width:200px; height:50px; font-size:40px; float:center;">
		</div>
		<div id="divButton">
				<input type="submit" id="btnSignUp" value="회원가입완료">
			</div>
			<div id="divButton2">
				<input type="button" id="btnCancel" value="취소">
			</div>
	</div>
	<!-- <input type="button" id="check" value="확인"> -->
		
</body>
<script>
	
	$("#txtAge").focus();
	
	/* $("#check").on("click", function(){
		var radio=$("input[name=txtGender]:checked").val();
		alert(radio);
	}); */
	
	$("#next").on("click", function(){
		
		var gender=$("input[name=txtGender]:checked").val();
		var age=$("#txtAge").val();
		var ageCheck= /[^0-9]/g
		
		if($("#txtAge").val()=="") {
			alert("나이를 입력해주세요.");
		} else if($("#txtAge").val()=="관리자") {
			location.href="admin"
		} else if(ageCheck.test(age)) {
			alert("숫자만 입력해주세요.");
		    return;
		} else {
			location.href="explanation?gender="+gender+"&age="+age;
		}
	});
	
	$("#txtAge").keydown(function(key){
		if(key.keyCode==13) {
			$("#next").click();
		}
	});
	
	
</script>
</html>