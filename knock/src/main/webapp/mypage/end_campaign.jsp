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
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link href="${contextPath }/mypage/end_campaign.css" rel="stylesheet" />
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>

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
		<div class="endCamBoard">
			<div class="view">
			    
				<div class="container">
				<p style="font-size:22px;">종료된 캠페인</p>
  					<p>[ Ended Campaign List ]</p>  
			         <div class="table-responsive">  
			        	<table class="table">
			            <thead>
			                <tr class="title" style="background-color:gray; color:white;" >
			                    <th class="no">NO</th>
			                    <th class="category">CATEGORY</th>
			                    <th class="ctitle">TITLE</th>
			                    <th class="end_date">END_DATE</th>
			                </tr>
			            </thead>
						<tbody>
			                <c:if test="${empty cclist }">
			                    <tr>
			                        <td colspan="4">
			                            <h2>종료된 캠페인이 없습니다.</h2>
			                        </td>
			                    </tr>
			                </c:if>
			                <c:if test="${not empty cclist }">
			                    <c:forEach var="user" items="${cclist }" varStatus="voNum">
			                    <tr>
			                        <td>${voNum.count }</td>
			                        <td>${user.c_category_name }</td>
			                        <td>
			                            <a style="text-decoration:none; color:black;" href="${contextPath}/endCamView.jsp?campaign_idx=${user.campaign_idx }&cPage=nowpage">${user.title }</a>
			                        </td> 
			                        <td>${user.end_date }</td>
			                    </tr>
			                    </c:forEach>
			                </c:if>
			            </tbody>
					</table>
					</div>
				</div>		
			        
			    <div class=pagingNum>
			    	<div class="paginging">
				    <table id="tb">
						<tr>
							<td colspan="4">
								<ol class="paging">
								<c:if test="${pvo.beginPage == 1 }">
									<li class='disable'>이전으로</li>
								</c:if>
								<c:if test="${pvo.beginPage != 1 }">
									<li>
										<a href="${contextPath}/userctr?type=endCam.do&user_idx=${user.user_idx }&cPage=${pvo.beginPage-1 }">이전으로</a> <!-- 현재페이지에서 -1페이지 -->
									</li>
								</c:if>
								<%-- 블록 내 표시할 페이지 태그 작성 --%>
								<c:forEach var="pageNo" begin="${pvo.beginPage}" end="${pvo.endPage}">
									<c:choose>
									<c:when test="${pageNo == pvo.nowPage}">
										<li class="now">${pageNo }</li>
									</c:when>
									<c:otherwise>
										<li>
											<a href="${contextPath}/userctr?type=endCam.do&user_idx=${user.user_idx }&cPage=${pageNo }">${pageNo }</a>
										</li>
									</c:otherwise>
									</c:choose>
								</c:forEach>		
								<%-- [다음으로] 사용여부 처리 --%>
								<c:if test="${pvo.endPage >= pvo.totalPage }">
									<li class="disale">다음으로</li>
								</c:if>
								<c:if test="${pvo.endPage < pvo.totalPage }">
									<li><a href="${contextPath}/userctr?type=endCam.do&user_idx=${user.user_idx }&cPage=${pvo.endPage +1 }">다음으로</a></li>
								</c:if>
								
								
								</ol>
							</td> 
						</tr>
						</table>
			    </div>
			    </div>
			</div>

		</div>
	</div>
	<%@ include file="/common/footer.jsp" %>
</div>

</body>
</html>