<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="resources/css/pwchange.css" />
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.1/js/all.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
</head>
<body>
	<div class="body_form">
		<form action="selectConfirm" method="post">
			<div class="join_user_title">
				<a href="main">여기어때</a>
			</div>
			
			
			<input autocomplete="off" placeholder="이메일 주소" required type="email" name="email"
				class="inputinfo">

			<button style="cursor: pointer;" class="btn-submit">다음</button>
			
	</div>

<input type="hidden" id="user" value="${msg }" />
</body>
<script>
window.onload = function () {
	var msg = document.getElementById('user').value;
	if (msg != null && msg != "") {
		alert(msg);
		msg = "";

	}
		
		}
	</script> 
	
</html>