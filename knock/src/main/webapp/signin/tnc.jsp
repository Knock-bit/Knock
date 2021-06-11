<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://code.jquery.com/jquery-3.6.0.js"
    integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
    crossorigin="anonymous"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Terms and Conditions</title>
<script>
$(".checkbox_group").on("click", "#check_all", function(){
	$(this).parents("checkbox_group").find("input").prop("checked",$(this).is(":checked"));	
});


</script>

</head>
<body>
<div class="checkbox_group">
	<input type="checkbox" id="check_all">
	<label for="check_all">전체동의</label><br>
	
	<input type="checkbox" id="check_1" class="normal">
	<label for="check1">개인정보 처리방침 동의</label><br>

	<input type="checkbox" id="check_2" class="normal">
	<label for="check2">서비스 이용 약관</label><br>
	
	<input type="checkbox" id="check_3" class="normal">
	<label for="check1">마케팅 수신 동의</label><br>

</div>

</body>
</html>