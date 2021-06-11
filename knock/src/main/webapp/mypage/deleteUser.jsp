<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지에용</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
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
        frm.action="/userctr?type=deleteUser.do";
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
		width:10%;
		height:7vh;
	}

</style>
</head>
<body>
<div class="fullmain">
	 <%@ include file="/common/topmenubar.jsp" %>
	 <div class="mainMenu">
	 	<%@ include file="/common/mypageMenubar.jsp" %>
        <div class="deleteView">
            <div>
                <p>[ 탈퇴 전 꼭 읽어주세요 ]</p>
                <ul>
                    <li>회원탈퇴를 신청하시면 바로 로그아웃 됩니다.</li>
                    <li>보유하고 있던 포인트는 모두 삭제됩니다.</li>
                    <li>탈퇴 후에는 기존에 작성된 글 삭제가 되지 않으니, 삭제를 원하는 글이 있으면 삭제 후 탈퇴해주세요.</li>
                    <li>모든 개인 정보는 탈퇴 이후 바로 삭제됩니다.</li>
                </ul>
            </div>
            <hr>
            <div>
                <p>아이디</p>
                <p>${vo.user_id}</p>
            </div>
            <div>
                <p>누적포인트</p>
                <p>${vo.total_point}</p>
            </div>
            <div>
                <p>탈퇴사유</p>
                <form method="post">
                	<input type="hidden" name="user_id" value="${vo.user_id }">
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
                    <label for="etc">기타</label><br>
                    <textarea id="etc" name="etc" rows="5" cols="33"></textarea><br><br>
                    
                    <!-- 탈퇴전 비밀번호 확인 -->
                    
                    <label>비밀번호를 입력해주세요.</label><br>
                    <input type="password" id="ckpwd" name="checkPwd" >
                    <input class="ckpwdBtn" type="button" value="비밀번호 확인">
                    <span class="successPwd"></span><br><br>
                    
                    
                    <input class="delBtn" type="button" value="탈퇴하기" onclick="deleteUser(this.form)" disabled="disabled">
                </form>
            </div>

        </div>
	 </div>
	<%@ include file="/common/footer.jsp" %>

</div>

</body>
</html>