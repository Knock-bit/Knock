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

<script type="text/javascript">
	
	
	function updateMyInfo(frm){
		frm.action ="userctr?type=updateMyInfoBtn.do";
		frm.submit();
		
	}

</script>
<style>
    .fullmain {width: 100%; height: 100%;}
    .mainmenu  {width: 100%; height :88%;}
	.photobox {float:left; width:30%;}
	.myInfo {float:left;  width:60%; margin-left:20px;}
	.myInfo th {text-align : left; width:30%;}
	.myInfo td {text-align: left;}
    .mainview {float: left; width:50%; padding: 20px; text-align: center; height: 30%;}
    .MycampainMain {float: left; width: 40%; padding: 0px 5px 0px 10px;height: 30%;}
    .MycampainMain > h3 {text-align: center;}
    .MycampainMain li {margin-left : 20px;}
    .MycampainMain p {float: right;}
	.myInfomain-top {border-bottom:solid 1px black;}
    .myInfomain-top, .myInfomain-bottom {height :40%; width: 83%; margin:0; float: right;}
    .emblemZone {width: 70%;}
    .treeimage, .myStatus {float: left;}
    .treeimage {width: 60%;}
    .treeimage img {width:60%; height: auto;}
    .emblemZone, .pointZone { float: left;}
    .pointZone { width:29%; height:500px; position:relative;}
    .pointbar {whdth : 80%; height:80%; 
    -ms-transform: rotate(90deg); 
    -webkit-transform: rotate(90deg); 
    transform: rotate(270deg);
   	}
  
    .pointbar progress {width:80%; height:100px;}

</style>
</head>
<body>
<div class="fullmain">
     <%@ include file="/common/topmenubar.jsp" %>
    <div class="mainMenu">
         <%@ include file="/common/mypageMenubar.jsp" %>
        <div class="myInfomain-top">
            <div class="mainview">
                <div class="photobox">
                    <!--사진 들어가는 곳-->
                    <div class="myPhoto">
                        <img id="myprofilPhoto" src="${vo.user_img}" width="120" height="150">
                    </div>

                </div>
                <div class="myInfo">
                    <table>
                        <tr>
                            <th>이름</th>
                            <td>${vo.name }</td>
                        </tr>
                        <tr>
                            <th>닉네임</th>
                            <td>${vo.nickname }</td>
                        </tr> 
                        <tr>
                        <fmt:formatDate var="myBirth" value="${vo.birth}" pattern="yyyy.MM.dd"/>
                            <th>생년월일</th>
                            <td>${myBirth } </td>
                        </tr>
                        <tr>
                            <th>핸드폰</th>
                            <td>${vo.phone }</td>
                        </tr>
                         <tr>
                            <th>이메일</th>
                            <td>${vo.email}</td>
                        </tr>	
                        <tr>
                            <th>주소</th>
                            <td>${vo.address}</td>
                        </tr>
                        <tr>
                        <fmt:formatDate var="myjoindate" value="${vo.joindate}" pattern="yyyy.MM.dd"/>
                            <th>가입일</th>
                            <td>${myjoindate}</td>
                        </tr> 
                        <tr>
                        <c:if test="${vo.gender==0 }">
                        	<c:set var="gender" value="Man"> </c:set>
                        </c:if>
                        <c:if test="${vo.gender==1 }">
                        	<c:set var="gender" value="Woman"> </c:set>
                        </c:if>
                            <th>성별</th>
                            <td>${gender }</td>
                        </tr> 
                    </table>
                </div>
            </div>
            <div class="MycampainMain">
                <h3>[ 현재 참여중인 캠페인 ]</h3>
                <ui>
                    <li>캠페인1</li>
                    <li>캠페인2</li>
                </ui>
                <p>예상 포인트 : 50점</p>
            </div>
        </div>
        <div class="myInfomain-bottom">
            <div class="emblemZone">
                <div class="treeimage">
                    <img src="image/sprout.jpeg">    

                </div>
                <div class="myStatus">
                    <h3>내 현황</h3>
                    <div>
                        <p>앰블럼 : 1개</p>
                        <p>랭킹 : 1위</p>
                    </div>
                </div>
            </div>
            <div class="pointZone">
                포인트 사용 내역
                
            </div>

        </div>
    </div>
    <%@ include file="/common/footer.jsp" %>
    
</div>
</body>
</html>