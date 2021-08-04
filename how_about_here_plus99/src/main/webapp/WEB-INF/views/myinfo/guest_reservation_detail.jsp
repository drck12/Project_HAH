<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/myinfo/myinfo_reserve
.css" />
<%-- <script src="${pageContext.request.contextPath}/resources/script/myinfo_page.js"></script> --%>
<title>Insert title here</title>
</head>
<body>




	<div class="info_head">
		<div class="info_head2">
			<h2>내정보</h2>
		</div>
	</div>

	<div class="info_body_wrap">
		<div class="info_body">
			<div class="info_list">
				<ul>
					<li><a class="res_history" href="">비회원 예약 내역</a></li>
				</ul>
			</div>

			<div class="reserve_right">
				
				<div class="reserve_info">
				
				<span class="font_nomal">${reservation.r_status }</span><br />
				<strong class="acc_name">${reservation.acc_name }</strong><br />
				<span class="font_nomal">${reservation.s_date } ~${reservation.e_date } ${reservation.accdays }박</span>				
				</div>
				
				<div class="reserve_info">
				<strong>예약번호</strong> <span class="font_nomal">${reservation.res_code }</span><br />
				<strong>예약자 이름</strong> <span class="font_nomal">${reservation. r_name}</span><br />
				<strong>휴대폰 번호</strong> <span class="font_nomal">${reservation. r_phone}</span>
				</div>
				
				<div class="reserve_info reserve_info_last">
				<p>결제정보</p>
				<strong>예약 금액</strong> <span class="font_nomal">${reservation.r_price }원</span>
				
				</div>
				<c:if test="${reservation.r_status eq '예약 완료'}">
				<a href="${pageContext.request.contextPath}/more/inquiry"><button type="button" class="cancel_btn" >취소 요청</button></a>
				</c:if>
				<c:if test="${reservation.r_status != '예약 완료'}">
				<a href="${pageContext.request.contextPath}/kdetail_page?acc_code=${rsdetail.acc_code}"><button type="button" class="cancel_btn" >다시 예약</button></a>
				</c:if>
				</div>
				


			
			
			</div>


		</div>
	</div>







</body>
</html>