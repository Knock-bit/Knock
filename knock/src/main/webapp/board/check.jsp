<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script type="text/javascript">
		if (window.name == "update" {
			window.opener.parent.location.href
			="${param.board_idx }"
		} else if (window.name == "delete") {
			alert("삭제되었습니다.");
			window.opener.parent.loaction.href
			="${param.board_idx }"
		}
		window.close();
	</script>
</body>
</html>