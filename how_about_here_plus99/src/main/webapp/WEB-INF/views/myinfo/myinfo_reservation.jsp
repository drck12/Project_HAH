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
					<li><a class="res_history" href="">예약 내역</a></li>
					<li><a class="myinfo_page" href="myinfo_page">내 정보 관리</a></li>

				</ul>
			</div>

			<div class="reserve_right">
				<div>
					<h3>예약내역</h3>
					<ul class="reserve_list">
					<c:forEach items="${reservation }" var="rs" varStatus="status">
					<c:if test="${rs.r_status eq '예약 완료'}">
						<li class="reservation-detail">
							<div>
								<p>
									<img
										src="${pageContext.request.contextPath}/resources/img/acc_img/${rs.photo_name}"
										alt="" />
								</p>
								<a class="reserve_detail_link" href="myinfo_reserve_detail?rc=${rs.res_code }">
									<span>${rs.r_status }</span><br />
									 <strong>${rs.acc_name }</strong> <br />
									 <span>${rs.s_date } ~ ${rs.e_date } / ${rs.accdays }박</span>
								</a> 
							</div>
						</li>
						</c:if>
					</c:forEach>
						
					</ul>
				</div>
				<div>
					<h3>이용내역</h3>
					<ul class="reserve_list">
						<c:forEach items="${reservation }" var="rs" varStatus="status">
					<c:if test="${rs.r_status eq '이용 완료'}">
						<li class="reservation-detail">
							<div>
								<p>
									<img
										src="${pageContext.request.contextPath}/resources/img/acc_img/${rs.photo_name}"
										alt="" />
								</p>
								<a class="reserve_detail_link" href="myinfo_reserve_detail?rc=${rs.res_code }">
									<span>${rs.r_status }</span><br />
									 <strong>${rs.acc_name }</strong> <br />
									 <span>${rs.s_date } ~ ${rs.e_date } / ${rs.accdays }박</span>
								</a> 
							</div>
						</li>
						</c:if>
					</c:forEach>
					</ul>
				</div>
				<div>
					<h3>취소내역</h3>
					<ul class="reserve_list">
						<c:forEach items="${reservation }" var="rs" varStatus="status">
					<c:if test="${rs.r_status eq '예약 취소'}">
						<li class="reservation-detail">
							<div>
								<p>
									<img
										src="${pageContext.request.contextPath}/resources/img/acc_img/${rs.photo_name}"
										alt="" />
								</p>
								<a class="reserve_detail_link" href="myinfo_reserve_detail?rc=${rs.res_code }">
									<span>${rs.r_status }</span><br />
									 <strong>${rs.acc_name }</strong> <br />
									 <span>${rs.s_date } ~ ${rs.e_date } / ${rs.accdays }박</span>
								</a> 
							</div>
						</li>
						</c:if>
					</c:forEach>
					</ul>
				</div>

				


			</div>





		</div>
	</div>







</body>
</html>