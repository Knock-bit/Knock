<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<c:set var="contextPath" value ="${pageContext.request.contextPath }"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내정보 수정</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
$(function(){
	// 비밀번호 보기
	$("#showPwd").click(function(){
		
		var p1 = $("#pwd1");
		var p2 = $("#pwd2");

		var pwdType = p1.attr('type');
		
		if(pwdType == 'password'){
			
			p1.attr('type','text');
			p2.attr('type','text');
			$(this).val('비밀번호 숨기기');
			
		} else {
			p1.attr('type','password');
			p2.attr('type','password');
			$(this).val('비밀번호 보기');
		}
		
	});
	
	
	// 비밀번호 일치여부 확인
	$("#pwd1").keyup(function(){
		$(".successPwd").html("");

		var pv1 = $("#pwd1").val();
		var pv2 = $("#pwd2").val();
		console.log(pv1);
		console.log(pv2);
	});
	
	$("#pwd2").keyup(function(){
		if($("#pwd1").val()!=$("#pwd2").val()){
			$(".successPwd").html("비밀번호가 일치하지 않습니다.<br><br>");
			$(".successPwd").css("color","red");
		} else {
			$(".successPwd").html("비밀번호가 일치합니다.<br><br>");
			$(".successPwd").css("color","blue");
			$(".upBtn").attr("disabled",false);
			$(".insertPw").css("display","none");
		}
	});
	
	
});


    function readURL(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();
			reader.onload = function(e) {
				$('#preview').attr('src', e.target.result);
			}
			reader.readAsDataURL(input.files[0]);
		}
	}
    
    
    function submitInfo(frm){
    	frm.action="${contextPath }/userctr?type=updateMyInfo.do";
    	frm.submit();
    }

    function deleteUser(frm){
        frm.action="${contextPath }/userctr?type=deleteUserBtn.do";
        frm.submit();
    }

</script>
<style>
	.mainMenu{
		width:100%;
		height:800px;
	}
	.updateMyInfoMain {
	float:left;
	width:80%;
	height:100%;}
	.dan1  {
		width:20%;
		border : 1px solid black;
        float: left;
        height: 100%;
	}
    .dan2 {
        width:79%;
		border : 1px solid black;
        float: left;
        height: 100%;
    }
    .update_form {
    	width:100%;
    	height:100%;
    
    }
    .infoZone {
       
        float: left;
        width: 59%;
        height: 80vh;
    }
    .infoZone p {
    	width:100px;
    	margin:0 auto;
    }
    
    .infoZone input {
    	width:50%;
    	height:20px;
    	display: table; 
	  	margin-left: auto; 
	  	margin-right: auto; 
    	
    }
    .pwdbtnss {
        margin : 0 auto;
        text-align: center;
    }
    .successPwd {
        font-size: 11px;
        
    }
    #showPwd {
        width:30%;
        font-size: 11px;
        text-align: center;
    }
    
    .infoSubmit {
    	width:100%;
    	height: 20vh
    
    }
    
    .infoSubmit input{
    	height:5vh
    	
    }
    
    .photoZone {
        float: left;
        width: 39%;
        height: 80vh;
    }

    .myphoto img {
        width: 170px;
        height: 200px;
    }

</style>
</head>
<body>
<div class="fullmaain">
	<!-- top menu bar -->
	<%@ include file="/common/topmenubar.jsp" %>
	<hr>
	<div class="mainMenu">
		<%@ include file="/common/mypageMenubar.jsp" %>
		<div class="updateMyInfoMain">
			<div class="dan1">
			
			</div>
			<div class="dan2">
                <div class="update_form">
                    <form method="post" enctype="multipart/form-data">
                        <div class="infoZone">
                            <div>
                                <p>아이디</p>
                                <input type="hidden" name="user_id" value="${vo.user_id}">
                                <input type="text" name="user_id" value="${vo.user_id}" disabled="disabled" ><br><br>
                            </div>
                            <div>
                                <p>비밀번호</p>
                                <input type="password" name="pwd" id="pwd1" placeholder="비밀번호를 입력해주세요"><br>
                                <input type="password" name="ckpwd" id="pwd2" placeholder="비밀번호를 다시 입력해주세요">
                                <div class="pwdbtnss">
                                    <span class="successPwd"></span>
                                    <input id="showPwd" type="button" value="비밀번호 보기" >
                                </div>
                            </div>
                            <div>
                                <p>이름</p>
                                <input type="text" name="name" value="${user.name}" disabled="disabled"><br>

                                <p>이메일</p>
                                <input type="text" name="email" value="${user.email }"><br>

                                <p>생년월일</p>
                                <fmt:formatDate var="myBirth" value="${user.birth}" pattern="yyyy.MM.dd"/>
                                <input type="text" name="birth" value="${myBirth}" disabled="disabled"><br>

                                <p>성별</p>
                                	<c:if test="${user.gender==0 }">
			                        	<c:set var="gender" value="Man"> </c:set>
			                        </c:if>
			                        <c:if test="${user.gender==1 }">
			                        	<c:set var="gender" value="Woman"> </c:set>
			                        </c:if>
                                	<input type="text" name="gender" value="${gender}" disabled="disabled">
                            </div>
                            <br><br>
                            <div class="infoSubmit">
                                <input type="button" class="upBtn" value="정보 수정하기" onclick="submitInfo(this.form)" disabled>
                            	<p class="insertPw" style="font-size:11px; width:100%; text-align:center;">비밀번호를 입력해주세요</p>
                            </div>
                        </div>
                        <div class="photoZone">
                            <div class="myphoto">
                                
                                <img id="preview" src="${user.user_img }" width=180 height=200>
                                <input type="file" name="imageFileName" onchange="readURL(this);" >

                            
                                
                            </div>
                            <div style="width: 100%; bottom:0; position: absolute;" >
                               <input type="button" value="회원탈퇴" onclick="deleteUser(this.form)">
                            </div>

                        </div>
                        


                    </form>
                </div>
			
			
			</div>
			
		
		
		
		
		
		
		</div>

	</div>
	<%@ include file="/common/footer.jsp" %>
</div>

</body>
</html>