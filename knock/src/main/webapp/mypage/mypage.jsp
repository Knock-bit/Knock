<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<c:set var="contextPath" value ="${pageContext.request.contextPath }"/>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<script src="${contextPath }/resources/js/scripts.js" crossorigin="anonymous"></script>
<!-- Google fonts-->
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
<link href="https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700" rel="stylesheet" type="text/css" />
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
<!-- Core theme CSS (includes Bootstrap)-->
<link href="${contextPath }/resources/css/styles.css" rel="stylesheet" />

<link href="${contextPath }/mypage/mypage.css" rel="stylesheet" />
<script src="http://code.jquery.com/jquery-latest.min.js"></script>


<script type="text/javascript">
	function updateMyInfo(frm){
		frm.action ="userctr?type=updateMyInfoBtn.do";
		frm.submit();
		
	}
</script>
<style>
    
</style>
</head>
<body>
<div class="fullmain">
     <%@ include file="/common/topmenubar.jsp" %>
    <div class="mainMenu">
         <%@ include file="/common/mypageMenubar.jsp" %>
        <div class="myInfomain-top">
            <div class="mainview">
            	<p class="profile">[ PROFILE ]</p>
                <div class="photobox">
                    <!--사진 들어가는 곳-->
                    <div class="myPhoto">
                        <img id="myprofilPhoto" src="${user.user_img}" width="120" height="150">
                    </div>

                </div>
                
                <div class="myInfo">
                    <table>
                        <tr>
                            <th>이름</th>
                            <td>${user.name }</td>
                        </tr>
                        <tr>
                            <th>닉네임</th>
                            <td>${user.nickname }</td>
                        </tr> 
                        <tr>
                        <fmt:formatDate var="myBirth" value="${user.birth}" pattern="yyyy.MM.dd"/>
                            <th>생년월일</th>
                            <td>${myBirth } </td>
                        </tr>
                        <tr>
                            <th>핸드폰</th>
                            <td>${user.phone }</td>
                        </tr>
                         <tr>
                            <th>이메일</th>
                            <td>${user.email}</td>
                        </tr>	
                        <tr>
                            <th>주소</th>
                            <td>${user.address}</td>
                        </tr>
                        <tr>

                        <fmt:formatDate var="myjoindate" value="${user.joindate}" pattern="yyyy.MM.dd"/>
                            <th>가입일</th>
                            <td>${myjoindate}</td>
                        </tr> 
                        <tr>

                        <c:if test="${user.gender==0 }">
                        	<c:set var="gender" value="Man"> </c:set>
                        </c:if>
                        <c:if test="${user.gender==1 }">
                        	<c:set var="gender" value="Woman"> </c:set>
                        </c:if>
                            <th>성별</th>
                            <td>${gender }</td>
                        </tr> 
                        <tr>
                        <fmt:formatDate var="myjoindate" value="${user.joindate}" pattern="yyyy.MM.dd"/>
                            <th>가입일</th>
                            <td>${myjoindate}</td>
                        </tr> 
                        
                    </table>
                </div>
            </div>
            <div class="MycampainMain">
                <p class="nowCamp">[ MY CAMPAIGN ]</p>
                <div class="nowCampList">
                	<c:forEach var="cam"  items="${clist }" varStatus="cNum">
	                    <li id="activeList">${cNum.count}. &nbsp;&nbsp;&nbsp;${cam.title}</li>
                    </c:forEach>
                </div>       
                <p id="prePoint">획득 예상 포인트 : 50점</p>
            </div>
        </div>
        <div class="myInfomain-bottom">
            <div class="emblemZone">
            	<p class="myEmblems">[ MY EMBLEM / STATUS]</p>
                <div class="treeimage">
                    <img src="image/sprout.jpeg">    
                </div>
                <div class="myStatus">
                    <div id="countEmb">
                        <p>▶ EMBLEM : ${emblemCount }개</p>
                        <div id="embImgZone">
                        	<c:forEach var="eImg" items="${clist }">
                        		<div id="embImg">
                        			<img src="${eImg.emblem }">
                        		</div>
                        	</c:forEach>
                        </div>
                    </div>
                    <div id="rank">
                        <p>▶ RANK : ${rank }위</p>
                    </div>
                </div>
            </div>
            <div class="pointZone">
            <p class="pointRecord">[ MY POINT ]</p>
                <div class="ppp">
                	<div id="pointBar">
                		<p id="usedPointBar" style="height:${user.used_point/user.total_point*100}%;">${user.used_point }</p>
                	</div>
                	<div id="pointBar">
                		<p id="remainsPointBar" style="height:${100-(user.used_point/user.total_point*100)}%;">${user.total_point - user.used_point }</p>
                	
                	</div>
                	<div id="pointBar">
                		<p id="allPointBar"style="height:100%;">${user.total_point }</p>
                		
                	</div>

                </div>
                <div class="pText">
                	<p>사용포인트</p>
                	<p>보유포인트</p>
                	<p>총 포인트</p>
                </div>
                
            </div>

        </div>
    </div>
    <%@ include file="/common/footer.jsp" %>
    
</div>
</body>
</html>