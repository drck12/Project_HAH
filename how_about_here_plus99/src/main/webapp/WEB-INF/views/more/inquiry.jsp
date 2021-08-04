<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/more/inquiry.css?ver=79" />
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
		<div class="body">
			<div class="list">
				<ul>
					<li><a href="${pageContext.request.contextPath}/more/notice">공지사항</a></li>
					<li><a href="${pageContext.request.contextPath}/more/faq/1">자주
							묻는 질문</a></li>
					<li><a class="active-more"
						href="${pageContext.request.contextPath}/more/inquiry">1:1 문의</a></li>
					<li><a href="${pageContext.request.contextPath}/more/terms">약관 및 정책</a></li>
				</ul>
			</div>
			<div class="inquiry">
				<div class=mobile_top>
					1:1문의 <a class="mobile_top_btn" href="">새 문의 작성</a>
				</div>
				<div class="content-title">
					<span id="my_active" onclick="my_inquiry();">나의 문의 내역</span> <span
						onclick="write_inquiry();" id="write_active" class="active">새
						문의 작성</span>
				</div>

				<div id="my_inquiry" class="inquiry_off">

					<div class="my_inquiry_list">
						<c:if test="${loginUser != null }">
							<c:forEach items="${inquiry }" var="inquiry">
								<input id="myinquiry${inquiry.seq }" type="checkbox" />
								<label id="myinquiry${inquiry.seq }"
									for="myinquiry${inquiry.seq }"> ${inquiry.inquiry_type}<em></em><c:if test="${inquiry.rein_inquiry != null }">&emsp;[답변완료]</c:if><br />
									<span id="my_inquiry_day">${inquiry.write_day}</span>
								</label>
								<div>
									<p style="margin-bottom: 5px; " id="my_inquiry_content">${inquiry.inquiry_content}</p>
									<c:if test="${inquiry.rein_inquiry != null }">
									<div class="inquiry_reply">
										<strong>답변</strong> <span>작성일 ${inquiry.rein_regdate}</span>
										<p>${inquiry.rein_inquiry}</p>
									</div>
									</c:if>
								</div>




							</c:forEach>
						</c:if>
					</div>

				</div>

				<div id="write_inquiry" class="">
					<div class="inquiry_form">
						<form action="inquirywrite">
							<div class="inquiry_mobile_text">
								<p>
									여기어때 이용 중 불편하신 점을 문의주시면 <em>최대한 빠른 시일내에 답변 드리겠습니다.</em>
								</p>
							</div>

							<div class="info_wrap">
								<b>카테고리 유형</b> <select required name="room_type"
									id="select_type_1" class="select_type_1">
									<option value="">카테고리유형을 선택하세요</option>
									<option value="1">모텔</option>
									<option value="2">호텔</option>
									<option value="3">리조트</option>
									<option value="4">펜션</option>
									<option value="5">게스트하우스</option>
									<option value="6">캠핑/글램핑</option>
									<option value="7">한옥</option>
									<option value="8">액티비티</option>
									<option value="9">포인트</option>
								</select> <b>문의 유형</b> <select required name="inquiry_type"
									id="select_type_2" class="select_type_1">
									<option value="">문의유형을 선택하세요</option>
									<option value="이벤트">이벤트</option>
									<option value="예약/결제">예약/결제</option>
									<option value="취소/환불">취소/환불</option>
									<option value="혜택받기">혜택받기</option>
									<option value="이용문의">이용문의</option>
									<option value="회원정보">회원정보</option>
									<option value="리뷰">리뷰</option>
									<option value="환불신청">환불신청</option>
									<option value="기타">기타</option>
								</select>

								<div class="phone-block">
									<b>휴대폰 번호</b>
									<p class=inp_wrap>
										<input class="js-phone-number" data-type="phoneNumber"
											type="tel" maxlength="11" name="phone" value=""
											placeholder="선택사항입니다.">
									</p>
								</div>

								<div class="email-block">
									<b>이메일</b>
									<p class=inp_wrap>
										<input data-email-validate="" class="js-email-string"
											type="email" value="" name="uemail" placeholder="선택사항입니다.">
									</p>
								</div>
							</div>

							<div class="text_wrap">
								<b>문의 내용</b>
								<div>
									<textarea required minlength="10" name="inquiry_content"
										id="questionTextarea"
										placeholder="문의 내용 작성 시 개인정보가 입력되지 않도록 주의 부탁드립니다."></textarea>

								</div>
							</div>

							<div class="agree_wrap">
								<div>
									<input required type="checkbox" id="info_agree" name="checkOne"
										class="inp_chk_04"> <a href="">개인정보수집. 이용동의[내용보기]</a>
								</div>
							</div>

							<div class="btn_wrap ">
								<button class="btn_red_fill">작성 완료</button>
							</div>
						</form>
						<div></div>
					</div>

				</div>
			</div>
		</div>
	</div>
	<script>
		function my_inquiry() {
			document.getElementById('write_inquiry').classList
					.add('inquiry_off');
			document.getElementById('my_inquiry').classList
					.remove('inquiry_off');
			document.getElementById('my_active').classList.add('active');
			document.getElementById('write_active').classList.remove('active');

		}
		function write_inquiry() {
			document.getElementById('write_inquiry').classList
					.remove('inquiry_off');
			document.getElementById('my_inquiry').classList.add('inquiry_off');
			document.getElementById('my_active').classList.remove('active');
			document.getElementById('write_active').classList.add('active');

		}
	</script>
</body>
</html>