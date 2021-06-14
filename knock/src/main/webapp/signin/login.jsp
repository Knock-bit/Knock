<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<script src="https://code.jquery.com/jquery-3.6.0.js"
    integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
    crossorigin="anonymous"></script>

<!DOCTYPE html>
<html>
  <head>
  	<title>Login</title>
    <meta charset="utf-8">
	<link href="loginstyle.css" rel="stylesheet" type="text/css">

	</head>
	<body>
	<section class="ftco-section">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-md-6 text-center mb-5">
					<h2 class="heading-section">LOGIN</h2>
				</div>
			</div>
			<div class="row justify-content-center">
				<div class="col-md-7 col-lg-5">
					<div class="wrap">
						<div class="img" style="background-image: url(header-bg.jpg);"></div>
						<div class="login-wrap p-4 p-md-5">
			      	<div class="d-flex">
			      		<div class="w-100">
			      			<h3 class="mb-4">KNOCKKNOCK! 입장하기</h3>
			      		</div>								
			      	</div>
					<form action= "${contextPath}/login?type=login" method="post" class="signin-form">
			      		<div class="form-group mt-3">
			      			<input type="text" id="user_id" name="user_id" class="form-control" required>
			      			<label class="form-control-placeholder" for="username">Username</label>
			      		</div>
		            <div class="form-group">
		              <input type="password" name="pwd" id="password-field" class="form-control" required>
		              <label class="form-control-placeholder" for="password">Password</label>
		              <span toggle="#password-field" class="fa fa-fw fa-eye field-icon toggle-password"></span>
		            </div>
		            <div class="form-group">
		            	<button type="submit" id="submit" class="form-control btn btn-primary rounded submit px-3">login</button>
		            </div>
		            
		          </form>
		          <p class="text-center">아직 KNOCK KNOCK을 안하셨나요? <a data-toggle="tab" href="${contextPath }/signin/regForm.jsp" ><br>노크하러 가기</a></p>
		        </div>
		      
		</div>
	</section>
	</body>
</html>
