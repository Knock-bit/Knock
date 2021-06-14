<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<c:set var="contextPath" value ="${pageContext.request.contextPath }"/>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 구글폰트 넣어보기-->
      <link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
        <link href="https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700" rel="stylesheet" type="text/css" />
<script>
$(function(){

	
    $(".ckpwdBtn").click(function(){
    	var pwd1 = ${vo.pwd};
    	var pwd2 = $("#ckpwd").val();
    	
		if(pwd1 != pwd2){
			$(".successPwd").html("비밀번호가 일치하지 않습니다.");
			$(".successPwd").css("color","red");
			
			
		} else {
			$(".successPwd").html("비밀번호가 일치합니다.");
			$(".successPwd").css("color","blue");
			$(".delBtn").removeAttr('disabled');
			// 상태 바꾸기 checked가 false일때 alert 넣기


		}	
    	
    });
});
	

    function deleteUser(frm){
        frm.action="${contextPath }/userctr?type=deleteUser.do";
        frm.submit();

    }
    
    


</script>
<style>
	.deleteView {
		width : 80%;
		padding : 10px;
		float:right;
	}
	.successPwd {
		font-size : 12px;
	}
	
	.delBtn {
		width:20%;
		height:7vh;
		outline : 0;
		border : 0;
		backgound-color : gray;
	}
	#delForm {
		margin : 0 auto;
		width:100%;
		padding:30px;
	
	}
	.ckpwdBtn {
		outline : 0;
		border : 0;
		backgound-color : gray;
		
	
	}

</style>
</head>
<body>
 <nav class="navbar navbar-expand-lg fixed-top navbar-dark" id="mainNav">
            <%@ include file="../common/topmenubar2.jsp" %>
        </nav>
<div class="fullmain">
	 <div class="mainMenu">
	 	<%@ include file="/common/mypageMenubar.jsp" %>
        <div class="deleteView">
            <div>
                <h2 style="font-familly:'Montserrat'; text-align:center;">[ 탈퇴 전 꼭 읽어주세요 ]</h2>
                <ul style="font-size:13px; background-color:rgb(136, 136, 136); color:black; padding:10px; list-style:none;">
                    <li>▶ 회원탈퇴를 신청하시면 바로 로그아웃 됩니다.</li>
                    <li>▶ 보유하고 있던 포인트는 모두 삭제됩니다.</li>
                    <li>▶ 탈퇴 후에는 기존에 작성된 글 삭제가 되지 않으니, 삭제를 원하는 글이 있으면 삭제 후 탈퇴해주세요.</li>
                    <li>▶ 모든 개인 정보는 탈퇴 이후 바로 삭제됩니다.</li>
                </ul>
            </div>
            <div id="delForm">
	            <div>
	                <p style="color:rgb(0, 64, 0); font-weight:bold;">아이디</p>
	                <p>${vo.user_id}</p>
	            </div>
	            <div>
	                <p style="color:rgb(0, 64, 0); font-weight:bold;">누적포인트</p>
	                <p>${vo.total_point}</p>
	            </div>
	            <div>
	                <p style="color:rgb(0, 64, 0); font-weight:bold;">탈퇴사유</p>
	                <form method="post">
	                	<div style="margin:10px 10px 20px 10px; font-size:14px;">
		                	<input type="hidden" name="user_idx" value="${vo.user_idx }">
		                    <input type="radio" name="deleteReason" value="noFunny">
		                    <label for="noFunny">재미없어요</label><br>
		                    <input type="radio" name="deleteReason" value="difficult">
		                    <label for="difficult">포인트 쌓기가 힘들어요</label><br>
		                    <input type="radio" name="deleteReason" value="busy">
		                    <label for="busy">바빠요</label><br>
		                    <input type="radio" name="deleteReason" value="notCampaign">
		                    <label for="notCampaign">마음에 드는 캠페인이 없어요</label><br>
		                    <input type="radio" name="deleteReason" value="otherSite">
		                    <label for="otherSite">더 좋은 곳을 찾았어요</label><br>
	                    </div>
	                    <label for="etc" style="background-color:rgb(0, 64, 0); color:white; width:15%; font-size:13px; padding:5px 20px 5px 20px; text-align:center;"> 남기고 싶은 메세지가 있나요? </label><br>
	                    <textarea id="etc" name="etc" rows="5" cols="33"></textarea><br><br>
	                    
	                    <!-- 탈퇴전 비밀번호 확인 -->
	                    
	                    <label style="color:rgb(0, 64, 0); font-weight:bold;">비밀번호를 입력해주세요.</label><br>
	                    <input type="password" id="ckpwd" name="checkPwd" >
	                    <input class="ckpwdBtn" type="button" value="비밀번호 확인">
	                    <span class="successPwd"></span><br><br>
	                    
	                    
	                    <input class="delBtn" type="button" value="탈퇴하기" onclick="deleteUser(this.form)" disabled="disabled">
	                </form>
	            </div>
			</div>
        </div>
	 </div>
	<%@ include file="/common/footer.jsp" %>

</div>

</body>
</html>