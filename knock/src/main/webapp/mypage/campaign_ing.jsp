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
<link href="${contextPath }/mypage/campaign_ing.css" rel="stylesheet" />

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
$(function(){
	fnAjax();
	 
});


</script>

<style>


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
	alert(${user.user_idx});
	let user_idx = ${user.user_idx};
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
	$indan = $(".indan");
	$indan.empty();
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
	$indan.html(htmlTag);

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
			<div id="countdown">
			</div>
		</div>
	</div>
	<%@ include file="/common/footer.jsp" %>
</div>

</body>
</html>