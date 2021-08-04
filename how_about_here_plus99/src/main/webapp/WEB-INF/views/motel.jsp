<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<script type="text/javascript" src="resources/script/motel.js?ver=25"></script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3402980874dd067df556619596251323"></script>

<link rel="stylesheet" href="resources/css/motel.css?ver=1" />
</head>
<body>
	<div class="content-wrap">
	<div class="head-bg-img">
		<div class="header_margin"></div>
		<div id="bodyclass4" class="container">
			<div class="head-bg">
				<h1 class="title">모텔</h1>
				<div class="dropdown">
					<button type="button" id="dist_text" value="1" class="dropbtn2">서울
						> 강남/역삼/삼성/신사/청담</button>
					<input type="hidden" id="dist_send" name="dist" value="1" />

					<div class="dropdown-content">
						<div class="tab">
							<button class="tablinks" onmouseover="openCity(event, 'seoul')">서울</button>
							<button class="tablinks" onmouseover="openCity(event, 'busan')">부산</button>
							<button class="tablinks" onmouseover="openCity(event, 'jeju')">제주</button>
							<button class="tablinks" onmouseover="openCity(event, 'gangwon')">강원</button>
							<button class="tablinks"
								onmouseover="openCity(event, 'gyeonggi')">경기</button>
							<button class="tablinks" onmouseover="openCity(event, 'incheon')">인천</button>
							<button class="tablinks"
								onmouseover="openCity(event, 'gyeongsang')">경상</button>
							<button class="tablinks" onmouseover="openCity(event, 'jeolla')">전라</button>
							<button class="tablinks"
								onmouseover="openCity(event, 'chungcheong')">충청</button>
						</div>

						   <div id="seoul" class="tabcontent">
                        <a href="motel?dist=1">강남/역삼/삼성/신사/청담</a> <a href="motel?dist=2">서초/교대</a> <a href="motel?dist=3">잠실/송파/왕십리/강동</a> 
                        <a href="motel?dist=4">을지로/시청/명동</a> <a href="motel?dist=5">종로/인사동/동대문/강북</a> <a
                           href="motel?dist=6">서울역/이태원/용산</a> <a href="motel?dist=7">마포/홍대/신촌/서대문</a> <a
                           href="motel?dist=8">영등포/여의도/김포공항</a> <a href="motel?dist=9">구로/금천/관악/동작</a>
                     </div>

                     <div id="busan" class="tabcontent">
                        <a href="motel?dist=10">해운대(센텀,송정)</a> <a href="motel?dist=11">광안리/기장</a> <a href="motel?dist=12">부산역/남포/자갈치/영도</a>
                        <a href="motel?dist=13">서면/동래/연제/남구</a> <a href="motel?dist=14">김해공항/기타 (그외 지역)</a>
                     </div>

                     <div id="jeju" class="tabcontent">
                        <a href="motel?dist=15">제주공항/애월/함덕</a> <a href="motel?dist=16">서귀포시/중문/표선/성산</a>
                     </div>

						<div id="gangwon" class="tabcontent">
							<a href="#">강릉/속초</a> <a href="#">양양/동해/고성/삼척</a> <a href="#">춘천/홍천/인제/철원</a>
							<a href="#">평창/정선/횡성</a> <a href="#">영월/원주/태백</a>
						</div>

						<div id="gyeonggi" class="tabcontent">
							<a href="#">수원/성남</a> <a href="#">용인/평택</a> <a href="#">화성/안산/부천/안양</a>
							<a href="#">고양/의정부/파주/김포</a> <a href="#">시흥/군포/광명</a> <a href="#">남양주시/구리/하남</a>
							<a href="#">가평/양평</a>
						</div>

						<div id="incheon" class="tabcontent">
							<a href="#">송도/남동구/옹진군</a> <a href="#">인천국제공항(중구)</a> <a href="#">부평/계양/서구/미추홀구/강화</a>
						</div>

						<div id="gyeongsang" class="tabcontent">
							<a href="#">경주/포항/울진/영덕</a> <a href="#">거제/통영</a> <a href="#">대구/구미/문경/안동</a>
							<a href="#">울산/양산</a> <a href="#">창원/김해/창녕</a> <a href="#">사천/남해/진주/함양</a>
						</div>

						<div id="jeolla" class="tabcontent">
							<a href="#">여수</a> <a href="#">전주</a> <a href="#">광주</a> <a
								href="#">광양/구례/순천/화순/남원</a> <a href="#">군산/익산/부안/진안/무주</a> <a
								href="#">목포/나주/완도/해남/영암</a>
						</div>

						<div id="chungcheong" class="tabcontent">
							<a href="#">대전</a> <a href="#">천안/아산/예산/당진</a> <a href="#">보령/서산/태안</a>
							<a href="#">청주/제천/충주/보은/금산</a>
						</div>

					</div>
				</div>
			</div>


		</div>
		</div>
		<div class="motel_list_wrap">
		<div>
		<c:forEach items="${motel }" var="motel">
		 <form action="kdetail_page" id="${motel.acc_code }">
			<div class="content_wrap" OnClick="document.getElementById('${motel.acc_code }').submit();"
				style="background-image: linear-gradient(rgba(0, 0, 0, 0.3), rgba(0, 0, 0, 0.3)), url(${pageContext.request.contextPath}/resources/img/acc_img/${motel.photo_name})">
				<div class="content_text_left">
					<input type="hidden" id="acccode" name="acc_code" value="${motel.acc_code }">
					<p class="acc_grade">${motel.acc_grade }</p>
					<p class="acc_name">${motel.acc_name }</p>
					<p class="acc_rating">${motel.acc_rating }(278)</p>
					<p class="acc_dist">${motel.acc_dist }|${motel.acc_addr }</p>
				</div>
				<div class="content_text_right">
					<p class="acc_ava">2박가능</p>
					<p class="acc_price">${motel.room_price }원/1박</p>
				</div>

			</div>
			</form>  
		</c:forEach>
		</div>
		</div>
	</div>


</body>
</html>