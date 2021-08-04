<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<script src="${pageContext.request.contextPath}/resources/script/jquery-1.11.3.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/script/res_reviewboard.js"></script>
<script src="${pageContext.request.contextPath}/resources/script/star.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/myinfo/myinfo_reserve.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/header.css" />

<%-- <script src="${pageContext.request.contextPath}/resources/script/myinfo_page.js"></script> --%>
<title>Insert title here</title>
</head>
<body>
<div>
	<div class="info_head">
		<div class="info_head2">
			<h2>내정보</h2>
		</div>
	</div>

	<div class="info_body_wrap">
		<div class="info_body">
			<div class="info_list">
				<ul>
					<li><a class="res_history" href="myinfo_reserve">예약 내역</a></li>
					<li><a class="myinfo_page" href="myinfo_page">내 정보 관리</a></li>

				</ul>
			</div>

			<div class="reserve_right">
			
<form action="myinfo_review_write?res=${rsdetail.res_code }" id="review_board_form" class="review_board_form" method="post">
				<div class="reserve_info">
				
				<span class="font_nomal">${rsdetail.r_status }</span><br />
				<strong class="acc_name">${rsdetail.acc_name }</strong><br />
				<span class="font_nomal">${rsdetail.s_date } ~${rsdetail.e_date } ${rsdetail.accdays }박</span>				
				</div>
				
				<div class="reserve_info">
				<strong>예약번호</strong> <span class="font_nomal">${rsdetail.res_code }</span><br />
				<strong>예약자 이름</strong> <span class="font_nomal">${rsdetail. r_name}</span><br />
				<strong>휴대폰 번호</strong> <span class="font_nomal">${rsdetail. r_phone}</span>
				</div>
				
				<div id="reserve_price_info" class="reserve_info reserve_info_last">
				<p>결제정보</p>
				<strong>예약취소 금액</strong> <span class="font_nomal">${rsdetail.r_price }원</span>
				</div>
				
				<div class="write_form" id="write_from2" style="display:none;">
					<div class="review_board_layout">
						<div class="review_title_name">
							<p>리뷰제목</p>
						</div>
						<div class="review_title">
							<div class="review_title_text">
								<input type="text" name="myinfo_review_title" placeholder="20자 이내로 적어주세요"/>
							</div>
							
							<div class="a">
								<span class="star-input">
									<span class="input">
								    	<input type="radio" name="star-input" value="1" id="p1">
								    	<label for="p1">1</label>
								    	<input type="radio" name="star-input" value="2" id="p2">
								    	<label for="p2">2</label>
								    	<input type="radio" name="star-input" value="3" id="p3">
								    	<label for="p3">3</label>
								    	<input type="radio" name="star-input" value="4" id="p4">
								    	<label for="p4">4</label>
								    	<input type="radio" name="star-input" value="5" id="p5">
								    	<label for="p5">5</label>
								    	<input type="radio" name="star-input" value="6" id="p6">
								    	<label for="p6">6</label>
								    	<input type="radio" name="star-input" value="7" id="p7">
								    	<label for="p7">7</label>
								    	<input type="radio" name="star-input" value="8" id="p8">
								    	<label for="p8">8</label>
								    	<input type="radio" name="star-input" value="9" id="p9">
								    	<label for="p9">9</label>
								    	<input type="radio" name="star-input" value="10" id="p10">
								    	<label for="p10">10</label>
								  	</span>
								  	<output for="star-input"><b>0</b>점</output>
								  	<input type="hidden" id="hidden_rating" name="rating" value="" />						
								</span>
							</div>

						</div>
						
						<div class="review_content">
							<p>리뷰내용</p>
							<div class="review_content_text">
								<textarea name="myinfo_review_content" id="" cols="30" rows="10" placeholder="200자 이내로 적어주세요"></textarea>
							</div>
						</div>
						
						<div class="review_emoji">
							<p>이모티콘</p>
							<div class="emoji_check_layout">
								<div class="emoji_check">
									<img src="${pageContext.request.contextPath}/resources/img/review_emoji_devil.png" alt="" />
									<input type="radio" name="emoji" value="&#128520;" checked="checked" />
								</div>
								
								<div class="emoji_check">
									<img src="${pageContext.request.contextPath}/resources/img/review_emoji_flex.png" alt="" />
									<input type="radio" name="emoji" value="&#128526;" />
								</div>
								
								<div class="emoji_check">
									<img src="${pageContext.request.contextPath}/resources/img/review_emoji_love.png" alt="" />
									<input type="radio" name="emoji" value="&#128525;" />
								</div>
								
								<div class="emoji_check">
									<img src="${pageContext.request.contextPath}/resources/img/review_emoji_merong.png" alt="" />
									<input type="radio" name="emoji" value="&#128523;" />
								</div>
								
								<div class="emoji_check">
									<img src="${pageContext.request.contextPath}/resources/img/review_emoji_sad.png" alt="" />
									<input type="radio" name="emoji" value="&#128557;" />
								</div>
								
								<div class="emoji_check">
									<img src="${pageContext.request.contextPath}/resources/img/review_emoji_wow.png" alt="" />
									<input type="radio" name="emoji" value="&#128536;" />
								</div>
							</div>
						</div>
						
					</div>
				</div>
				<div class="btn_layout">
					<c:if test="${rsdetail.r_status eq '예약 완료'}">
						<a href="${pageContext.request.contextPath}/more/inquiry"><button type="button" class="cancel_btn" >취소 요청</button></a>
					</c:if>
					<c:if test="${rsdetail.r_status != '예약 완료'}">
						<a href="${pageContext.request.contextPath}/kdetail_page?acc_code=${rsdetail.acc_code}"><button type="button" id="re_reserve" class="cancel_btn" >다시 예약</button></a>
					</c:if>
					<c:if test="${rsdetail.r_status eq '이용 완료'}">
					
					<%-- <a href="${pageContext.request.contextPath}/kdetail_page?acc_code=${rsdetail.acc_code}"><button type="button" onclick="review_board_on();" class="res_review_btn">리뷰 쓰기</button></a> --%>
					<c:if test="${reviewCheck eq 0}">
					<button type="button" onclick="review_board_on();" id="review_btn" class="res_review_write_btn">리뷰 쓰기</button>
					</c:if>
					<button type="submit" id="review_finish_btn" class="res_review_finish_btn">작성 완료</button>
					<a href="myinfo_reserve_detail?rc=${rsdetail.res_code }"><button type="button" id="review_cancel_btn" class="res_review_cancle_btn">리뷰 취소</button></a>
					</c:if>
				</div>
</form>
				
				
			</div>
	</div>
</div>

</body>
</html>