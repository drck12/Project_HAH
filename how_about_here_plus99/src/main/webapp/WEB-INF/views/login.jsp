<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="resources/css/Clogin.css" />
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.1/js/all.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
</head>
<body>
	<div class="body_form">
		<form action="user_login" method="post">
			<div class="join_user_title">
				<a href="main">저기어때</a>
			</div>
			<div id="naver_id_login" style="text-align: center">
				<a href="${url}"> <img width="223"
					src="https://developers.naver.com/doc/review_201802/CK_bEFnWMeEBjXpQ5o8N_20180202_7aot50.png" /></a>
			</div>
			<br>
			<p class="space_or">
				<span>또는</span>
			</p>
			<input autocomplete="off" placeholder="이메일 주소" required type="email" name="email"
				class="inputinfo"> <input placeholder="비밀번호" required
				type="password" name="pw" class="inputinfo">

			<button style="cursor: pointer;" class="btn-submit">로그인</button>
			<div class="link_half">
				<div>
					<a href="pwchange"><span>비밀번호 재설정</span></a>
				</div>
				<div>
					<a href="join"><span>회원가입</span></a>
				</div>
			</div>
		</form>
	</div>
	<input type="hidden" id="user" value="${msga }" />
<script>
window.onload = function () {
	var msga = document.getElementById('user').value;
	if (msga != null && msga != "") {
		alert(msga);
		msga = "";
		

	}
		
		}
	</script> 
	

</body>
</html>