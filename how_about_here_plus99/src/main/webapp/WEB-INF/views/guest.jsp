<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="resources/css/guest.css" />
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.1/js/all.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
</head>
<body>
<div class="body_form">
	<form action="guest_reservation_detail" method="post">
	<div class="join_user_title">
				<a href="main">여기어때</a>
			</div>
	<div class="fix_title">
	<strong class="page_title">비회원 예약 내역 조회</strong>
	</div>
	<input autocomplete="off" placeholder="휴대폰 번호" required type="text" name="r_phone" class="inputinfo"
	 oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
	
	
	<input autocomplete="off" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" placeholder="예약번호" required type="text" name="res_code" class="inputinfo">
	
	<button class="btn-submit">조회하기</button>
	
	</form>
	</div>
	<input type="hidden" id="msg" value="${msg }"/>
				<script>
				var a = document.getElementById('msg').value;
				if(a != null && a!=""){
				alert(a);}
				</script>

	
</body>
</html>