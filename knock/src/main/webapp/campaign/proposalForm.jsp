<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.List" %>
<%@ page import="com.knock.model.vo.KeywordVO" %>
<%@ page import="com.knock.model.dao.KeywordDAO" %>

<c:set var="contextPath" value ="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>campaign</title>
<script type="text/javascript">
	function goBack(){
			window.history.back();
	}
</script>
</head>
<body>	
	<%@ include file="tempinclude.jsp" %>
	<form id="campaignForm" method="post" action="${contextPath}/campaign?type=proposal">
		<table>
			<thead>
				<tr>
					<td> 캠페인 이름 </td> 
					<td> <input type="text" name="p_title" placeholder="캠페인 이름을 입력하세요 "></td>
				</tr>
			<tbody>
				<tr>
					<td> 캠페인 취지 </td> 
					<td> <input type="text" name="goal" placeholder="캠페인 취지를 입력하세요 "></td>
				</tr>
				<tr>
					<td> 목표 포인트 </td>
				
					<td> <input type="number" name="goal_point" min="2500"></td>
				</tr>
				<tr>
					<td colspan="2">
					<textarea name="p_content" cols=50 rows=20></textarea>
				</tr>
				<tr>
					<td> 키워드 : 최대 세 개까지 입력하실 수 있어요. </td>
					
					<td>
					<input type="text" name="p_keyword">
					<input type="text" name="p_keyword">
					<input type="text" name="p_keyword">
					</td>
				</tr>
				<tr>
					<td> 파일첨부 </td>
					<td>어렵다</td>
				</tr>
				
			</tbody>
		
		</table>
	
	<input type="hidden" name="user_idx" value="${user_idx }">
	<input type="submit" value="제안하기">
	<input type="button" value="취소하기" onClick="location.href='main.jsp'">
	
	</form>
	<footer class="footer py-4">
        	<%@ include file="../common/footer2.jsp" %>
           
        </footer>
</body>
   <head>
      <meta charset="utf-8">
      <title>Suggest Campaign</title>
      <!-- 구글폰트 넣어보기-->
      <link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
      <!-- STYLE CSS -->
      <link rel="stylesheet" href="${contextPath }/resources/css/proposalFormcss.css">
   </head>

   <body>

      <div class="wrapper">
         <div class="inner">
            <form id="campaignForm" method="post" action="${contextPath}/campaign?type=proposal">
               <h3>캠페인 아이디어</h3>
               <p>KNOCK!KNOCK!의 캠페인 아이디어는 모두에게 열려 있습니다.<br>다음 회차에 진행될 캠페인 아이디어를 제안해주세요.
               제안된 아이디어는 검토 후에 회원들의 펀딩 참여여부에 따라 다음회차 캠페인으로 선정됩니다.</p>
               <label class="form-group">
                  <input type="text" name="p_title" class="form-control"  required>
                  <span>캠페인 이름</span>
                  <span class="border"></span>
               </label>
               <label class="form-group">
                  <input type="number" name="goal_point" min="2500" class="form-control" required >
                  <span for="">목표 포인트(최소 2500점)</span>
                  <span class="border"></span>
               </label>
               <label class="form-group" >
                  <textarea  name="goal" id="goal" class="form-control" required></textarea>
                  <span for="">캠페인 목표</span>
                  <span class="border"></span>
               </label>
                <label class="form-group" >
                  <textarea  name="p_content" id="p_content" class="form-control" required></textarea>
                  <span for="">캠페인 취지</span>
                  <span class="border"></span>
               </label>
            
               <p id=ptag>캠페인 키워드를 입력해주세요</p>
               <label class="keyword-group ">                  
                  <input type="text" name="p_keyword" class="keyword-control"  required>&nbsp;&nbsp;&nbsp;&nbsp;
                  <span id="kwid1">키워드1</span>
                  <span class="border"></span>
                  <input type="text" name="p_keyword" class="keyword-control"  required>&nbsp;&nbsp;&nbsp;&nbsp;
                  <span id="kwid2">키워드2</span>
                  <span class="border"></span>
                  <input type="text" name="p_keyword" class="keyword-control"  required>
                  <span id="kwid3"> 키워드3</span>
                  <span class="border"></span>
               </label>
               <p id=ptag>파일첨부</p>
               <label class="form-group">
                  <input type="file" name="p_title" class="form-control"  required>                  
                  <span class="border"></span>
               </label>

               <input type="hidden" name="user_idx" value="${user_idx }">
               <button type=submit class="button">제출하기 
                  <i class="zmdi zmdi-arrow-right"></i>
               </button>
               <button type=reset onClick="location.href='main.jsp'"  class="button">취소하기 
                  <i class="zmdi zmdi-arrow-right"></i>
               </button>
            </form>
         </div>
      </div>
      
   </body> 
</html>