<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<title>감사합니다.</title>
<style>
	* {font-family:"배달의민족 주아";}
	#page {border:solid black 10px; width:700px; height:500px; margin:auto; margin-top:100px; border-radius:10px; text-align:center;}
	#endTxt {margin-top:100px; font-size:30px;}
	#pointTxt {margin-top:30px; font-size:40px;}
	#first {text-align:center; width:200px; height:100px; margin-top:100px; font-size:35px;}
	#point {color:#FF4646;}
</style>
</head>
<body>
	<div id="page">
		<div id="endTxt"><h1>참여해주셔서 감사합니다.</h1></div>
		<div id="pointTxt">총 점수 합계는  <span id="point">${param.point}</span> 점 입니다.</div>
		<input type="button" value="처음으로" id="first">
	</div>
	
	
</body>
<script>
	
	$("#first").on("click", function(){
		location.href="index";
	});
</script>
</html>