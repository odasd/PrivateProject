<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<title>Manager_Page</title>
<style>
	body {border:solid black 3px; padding-bottom:30px; margin:30px; border-radius:5px;}
	#page {width:100%; height:550px; margin:auto;}
	#tbl {cursor:pointer; margin:auto; float:left; text-align:center; border-collapse: collapse;}
	#tbl2 {cursor:pointer; margin:auto; float:left; text-align:center; border-collapse: collapse;}
	h1 {text-align:center; background:black; color:white; margin-right:20px; margin-left:20px; padding-top:20px; padding-bottom:20px;}
	#home {text-align:center; margin-top:100px;}
	#btnhome {width:200px; height:50px; font-size:25px;}
	#btnhome:hover {background:black; color:white; cursor:pointer;}
	/* #tbljson {cursor:pointer; margin:auto; float:left; text-align:center;} */
	#tbljson2 {margin:auto; float:left; text-align:center; border-collapse: collapse;}
	#tblAll {margin-left:70px;}
	/* #pagination {float:center; margin:auto; text-align:center;} */
	#pagination {/* margin-left:140px; */ margin-left:4%;}
	.active {background-color:#FF4646; color:#FFFFFF;}
	#pagination a{color:black; padding:3px; text-decoration:none; border:1px solid #FF4646; width:15px; border-radius:5px;}
	#pagination a:hover, #pagination a:focus {color:#fff; border:1px solid #FF4646; background-color:#FF4646;}
	#totalCount {margin-left:70px; background:black; color:white; width:182px; padding:10px; text-align:center; border-radius:10px 10px 0px 0px;}
	#tblbottom {margin-left:70px; background:black; color:white; width:182px; padding:10px; text-align:center; border-radius:0px 0px 10px 10px;}
	#All {padding-top:20px; margin-left:15px;}
	/* #PP {float:left; padding:100px;}
	#txPick {width:800px; height:45px; background:gray; padding-top:20px; border:3px solid black; border-radius:5px; padding-left:20px;}
	#txPoint {width:800px; height:45px; background:skyblue; padding-top:20px; border:3px solid black; border-radius:5px; padding-left:20px;} */
</style>
</head>
<body>
	<h1>Manager Page</h1>
	<!-- <div id="home">
		<input type="button" value="HomeButton" id="btnhome">
	</div> -->
	<div id="All">
	<div id="totalCount"><b>Total Data</b> : ${pm.totalCount}</div>
<div id="page">
	<div id="tblAll">
		<table id="tbl" border=1>
					<tr>
						<th width=42>No.</th>
						<th width=75>Gender</th>
						<th width=75>Age</th>
					</tr>
				<c:forEach items="${userList}" var="vo">
					<tr class="row">
						<td class="num">${vo.num}</td>
						<td>${vo.gender}</td>
						<td>${vo.age}</td>
					</tr>
					
				</c:forEach>
		</table>
		 
		<table id="tbljson2" border=1></table>
		<script id="temp2" type="text/x-handlebars-template">
		<tr class="prow">
			<th width=42>No.</th>
			<th width=42>Pick</th>
			{{#each pointList}}
				<td width=40>{{pick}}</td>
			{{/each}}
		</tr>
		
		<tr class="row">
			<td class="num"></td>
			<th width=108>Point</th>
			{{#each pointList}}
				<td width=40>{{point}}</td>
			{{/each}}
		</tr>
		</script>
		
		
	</div>
	<!-- <br>
	<div id="PP">
		<div id="txPick">
			Pick : <span id="tPick" size=100></span>
		</div>
		
		<div id="txPoint">
			Point : <input type="text" id="tPoint" size=100>
		</div>
	</div> -->
	
</div> <!-- 여기까지가 id=page -->
	
	<div id="pagination">
        <c:if test="${pm.prev}">
            <a href="${pm.startPage-1}">◀</a>
        </c:if>
        <c:forEach begin="${pm.startPage}" end="${pm.endPage}" var="i">
            <c:if test="${pm.cri.page == i }">
                <a href="${i}" class="active">${i}</a>
            </c:if>
            <c:if test="${pm.cri.page != i }">
                <a href="${i}">${i}</a>
            </c:if>
        </c:forEach>
        <c:if test="${pm.next}">
            <a href="${pm.endPage+1}">▶</a>
        </c:if>
	</div>
	</div>
	<div id="home">
		<input type="button" value="Home" id="btnhome">
	</div>
</body>
<script>
	
/* 	$("#txPick").hide();
	$("#txPoint").hide(); */
	
	//페이징
	$("#pagination a").click(function(e) {
		e.preventDefault();
		var page = $(this).attr("href");
		location.href = "admin?page=" + page;
	});
	
	$("#home").on("click", function(){
		location.href="index";
	})
	
	
	$("#tbl").on("click", ".row", function(){
		
		$("#txPick").hide();
		$("#txPoint").hide();
		var num=$(this).find(".num").html();
		$(".row").css({background:"white"});
		$(this).css({background:"#96A5FF"});
		
		
		$.ajax({
			type:"get",
			url:"/admin.json",
			data:{"num":num},
			dataType:"json",
			success:function(data){
	           var temp2=Handlebars.compile($("#temp2").html());
	            $("#tbljson2").html(temp2(data));
	            $("#tbljson2 .row .num").html(num);
	           /*  var temp3=Handlebars.compile($("#temp3").html());
	            $("#tbljson3").html(temp3(data));
	            $("#tbljson3 .row .num").html(num); */
			}  
	    });
	});
	
	/* $("#tbljson2").on("click", ".prow button", function(){
		
	$("#txPick").show();
		var str = ""
	    var tdArr = new Array();    // 배열 선언
	    var button = $(this);
	     
	    var tr = button.parent().parent();
	    var td = tr.children();
		 
	    var pick = td.eq(3).text();
	    var pick2 = td.eq(4).text();
	    var pick3 = td.eq(5).text();
	    var pick4 = td.eq(6).text();
	    var pick5 = td.eq(7).text();
	    var pick6 = td.eq(8).text();
	    var pick7 = td.eq(9).text();
	    var pick8 = td.eq(10).text();
	    var pick9 = td.eq(11).text();
	    var pick10 = td.eq(12).text();
	    var pick11 = td.eq(13).text();
	    var pick12 = td.eq(14).text();
	    var pick13 = td.eq(15).text();
	    var pick14 = td.eq(16).text();
	    var pick15 = td.eq(17).text();
	    var pick16 = td.eq(18).text();
	    var pick17 = td.eq(19).text();
	    var pick18 = td.eq(20).text();
	    var pick19 = td.eq(21).text();
	    var pick20 = td.eq(22).text();
	    var pick21 = td.eq(23).text();
	    var pick22 = td.eq(24).text();
	    var pick23 = td.eq(25).text();
	    var pick24 = td.eq(26).text();
	    var pick25 = td.eq(27).text();
	    var pick26 = td.eq(28).text();
	    var pick27 = td.eq(29).text();
	    var pick28 = td.eq(30).text();
	    var pick29 = td.eq(31).text();
	    var pick30 = td.eq(32).text();

	    td.each(function(i){	
			tdArr.push(td.eq(i).text());
		});
		
	    //배열로 출력할때
		console.log("배열에 담긴 값 : "+tdArr);
		$("#tPick").html(tdArr);
		
		str += pick + pick2 + pick3 + pick4 + pick5 + pick6 + pick7 + pick8 + pick9 + pick10
		 + pick11 + pick12 + pick13 + pick14 + pick15 + pick16 + pick17 + pick18 + pick19 + pick20
		 + pick21 + pick22 + pick23 + pick24 + pick25 + pick26 + pick27 + pick28 + pick29 + pick30;
		
		$("#tPick").html(str);
	});
	
	$("#tbljson2").on("click", ".row button", function(){
		
		$("#txPoint").show();
		
		var str = ""
		    var tdArr = new Array();    // 배열 선언
		    var button = $(this);
		     
		    var tr = button.parent().parent();
		    var td = tr.children();
			 
		    var pick = td.eq(3).text();
		    var pick2 = td.eq(4).text();
		    var pick3 = td.eq(5).text();
		    var pick4 = td.eq(6).text();
		    var pick5 = td.eq(7).text();
		    var pick6 = td.eq(8).text();
		    var pick7 = td.eq(9).text();
		    var pick8 = td.eq(10).text();
		    var pick9 = td.eq(11).text();
		    var pick10 = td.eq(12).text();
		    var pick11 = td.eq(13).text();
		    var pick12 = td.eq(14).text();
		    var pick13 = td.eq(15).text();
		    var pick14 = td.eq(16).text();
		    var pick15 = td.eq(17).text();
		    var pick16 = td.eq(18).text();
		    var pick17 = td.eq(19).text();
		    var pick18 = td.eq(20).text();
		    var pick19 = td.eq(21).text();
		    var pick20 = td.eq(22).text();
		    var pick21 = td.eq(23).text();
		    var pick22 = td.eq(24).text();
		    var pick23 = td.eq(25).text();
		    var pick24 = td.eq(26).text();
		    var pick25 = td.eq(27).text();
		    var pick26 = td.eq(28).text();
		    var pick27 = td.eq(29).text();
		    var pick28 = td.eq(30).text();
		    var pick29 = td.eq(31).text();
		    var pick30 = td.eq(32).text();

		    td.each(function(i){	
				tdArr.push(td.eq(i).text());
			});
			
		    //배열로 출력할때
			console.log("배열에 담긴 값 : "+tdArr);
			$("#tPoint").val(tdArr);
			
			str += pick + pick2 + pick3 + pick4 + pick5 + pick6 + pick7 + pick8 + pick9 + pick10
			 + pick11 + pick12 + pick13 + pick14 + pick15 + pick16 + pick17 + pick18 + pick19 + pick20
			 + pick21 + pick22 + pick23 + pick24 + pick25 + pick26 + pick27 + pick28 + pick29 + pick30;
			
			$("#tPoint").val(str); 
	}); */
	
</script>
</html>