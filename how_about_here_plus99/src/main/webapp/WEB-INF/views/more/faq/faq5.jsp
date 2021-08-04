<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/more/Cfaq.css?ver=79" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/script/Cfaq.js?v=<%=new java.util.Date().getTime()%>"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.1/js/all.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
</head>
<body>

	<div class="head">
		<div class="head2">
			<h2>더보기</h2>
		</div>
	</div>
	<div class="body_wrap">

		<div class="more_body">
			<div class="list">
				<ul>
					<li><a href="${pageContext.request.contextPath}/more/notice">공지사항</a></li>
					<li><a class="active-more"
						href="${pageContext.request.contextPath}/more/faq/1">자주 묻는 질문</a></li>
					<li><a href="${pageContext.request.contextPath}/more/inquiry">1:1
							문의</a></li>
					<li><a href="${pageContext.request.contextPath}/more/terms">약관
							및 정책</a></li>
				</ul>
			</div>
			<div class="content">
				<div class=mobile_top>
					고객 문의 <a class="mobile_top_btn" href="">1:1문의</a>
				</div>
				<div class="content-title">
					<li><a href="./1">TOP7</a></li>
					<li><a href="./2">이용 문의</a></li>
					<li><a href="./3">예약취소</a></li>
					<li><a href="./4">결제/영수증</a></li>
					<li><a class="active" href="./5">예약문의</a></li>
					<li><a href="./6">쿠폰/포인트</a></li>
					<li><a href="./7">회원정보</a></li>
					<li><a href="./8">리얼리뷰</a></li>
					<li><a href="./9">모바일티켓</a></li>
				</div>
				<div>
					<strong class="more_title">자주 묻는 질문</strong>
				</div>
				<div>
					<div class="faq">
						<input id="top01" type="checkbox" /><label for="top01">[숙박]
							예약을 취소하고 싶어요.<em></em><br /> <span>2021.07.07</span>
						</label>
						<div>
							<p>
								예약취소는 앱/웹 > 내정보 > 예약/구매내역에서 직접 가능합니다. <br /> <br /> 예약/결제 진행
								당시 안내된 취소/환불 규정에 따라 처리되며, <br /> <br />취소수수료가 발생할 경우 취소수수료를
								차감한 금액으로 환불 처리됩니다. <br /> <br /> 일부 숙소에 한해 취소가 가능한 시점이나 앱/웹에서
								취소가 불가할 수 있으니 <br /> <br /> 이 경우에는 고객행복센터로 요청해 주시길 바랍니다.
							</p>
						</div>
						<input id="top02" type="checkbox" /><label for="top02">[숙박]
							천재지변으로 인한 예약취소는 어떻게 하나요?<em></em><br /> <span>2021.07.07</span>
						</label>
						<div>
							<p>
								천재지변(기상악화)으로 숙소 이용이 불가할 경우 <br /> <br /> 고객행복센터로 예약내역 및
								증빙서류(결항확인서, e-티켓 등)를 보내주시면 <br /> <br />확인 후 예약취소 여부를 안내해
								드립니다. <br /> <br /> 다만, 상황에 따라 취소가 어려울 수 있는 점 참고 부탁드립니다. <br />
								<br /> [접수방법] <br /> <br /> ※ 이메일 : help@goodchoice.kr (예약자명,
								숙소명, 체크인 날짜 필수) <br /> <br /> ※ 카카오톡 : 카카오톡 내 플러스 친구 > 여기어때
								고객행복센터 추가
							</p>
						</div>
						<input id="top03" type="checkbox" /><label for="top03">[숙박]
							예약대기 건 예약취소하고 싶어요.<em></em><br /> <span>2021.07.07</span>
						</label>
						<div>
							<p>
								예약 대기중에는 여기어때 고객행복센터에 예약취소 요청해주시길 바랍니다. <br /> <br /> 단, 예약확정이
								될 경우 수수료가 발생하거나 예약취소가 불가할 수 있습니다.
							</p>
						</div>
						<input id="top04" type="checkbox" /><label for="top04">[숙박]
							체크인날짜/객실타입을 변경하고 싶어요.<em></em><br /> <span>2021.07.07</span>
						</label>
						<div>
							<p>
								예약 결제 완료 후 날짜 및 객실타입 등 부분 변경은 불가합니다. <br />
								<br /> 예약취소와 동일하게 취소 및 환불 규정에 따라 처리되므로 <br />
								<br />예약취소가 가능한 기간에는 예약취소 후 재결제 하셔서 이용 부탁드립니다.<br />
								<br /> 만약, 예약취소가 불가하거나 수수료가 발생하는 경우라면 <br />
								<br />고객행복센터로 문의해주시길 바랍니다.
							</p>
						</div>

					</div>

				</div>
			</div>
		</div>
	</div>
</body>
</html>