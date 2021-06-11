<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 나의 종료된 캠페인 목록</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>

</script>
<style>
	
    .view {
        width: 100%;
    }
    .endcampaign_text{
        width:100%;
        height:50px;
    }
    .endList {
        width: 100%;
        height:400px;
    }
    .pagingNum {
        width: 100%;
        height:150px;
    }
    .topdan{
        width:100%;
        height:600px;
        text-align: center;
    }
    .board {
    	text-align:center;
    	width : 80%;
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
		<div class="endCamBoard">
			<div class="view">
			    <div class="endcampaign_text">
			        <h2 style="text-align: center;">내가 참여했던 캠페인 리스트(종료)</h2>
			    </div>
			    <div class="endList">
			        <table class="board">
			            <thead>
			                <tr class="title">
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
			                    <c:forEach var="vo" items="${cclist }" varStatus="voNum">
			                    <tr>
			                        <td>${voNum.count }</td>
			                        <td>${vo.c_category }</td>
			                        <td>
			                            <a href="/endCamView.jsp?campaign_idx=${vo.campaign_idx }&cPage=nowpage">${vo.title }</a>
			                        </td> 
			                        <td>${vo.end_date }</td>
			                    </tr>
			                    </c:forEach>
			                </c:if>
			            </tbody>
					</table>
				</div>		
			        
			    <div class=pagingNum>
			    <table>
					<tr>
						<td colspan="4">
							<ol class="paging">
							<c:if test="${pvo.beginPage == 1 }">
								<li class='disable'>이전으로</li>
							</c:if>
							<c:if test="${pvo.beginPage != 1 }">
								<li>
									<a href="list.jsp?cPage=${pvo.beginPage-1 }">이전으로</a> <!-- 현재페이지에서 -1페이지 -->
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
										<a href="list.jsp?cPage=${pageNo }">${pageNo }</a>
									</li>
								</c:otherwise>
								</c:choose>
							</c:forEach>		
							<%-- [다음으로] 사용여부 처리 --%>
							<c:if test="${pvo.endPage >= pvo.totalPage }">
								<li class="disale">다음으로</li>
							</c:if>
							<c:if test="${pvo.endPage < pvo.totalPage }">
								<li><a href="list.jsp?cPage=${pvo.endPage +1 }">다음으로</a></li>
							</c:if>
							
							
							</ol>
						</td>
						<td>
							<input type="button" value="글쓰기" onclick="javascript:location.href='write.jsp'">
						</td> 
					</tr>
					</table>
			    </div>
			</div>

		</div>
	</div>
	<%@ include file="/common/footer.jsp" %>
</div>

</body>
</html>