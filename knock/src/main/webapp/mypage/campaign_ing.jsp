<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>현재 진행중인 캠페인</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>

$(function(){
	fnAjax();
    $(".rightDivTop").click(function(){
        $("#popup").fadeIn();
    });
    $("#popup").click(function(){
        $("#popup").fadeOut();
    });

});



function moveDetail (campaign_idx) {
	location.href="/userctr?type=detail.do&campaign_idx="+campaign_idx;
	poppop();
	
}
function poppop(){
	$("#popup").fadeIn();
}

</script>

<style>
	.cpingView{
		width:80%;
		float:left;
		
		
	}
	.topdan  {
		width:100%;
		height:500px;
		padding: 30px;
		text-align : center;
	}
	

	.topdan4 {
		width:15%;
		height:300px;
		float: left;
		margin: 3px;
		justify-content: center;  
	}
	.cpInfo {
		width:100%;
		height:300px;
		border : 1px solid black;
		text-align: center;
		padding-top: 10px;
	}
	.imgarea {
		width: 80%;
		height:150px;
		display: inline-block;
		border : 1px solid black;
	}
	.leftDiv, .rightDiv {
		float: left;
		width:49%;
		height : 200px;
	}
	.rightDivTop{
		width:80px;
		height: 80px;
		border-radius: 50%;
		border : solid 1px black;
		overflow: hidden;
		display: flex;
		align-items: center;
		justify-content: center;
		margin: 5px;
	}
	.rightDivTop img {
		width: 100%;
		height:auto;
		opacity: 1;
		
	}
	.rightDivbottom {
		font-size: 13px;
	}
	
	#popup {
    display: none; /*숨기기*/
    position: fixed;
    width: 80%;
    height: 70%;
    background: rgba(0,0,0,0.5);
}

#popmenu {
    position: absolute;
    left: 50%;
    top: 50%;
    transform: translate(-50%,-50%);
    width: 80%;
    height: 300px;
    text-align: center;
    background: #fff;
}

.exit {
    position: absolute;
    left: 50%;
    bottom: 10px;
    transform: translate(-50%,0);
    width: 60px;
    height: 30px;
    text-align: center;
    line-height: 30px;
    background: #007AAE;
    cursor: pointer;
}

.popImage{
	float:left;
	width:29%;
	height:300px;
}
.popContent {
	float:left;
	width:70%;
	height:300px;
}
.camPoster {
	width: 70%;
	height:250px;
	display : inline-block;
	margin-top:30px;
	
	overflow: hidden;
	align-items: center;
	justify-content: center;

}
.camPoster img {
	width: 100%;
	height:auto;
	opacity: 1;
}
.popContent th {
	margin-left:10px;
	text-align:left;
}
.popContent {
	text-align : left;
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
		<div class="cpingView">
		<div id="popup">
			<div id="popmenu">
				<div class="popImage">
					<div class="camPoster">
						<img src="/image/poster.jpg">
					</div>
				</div>
				<div class="popContent">
					<table>
						<tr>
							<th>캠페인 이름</th>
							<td>${ccvo.title }</td>
						</tr>
						<tr>
							<th>캠페인 주요 내용</th>
							<td>${ccvo.content }</td>
						</tr>
					</table>
							<p>캠페인 종료까지 000남았습니다.</p>
							<p>캠페인 종료시 획득할 수 있는 예상 포인트는 ${ccvo.c_totpoint }포인트입니다.</p>
							<p>이번 캠페인 참여 횟수는 00회 입니다.</p>

				</div>
				<div class="exit">닫기</div>
			</div> 
		</div>
		
			<div class="topdan">
<script type="text/javascript">


function fnAjax(){
	console.log("-- fnAjax() 실행");
	
	let user_idx = 1;
	$.ajax("/userctr?type=campaigning.do",{
		type:"get",
		data:"user_idx="+user_idx,
		dataType : "json",
		success : ajaxSuccess,
		error : fnAjaxError
	
	});
}

function ajaxSuccess(data){
	console.log(data);
	$topdan = $(".topdan");
	$topdan.empty();
	let htmlTag = ""; 
	$.each(data, function(){
		htmlTag += "<div class='indan'><div class='topdan4'><div class='cpInfo'>";
		htmlTag += "<div class='imgarea'>";
		htmlTag += "<img src='#'></div>";
		htmlTag += "<div class='textarea'><div class='eftDiv'><div class='leftDivTop'>";
		htmlTag += "<h4>" + this.title +"</h4>";
		htmlTag += "<p>" + this.c_category +"</p></div>";
		htmlTag += "<div class='leftDivbottom'>";
		htmlTag += "<span class ='expiredDate'>남은기한</span>"; // 남은기한 넣을 div
		htmlTag += "<div class='etime'>"+this.end_date+"</div>"; // 마감날짜가져와서 전달 
		htmlTag += "<p id='countCamp'></p></div></div>";
		htmlTag += "<div class='rightDiv'>";
		htmlTag += "<div class='rightDivTop'>";
		htmlTag += "<img src='/image/think-green.png'></div>";
		htmlTag += "<div class='rightDivbottom'>#캠페인 #제로웨이스트 #포인트</div></div></div>";
		htmlTag += "<input type='button' value='상세보기'";
		htmlTag += "onclick='moveDetail("+this.campaign_idx+")'";
		htmlTag += "</div></div></div>";
	});
	$topdan.html(htmlTag);
	
	
	 var data = $(".etime");
	console.log(data);//함수호출
	
	$.each(data, function(){
		console.log($(this).text());
		var ttt = $(this).text();
		countCampaign(ttt, 'expiredDate');
	});
		
	
	
	
	// 동작하는 상태로 만들고 나서 코드 추가
	
	

}

function countCampaign(dt, className){

	var end = new Date(dt);
	
	var _second = 1000;
	var _minute = _second*60;
	var _hour = _minute*60;
	var _day = _hour*24;
	var timer;
	
	function showRemaining() {
		var now = new Date();
		var distance = end-now;
		console.log(distance);
		if(distance < 0) {
			clearInterval(timer);
			document.getElementByClassName(className).innerHTML = "완료!";
			return;
		}
		var days = Math.floor(distance / _day);
		var hours = Math.floor((distance % _day) / _hour);
		var minutes = Math.floor((distance % _hour) / _minute);
		var seconds = Math.floor((distance % _minute) / _second);
		
		document.getElementByClassName(className).innerHTML = days + '일' + hours + '시간 ' + minutes  + '분 ' + seconds + '초';
		// className에 담긴 것들은 요소들이기 때문에 담겨져 있는 것을 반복문을 사용하여 출력한다.
		// 클래스명을 호출해서 반복문 처리.....
	}
	timer = setInterval(showRemaining, 1000);
	
}

function fnAjaxError(jqXHR, textStatus, errorThrown){
	alert("Ajax 처리 실패 : \n"
			+ "jqXHR.readyState : " + jqXHR.readyState + "\n"
			+ "textStatus : " + textStatus + "\n"
			+ "errorThrown : " + errorThrown);
}



</script>				
			</div>
			<div id="countdown">
			</div>
		</div>
	</div>
	<%@ include file="/common/footer.jsp" %>
</div>

</body>
</html>