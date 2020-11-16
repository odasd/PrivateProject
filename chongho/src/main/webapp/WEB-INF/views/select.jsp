<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<title>선택</title>
<style>
	* {font-family:"배달의민족 주아";}
	#hh1 {background:black; color:white; width:1905px; height:70px; padding-top:1px;}
	#case, #case2, #case3 {border:solid black 5px; width:400px; height:400px; float:left; margin-left:170px; border-radius:10px; cursor:pointer;}
	#casePick, #casePick2, #casePick {float:left;}
	#page {width:1920px; height:410px; margin-top:30px;}
	#buttons {text}
	#case {background:white;}
	#case:hover {background:black; color:white; border:solid black 5px; width:410px; height:410px;  box-shadow: 5px 5px 5px 5px gray;}
	#case2 {background:white;}
	#case2:hover {background:black; color:white; border:solid black 5px; width:410px; height:410px;  box-shadow: 5px 5px 5px 5px gray;}
	#case3 {background:white;}
	#case3:hover {background:black; color:white; border:solid black 5px; width:410px; height:410px;  box-shadow: 5px 5px 5px 5px gray;}
	/* #btnPick, #btnPick2, #btnPick3 {height:50px; width:150px; font-size:35px;} */
	#finish {float:center; height:100px; width:200px; font-size:40px;}
	#btn1, #btn2, #btn3 {float:left; font-size:35px; text-align:center;}
	#btn1 {margin-left:300px;}
	#btn2 {margin-left:500px;}
	#btn3 {margin-left:490px;}
	#end {margin-top:150px; text-align:center;}
	.text {text-align:center; font-size:50px; margin-top:60px;}
	#chance {margin-left:1500px; height:100px; font-size:35px;}
	#point {margin-left:1500px; height:100px; font-size:20px;}
	#addPoint {font-size:20px; color:#FF4646;}
	#maxNum {margin-left:1500px; width:30px;}
</style>
</head>
<body>
	<div id="hh1"><h1 style="text-align:center;">선택해라</h1></div>
	<input type="hidden" id="chance" value="0" style="width:20px; height:15px; font-size:15px;"> / 30
	<br>
	<span id="point"></span> 점&nbsp;&nbsp;<span id="addPoint"></span>
	<br>
	<input type="hidden" id="maxNum">
	<div id="page">
		<div id="pick">
			<div id="case">
				<div class="text">
					1번<br><br>
					5% 확률로 102점<br>
					45% 확률로 22점<br>
					50% 확률로 10점
				</div>
			</div>
			<!-- <div id="casePick">
				<h5>1번</h5>
				<input type="button" value="선택" id="btnPick">
			</div> -->
		</div>
		
		<div id="pick2">
			<div id="case2">
				<div class="text">
						2번<br><br>
						33.3% 확률로 30점<br>
						33.3% 확률로 20점<br>
						33.3% 확률로 10점
				</div>
			</div>
			<!-- <div id="casePick2">
				<h5>2번</h5>
				<input type="button" value="선택" id="btnPick2">
			</div> -->
		</div>
		
		<div id="pick3">
			<div id="case3">
				<div class="text">
						3번<br><br>
						50% 확률로 23점<br>
						45% 확률로 18점<br>
						5% 확률로 8점
				</div>
			</div>
			<!-- <div id="casePick3">
				<h5>3번</h5>
				<input type="button" value="선택" id="btnPick3">
			</div> -->
		</div>
		
	</div>
	<br>
	
	<!-- <div id="buttons">
		<div id="btn1">
			1번
			<div><input type="button" value="1번 선택" id="btnPick"></div>
		</div>	
		<div id="btn2">
			2번
			<div><input type="button" value="2번 선택" id="btnPick2"></div>
		</div>
		<div id="btn3">
			3번
			<div><input type="button" value="3번 선택" id="btnPick3"></div>
		</div>
	</div> -->
	
	<br>
	<!-- <div id="end">
		<div style="font-size:30px;">없어질 예정</div>
		<input type="button" value="끝내기" id="finish">
	</div> -->
	<!-- <input type="button" id="check" value="확인"> -->
	<!-- <div>
		<input type="button" id="math" value="함수">
		<input type="text" id="txtMath">
	</div> -->
</body>
<script> 

	var random = Math.floor(Math.random() * 100) + 1;
		
	var Ch=0;
	var chance;
	var Po=0;
	var point;
	
	
	$.ajax({
		type:"get",
		url:"/maxNum",
		dataType:"json",
		success:function(data){
			$("#maxNum").val(data.maxNum);
		}  
    });
	
	
	/* $("#math").on("click", function(){
		var result = Math.floor(Math.random() * 100) + 1;
		$("#txtMath").val(result);
	}); */
	
	$("#case").on("click", function(){
		
		//선택 횟수증가
		$("#chance").val(++Ch);
		chance=$("#chance").val();
		
		var random = Math.floor(Math.random() * 100) + 1;
		//포인트 증가
		
		if(random <= 50) {
			/* alert(random+"점 "+"50 까지 / 10점"); */
			$("#point").html(Po+=10);
			point=$("#point").html();
			$("#addPoint").html("+"+10+"점");
			
			var unum=$("#maxNum").val();
			var pick=1;
			var eachPoint=10;		
			
			 $.ajax({
				type:"post",
				url:"/pickInsert.js",
				data:{"unum": unum, "pick":pick, "point":eachPoint},
				success:function(){
					
				}
			}); 
		} else if(random >= 51 && random <= 95) {
			/* alert(random+"점 "+"51부터 95 까지 / 22점"); */
			$("#point").html(Po+=22);
			point=$("#point").html();
			$("#addPoint").html("+"+22+"점");
			
			var unum=$("#maxNum").val();
			var pick=1;
			var eachPoint=22;		
			
			 $.ajax({
				type:"post",
				url:"/pickInsert.js",
				data:{"unum": unum, "pick":pick, "point":eachPoint},
				success:function(){
					
				}
			}); 
		} else if(random >= 96 && random <= 100) {
			/* alert(random+"점 "+"95부터 100 까지 / 102점"); */
			$("#point").html(Po+=102);
			point=$("#point").html();
			$("#addPoint").html("+"+102+"점");
			
			var unum=$("#maxNum").val();
			var pick=1;
			var eachPoint=102;		
			
			 $.ajax({
				type:"post",
				url:"/pickInsert.js",
				data:{"unum": unum, "pick":pick, "point":eachPoint},
				success:function(){
					
				}
			}); 
		}
		/* $("#point").html(++Po); */ //포인트 추가
		/* point=$("#point").html(); */
		
		
		if($("#chance").val()>=30) {
			location.href="thanks?point="+point;
		}
	});
	
	$("#case2").on("click", function(){
		
		//선택 횟수증가
		$("#chance").val(++Ch);
		chance=$("#chance").val();
		
		var random = Math.floor(Math.random() * 99) + 1;
		
		//포인트 증가
		if(random <= 33) {
			/* alert(random+"점 "+"33 까지 / 10점"); */
			$("#point").html(Po+=10);
			point=$("#point").html();
			$("#addPoint").html("+"+10+"점");
			var unum=$("#maxNum").val();
			var pick=2;
			var eachPoint=10;		
			
			 $.ajax({
				type:"post",
				url:"/pickInsert.js",
				data:{"unum": unum, "pick":pick, "point":eachPoint},
				success:function(){
					
				}
			}); 
		} else if(random >= 34 && random <= 66) {
		/* 	alert(random+"점 "+"34부터 66 까지 / 20점"); */
			$("#point").html(Po+=20);
			point=$("#point").html();
			$("#addPoint").html("+"+20+"점");
			var unum=$("#maxNum").val();
			var pick=2;
			var eachPoint=20;		
			
			 $.ajax({
				type:"post",
				url:"/pickInsert.js",
				data:{"unum": unum, "pick":pick, "point":eachPoint},
				success:function(){
					
				}
			}); 
		} else if(random >= 67 && random <= 99) {
			/* alert(random+"점 "+"67부터 99 까지 / 30점"); */
			$("#point").html(Po+=30);
			point=$("#point").html();
			$("#addPoint").html("+"+30+"점");
			var unum=$("#maxNum").val();
			var pick=2;
			var eachPoint=30;		
			
			 $.ajax({
				type:"post",
				url:"/pickInsert.js",
				data:{"unum": unum, "pick":pick, "point":eachPoint},
				success:function(){
					
				}
			}); 
		}
		
		//포인트 증가
		/* $("#point").html(Po+=2); */
		/* point=$("#point").html(); */
		
		if($("#chance").val()>=30) {
			location.href="thanks?point="+point;
		}
	});
	
	$("#case3").on("click", function(){
		
		//선택 횟수증가
		$("#chance").val(++Ch);
		chance=$("#chance").val();
		
		var random = Math.floor(Math.random() * 100) + 1;
		
		//포인트 증가
		if(random <= 5) {
			/* alert(random+"점 "+"5 까지 / 8점"); */
			$("#point").html(Po+=8);
			point=$("#point").html();
			$("#addPoint").html("+"+8+"점");
			var unum=$("#maxNum").val();
			var pick=3;
			var eachPoint=8;		
			
			 $.ajax({
				type:"post",
				url:"/pickInsert.js",
				data:{"unum": unum, "pick":pick, "point":eachPoint},
				success:function(){
					
				}
			}); 
		} else if(random >= 6 && random <= 50) {
			/* alert(random+"점 "+"6부터 50 까지 / 18점"); */
			$("#point").html(Po+=18);
			point=$("#point").html();
			$("#addPoint").html("+"+18+"점");
			var unum=$("#maxNum").val();
			var pick=3;
			var eachPoint=18;		
			
			 $.ajax({
				type:"post",
				url:"/pickInsert.js",
				data:{"unum": unum, "pick":pick, "point":eachPoint},
				success:function(){
					
				}
			}); 
		} else if(random >= 51 && random <= 100) {
			/* alert(random+"점 "+"51부터 100 까지 / 23점"); */
			$("#point").html(Po+=23);
			point=$("#point").html();
			$("#addPoint").html("+"+23+"점");
			var unum=$("#maxNum").val();
			var pick=3;
			var eachPoint=23;		
			
			 $.ajax({
				type:"post",
				url:"/pickInsert.js",
				data:{"unum": unum, "pick":pick, "point":eachPoint},
				success:function(){
					
				}
			}); 
		}

		/* $("#point").html(Po+=3); */
		/* point=$("#point").html(); */
		
		if($("#chance").val()>=30) {
			location.href="thanks?point="+point;
		}
	});
	
	/* $("#finish").on("click", function(){
		alert("참여해주셔서 감사합니다.");
		location.href="thanks";
	}); */
	$("#check").on("click", function(){
		alert(Ch);
	});
	
</script>
</html>