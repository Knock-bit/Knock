<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>포인트현황</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
$(function(){
	var uPoint = ${vo.used_point/vo.total_point*100};
	var ePoint = ${100-(vo.used_point/vo.total_point*100)};

	$("#uPoint").css("width",uPoint+"%");
	$("#ePoint").css("width",ePoint+"%");
	
	
});

</script>
<style>
	.pointMain {
		float : left;
		border : 1px solid black;
		width:80%;
	}
	.topdan {
		width:100%;
		border : 1px solid black;
		height :300px;
	}
	.bottomdan {
		border : 1px solid black;
		height :500px;
	}
	
	.pointGraph {
		width:100%;
		padding : 10px;
		overflow: auto;
	}
	h2 {
		text-align:center;
	}
	.point_view{
		width : 90%;
	}
	.graph {
		height : 40px;	
		margin:0 0 30px;
		
	}
	.graph span {
		display: block;
		padding: 0 10px;
		height: 30px;
		line-height: 40px;
		text-align: right;
		background: gray;
		border-top-left-radius: 0px;
		border-bottom-left-radius: 0px;
		border-top-right-radius: 40px;
		border-bottom-right-radius: 40px;
		box-sizing: border-box;
		color: #fff;
		
		
	}
	.graph.stack1 span {background: rgb(255, 63, 121); animation: stack1 2s 1;}
	.graph.stack2 span {background: rgb(255, 193, 113); animation: stack2 2s 1;}
	.graph.stack3 span {background: rgb(78, 78, 78); animation: stack3 2s 1;}
	
	

	@keyframes stack1{
		0% {width:0; color:rgba(255, 255, 255, 0);}
		40% {color:rgba(255, 255, 255, 1);}
		100%{width:${vo.used_point/vo.total_point*100}%; }
	}
	@keyframes stack2{
		0% {width:0; color:rgba(255, 255, 255, 0);}
		40% {color:rgba(255, 255, 255, 1);}
		100%{width:${100-(vo.used_point/vo.total_point*100)}%; }
	}
	@keyframes stack3{
		0% {width:0; color:rgba(255, 255, 255, 0);}
		40% {color:rgba(255, 255, 255, 1);}
		100%{width:100%; }
	}

	.bottomdan {
		height: 100vh;
		background-image: url(/image/tree2.jpeg);
		background-repeat : no-repeat;
        background-size : cover;
		
	}

	#emblem {
		width:80px;
		height:80px;
		border-radius: 50%;
		border : solid 5px black;
		overflow: hidden;
		display: flex;
		align-items: center;
		justify-content: center;
		background-color : white;

	}
	#emblem img {
		width: 100%;
		height:auto;
		opacity: 1;
	}

	.e1{
		position:relative;
		top:150px;
		left:150px;
	}
	.e2{
		position:relative;
		top:180px;
		left:450px;
	}
	.e3{
		position:relative;
		top:150px;
		left:700px;
	}
	.e4{
		position:relative;
		top:13px;
		left:190px;
	}
	.e5{
		position:relative;
		top:-250px;
		left:600px;
	}

</style>
</head>
<body>
<div class="fullmain">
	<!-- top menu bar -->
	<%@ include file="/common/topmenubar.jsp" %>
	<hr>
	<div class="mainMenu">
		<%@ include file="/common/mypageMenubar.jsp" %>
		<div class="pointMain">
		
			<div class="topdan">
				<div class="pointGraph">
					<h2 style="text-align: center;"> 포인트 현황</h2>
						<div class="point_view">
							<div class="graph stack1">
								<p>사용한 포인트</p>
								<span id="uPoint">${vo.used_point}</span>
								
							</div>
							<div class="graph stack2">
								<p>남은 포인트</p>
								<span id="ePoint">${vo.total_point-vo.used_point}</span>
								
							</div>
							<div class="graph stack3">
								<p>총 포인트</p>
								<span style="width: 100%">${vo.total_point}</span>
								
							</div>
						</div>
				</div>
			</div>
			<div class="bottomdan">
				<div id="emblem" class="e1">
					<img src="/image/think-green.png">
				</div>
				<div id="emblem" class="e2">
					<img src="/image/recycle.png">
				</div>
				<div id="emblem" class="e3">
					<img src="/image/city.png">
				</div>
				<div id="emblem" class="e4">
					<img src="/image/heart.png">
				</div>
				<div id="emblem" class="e5">
					<img  src="/image/planet-earth.png">
				</div>
                


			
			
			</div>
		</div>
	
	
	</div>
	<%@ include file="/common/footer.jsp" %>
</div>

</body>
</html>