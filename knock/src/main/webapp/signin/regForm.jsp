<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<link href="style.css" rel="stylesheet" type="text/css">
<script src="join.js"></script>
<style>
.container {
	margin-left: 0px;
	margin: auto;
}

#reg-logo {
	margin-bottom: 20px;
}
</style>
</head>

<body>
<h1>테스트중~~~~</h1>
	<div class="main">
		<div id="reg-logo">
			<center>
				<a href="${contextPath }/main.jsp"> 
				<img src="${contextPath }/resources/assets/img/knocklogo.png" alt="..." width="150px" /><br> 
				<img src="${contextPath }/resources/assets/img/knocktext.png" alt="..." width="500px" /></a>			
		</div>
		<div class="container">
			<form method="post" class="regform" id="appointment-form"
				action="/knock/signin">
				<input type="hidden" name="type" value="join">
				<h1>회원가입</h1>
				<div class="form-group-1">
					<input type="text" name="user_id" id="user_id" name="user_id"
						placeholder="ID" maxlength="10" required /><input type="button"
						id="dupchk" value="중복확인"><br>
					<div
						style="font-size: 10px; margin-left: auto; font-weight: bold; color: darkgrey;">아이디는
						영문3자부터 최대 10자까지 가능합니다.(영문/숫자혼합)</div>
					<br> <input type="password" name="pwd" id="pwd"
						placeholder="비밀번호" maxlength="16" required /> <input
						type="password" name="pwd2" id="pwd2" placehoer="비밀번호 확인"
						maxlength="16" required />
					<div style="font-size: 10px; font-weight: bold; color: dldarkgrey;">영문
						대소문자, 숫자 혼합 최소 8자에서 16자</div>
					<div class="pwdSuccess" id="pwdSuccss"></div>
					<br> <input type="text" name="name" id="name" placeholder="이름"
						required />
					<div class="nameSuccess" id="nameSuccess"></div>

					<input type="email" name="email" id="email" placeholder="Email"
						required />
					<div class="emailSuccess" id="emailSuccess"></div>

					<input type="text" name="nickname" id="nickname" placeholder="닉네임"
						maxlength="8" required /> <input type="number" name="phone"
						id="phone" placeholder="휴대전화" required />
					<div style="font-size: 10px; font-weight: bold; color: darkgrey;">휴대폰번호
						11자리를 하이픈(-)과 함께 입력해주세요.</div>


					<input type="text" name="birth" id="birth" maxlength="10"
						placeholder="생년월일" required />
					<div style="font-size: 10px; font-weight: bold;" id="birthSuccess"></div>
					<br> <input type="text" name="zip" id="zip" placeholder="우편번호"
						required /> <input type="button" value="검색" id="btnAddr"
						name="btnAddr"> <input type="text" name="address"
						id="addr1" size="50" required> <input type="text"
						name="addr2" id="addr2" size="10" placeholder="상세주소">

					<div class="select-list">
						<select name="gender" id="gender" required="required">
							<option selected value="성별">성별</option>
							<option value="1">여성</option>
							<option value="0">남성</option>
						</select>
					</div>
				</div>
				<input type="submit" id="submit" value="가입" /> <input type="reset"
					value="다시쓰기" />
			</form>
		</div>
	</div>
</body>
</html>