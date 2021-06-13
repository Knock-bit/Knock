<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<c:set var="contextPath" value ="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>현재 진행중인 캠페인</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>

$(function(){
	fnAjax();
	$("#cdetail").click(function(){
		$("#popup").fadeIn();
	})
	
    $("#popup").click(function(){
        $("#popup").fadeOut();
    });    

});


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
	}
	.indan {
		margin:0 auto;
		width:90%;
		height:600px;
        text-align: center;
	}
	.topdan4 {
		width:28%;
		height:400px;
		justify-content: center;  
        margin : 5px;
        display: inline-block;
	}
	.cpInfo {
		width:100%;
		height:400px;
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
	.textarea {
		width: 80%;
		height:200px;
		display: inline-block;
		border : 1px solid black;
	}
    .DivTop {
        text-align: left;
    }
    .ingKeyword {
        font-size: 13px;
    }

	.ingEmblem{
		width:80px;
		height: 80px;
		border-radius: 50%;
		border : solid 1px black;
		overflow: hidden;
		display: flex;
		align-items: center;
		justify-content: center;
		margin: 0 auto;
	}
	
	#popup {
    display: none; /*숨기기*/
    position: fixed;
    width: 80%;
    height: 70%;
    background: rgba(0,0,0,0.5);
    top : 100px;
}

	#popmenu {
	    position: absolute;
	    top : 180px;
	    left: 50%;
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
	#camidx{
		display:none;
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
		
		
			<div class="topdan">
				<div class="indan">
<script type="text/javascript">
function fnAjax(){
	console.log("-- fnAjax() 실행");
	
	let user_idx = 1;
	$.ajax("${contextPath }/userctr?type=campaigning.do",{
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
		htmlTag += "<div class='topdan4'><div class='cpInfo'>";
		htmlTag += "<div class='imgarea'>";
		htmlTag += "<img src='#'></div>";
		htmlTag += "<div class='textarea'><div class='eftDiv'><div class='DivTop'>";
		htmlTag += "<li>" + this.title +"</li>";
		htmlTag += "<li>[카테고리]" + this.c_category_name +"</li></div>";
		htmlTag += "<div class='middleDiv'>";
		htmlTag += "<div class='ingEmblem'>";
		htmlTag += "<img src='/image/think-green.png'></div>";
		htmlTag += "<div class='ingKeyword'>#캠페인 #제로웨이스트 #포인트</div></div>"
		htmlTag += "<div class='bottomDiv'>";
		htmlTag += "<div class='etime'>마감일:"+this.end_date+"</div>"; // 마감날짜가져와서 전달 
		htmlTag += "</div></div>";
		htmlTag += "<input type='button' value='상세보기'";
		htmlTag += "id='cdetail' onclick='poppop()'>";
		htmlTag += "<div id='camidx'>"+this.campaign_idx+"</div>"
		htmlTag += "</div></div></div>";
	});
	$topdan.html(htmlTag);

}

function fnAjaxError(jqXHR, textStatus, errorThrown){
	alert("Ajax 처리 실패 : \n"
			+ "jqXHR.readyState : " + jqXHR.readyState + "\n"
			+ "textStatus : " + textStatus + "\n"
			+ "errorThrown : " + errorThrown);
}
</script>		
				</div>		
			</div>
			<!-- <div id="popup">
				<div id="popmenu">
<script type="text/javascript">
function poppop(){
	console.log("-- poppop() 실행");
	
	let campaign_idx = 2;
	
	alert(campaign_idx);
	$.ajax("${contextPath }/userctr?type=cdetail.do",{
		type:"get",
		data:"campaign_idx="+campaign_idx,
		dataType : "json",
		success : ajaxSuccess,
		error : fnAjaxError
	
	});
}
function ajaxSuccess(data){
	console.log(data);
	$popmenu = $("#popmenu");
	$popmenu.empty();
	let htmlTag = ""; 
		htmlTag += "<div class='popImage'><div class='camPoster'>";
		htmlTag += "<img src='"+this.c_file+"'></div></div>";
		htmlTag += "<div class='popContent'>";
		htmlTag += "<table><tr><th>캠페인 이름</th>";
		htmlTag += "<td>"+this.title+"</td></tr>";
		htmlTag += "<tr><th>캠페인 주요 내용</th>";
		htmlTag += "<td>"+this.content+"</td><tr></table>";
		htmlTag += "<p id='eetime'>캠페인 종료까지 얼마 남았나요</p>";
		htmlTag += "<p>캠페인 종료 시 획득할 수 있는 예상 포인트는 "+this.c_totpoint+"입니다</p>";
		htmlTag += "</div><div class='exit'>닫기</div>";
	$popmenu.html(htmlTag);
}


function fnAjaxError(jqXHR, textStatus, errorThrown){
	alert("Ajax 처리 실패 : \n"
			+ "jqXHR.readyState : " + jqXHR.readyState + "\n"
			+ "textStatus : " + textStatus + "\n"
			+ "errorThrown : " + errorThrown);
}		

/* function poppop(){
	$("#popup").fadeIn();
} */


</script>



				
				</div> 
			</div> -->
			<div id="countdown">
			</div>
		</div>
	</div>
	<%@ include file="/common/footer.jsp" %>
</div>

</body>
</html>