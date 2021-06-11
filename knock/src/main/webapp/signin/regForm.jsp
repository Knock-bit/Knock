<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"
    integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
    crossorigin="anonymous"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="join.js"></script>

<style>
.pwdSuccess{color:red; font-size:7px;}
.emailSuccess{color:red; font-size:7px;}
.nameSuccess{color:red; font-size:7px;}
</style>
</head>
<body>

<h2>회원가입</h2>
<form method="post" name="command" value="confirm">
         
		<label for="user_id">아이디</label><br>
		<input type="text" id = "user_id" name="user_id" maxlength="10" required> &nbsp;
        <button type="button" id="dupchk">중복확인</button><br>
		<div style="font-size: 10px; margin-left: auto; font-weight: bold;">아이디는 영문3자부터 최대 10자까지 가능합니다.(영문/숫자혼합)</div>
		</div><br>
			
		<div>
		<label>비밀번호</label><br>
		<input type="password" name="pwd" id="pwd" maxlength="16" class="pwdTest" required><br>
		<label>비밀번호 확인</label><br><input type="password" name="pwd2" id="pwd2" maxlength ="16" class="pwdTest2" required><br>
		<div style="font-size: 10px; font-weight: bold;"><br>영문숫자 + 8~16자까지 가능합니다.(영문/숫자혼합)</div>
		<div class="pwdSuccess" id="pwdSuccss"></div> 
  		</div><br>
		
		<div>
		<label>이름</label><br><input type= "text" name="name" id="name"><br>
		<div class="nameSuccess" id="nameSuccess"></div>
		</div>		
		<br>
		
		<div>
		<label>이메일</label><br><input type="text" name="email" id="email" required	> &nbsp;
		<button type="button" id="emailchk">이메일 확인</button>
		<div class="emailSuccess" id="emailSuccess"></div>
		
		</div><br>
		
		
		<label>닉네임</label><br><input type="text" name="nickname" id="nickname" maxlength="8"><br><br>
						 
		<label>연락처</label><br><input type="text" name="phone" id="phone"><br>
		<div class="phoneSuccess" id="phoneSuccess"></div>
		<br>
		
		<label>생년월일</label><br><input type="date" name="birth" id="birth"><br><br>
		<label>성별</label><br>
		<label><input type="radio" name="gender" value="남" id="male">남</label>
		<label><input type="radio" name="gender" value="여" id="female">여</label>
		<br><br>

		우편번호 : <input type="text" size="5" value="" name="zip" id="zip"><input type="button" value="검색" id="btnAddr" name="btnAddr"> 
<br> 
주소 : <input type="text" name="addr1" id="addr1" size="50"><input type="text" name="addr2" id="addr2" size="10"> 
		
		<br><br><br>
        <input type="submit" id="submit" value="가입"/>
        <input type="reset" value="취소"/>
        

</form>
</body>
</html>