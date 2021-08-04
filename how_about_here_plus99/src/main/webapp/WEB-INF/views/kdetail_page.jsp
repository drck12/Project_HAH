<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet" href="resources/css/datepicker.min.css">
<link rel="stylesheet" href="resources/css/kstyle3.css">

<script src="resources/script/datepicker.min.js" defer></script>
<script src="resources/script/kscript3.js" defer></script>
<script src="https://kit.fontawesome.com/d730d6aca1.js" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/paginationjs/2.1.4/pagination.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/paginationjs/2.1.4/pagination.css"/>

<title>Insert title here</title>
</head>
<body>
    <!-- <div class="header">header</div> -->
    <div class="content_wrapper">
        <div class="upper_content">
            <div class="acc_photo">
                <div class="container">
                    <div class="mySlides">
                        <div class="numbertext">1 / 6</div>
                        <img src="resources/img/acc_img/${photo[0].PHOTO_NAME}" style="width:100%">
                    </div>

                    <div class="mySlides">
                        <div class="numbertext">2 / 6</div>
                        <img src="resources/img/acc_img/${photo[1].PHOTO_NAME}" style="width:100%">
                    </div>

                    <div class="mySlides">
                        <div class="numbertext">3 / 6</div>
                        <img src="resources/img/acc_img/${photo[2].PHOTO_NAME}" style="width:100%">
                    </div>

                    <div class="mySlides">
                        <div class="numbertext">4 / 6</div>
                        <img src="resources/img/acc_img/${photo[3].PHOTO_NAME}" style="width:100%">
                    </div>

                    <div class="mySlides">
                        <div class="numbertext">5 / 6</div>
                        <img src="resources/img/acc_img/${photo[4].PHOTO_NAME}" style="width:100%">
                    </div>

                    <div class="mySlides">
                        <div class="numbertext">6 / 6</div>
                        <img src="resources/img/acc_img/${photo[5].PHOTO_NAME}" style="width:100%">
                    </div>

                    <a class="prev" onclick="plusSlides(-1)">❮</a>
                    <a class="next" onclick="plusSlides(1)">❯</a>

                    <div class="caption-container">
                        <!--                        <p id="caption"></p>-->
                    </div>

                    <div class="row">
                        <div class="column">
                            <img class="demo cursor" src="resources/img/acc_img/${photo[0].PHOTO_NAME}" style="width:100%" onclick="currentSlide(1)" alt="이미지 준비중">
                        </div>
                        <div class="column">
                            <img class="demo cursor" src="resources/img/acc_img/${photo[1].PHOTO_NAME}" style="width:100%" onclick="currentSlide(2)" alt="이미지 준비중">
                        </div>
                        <div class="column">
                            <img class="demo cursor" src="resources/img/acc_img/${photo[2].PHOTO_NAME}" style="width:100%" onclick="currentSlide(3)" alt="이미지 준비중">
                        </div>
                        <div class="column">
                            <img class="demo cursor" src="resources/img/acc_img/${photo[3].PHOTO_NAME}" style="width:100%" onclick="currentSlide(4)" alt="이미지 준비중">
                        </div>
                        <div class="column">
                            <img class="demo cursor" src="resources/img/acc_img/${photo[4].PHOTO_NAME}" style="width:100%" onclick="currentSlide(5)" alt="이미지 준비중">
                        </div>
                        <div class="column">
                            <img class="demo cursor" src="resources/img/acc_img/${photo[5].PHOTO_NAME}" style="width:100%" onclick="currentSlide(6)" alt="이미지 준비중">
                        </div>
                    </div>
                </div>
            </div>
            <div class="acc_title">
                <p>${acc.ACC_NAME}</p>
                <p>
                	<span>${review_total.RATING }</span>
                	<span>
                		<c:if test="${review_total.RATING + 0.001 >= 9.5}" >
							최고예요
						</c:if>
						<c:if test="${review_total.RATING + 0.001 < 9.5 && review_total.RATING + 0.001 >= 9.0}" >
							추천해요
						</c:if>
						<c:if test="${review_total.RATING + 0.001 < 9.0 && review_total.RATING + 0.001 >= 8.0}" >
							만족해요
						</c:if>
						<c:if test="${review_total.RATING + 0.001 < 8.0}" >
							좋아요
						</c:if>
					</span>
                	<span>리뷰  ${review_total.REB }개</span>
                </p>
                <p>${acc.ACC_ADDR}</p>
                <p><span>예약취소가능</span></p>
                <button>
                    <ul>
                    	<c:forTokens items="${acc.ACC_EVENT}" delims="|" var="item">
						    <li>${item}</li>
						</c:forTokens>
                    </ul>
                </button>
            </div>
        </div>
        <div class="lower_content">
            <div class="tab">
                <button class="tablinks" onclick="openCity(event, 'London')" id="defaultOpen">객실안내/예약</button>
                <button class="tablinks" onclick="openCity(event, 'Paris')">숙소정보</button>
                <button class="tablinks" onclick="openCity(event, 'Tokyo')">리뷰</button>
            </div>

            <div id="London" class="tabcontent">
				<div class="datepicker_wrapper">
					<input id="datepicker" type="text" data-range="true"
						data-multiple-dates-separator=" - " data-language="en"
						class="datepicker-here" value="2021/07/07 - 2021/07/15" />
				</div>
				<c:if test="${empty room}" >
				<div class="empty_room"><p>&#128561;</p><p>예약 가능한 방이 없습니다.</p></div>
				</c:if>
				<c:forEach items="${room }" var="room">
					<div class="reserve">
						<c:forEach items="${photo }" var="photo">
							<c:if test="${room.ROOM_TYPE eq photo.PHOTO_TYPE}" >
								<%-- <c:out value="${photo.PHOTO_NAME }"/> --%>
		                    	<img src="resources/img/acc_img/${photo.PHOTO_NAME }" alt="">
		                    </c:if>
	                    </c:forEach>
	                    <div class="reserve_text">
	                        <p>${room.ROOM_TYPE }</p>
	                        <div><span></span></div>
	                        <div><span>예약</span><span><fmt:formatNumber value="${room.ROOM_PRICE }" type="number"/>원</span></div>
	                        <div><span>체크인</span><span>13:00</span></div>
	                        <div><span>체크아웃</span><span>12:00</span></div>
	                        <button type="button" onclick="location.href='reserve?room_code=${room.ROOM_CODE }&acc_code=${acc.ACC_CODE}&r_type=${room.ROOM_TYPE }&s_date=${in}&e_date=${out}' ">숙박예약</button>
	                    </div>
	                </div>
                </c:forEach>
            </div>

            <div id="Paris" class="tabcontent">
                <button class="accordion" id="defaultOpen1">기본 정보</button>
                <div class="panel">
                    <div class="panel_content">
                        <p>취소 및 환불 규정</p>
                        <ul>
                            <li>체크인일 기준 3일 전까지 : 100% 환불</li>
                            <li>체크인일 기준 2일 전 ~ 당일 및 No-show : 환불 불가 </li>
                            <li>취소, 환불시 수수료가 발생할 수 있습니다. </li>
                        </ul>
                        <p>주변 정보</p>
                        <ul>
                        	<c:forTokens items="${acc.ACC_ADDRINFO}" delims="|" var="item">
						    	<li>${item}</li>
							</c:forTokens>
                        </ul>
                        <p>객실내부 시설</p>
                        <ul>
                        	<c:if test="${!empty acc.ACC_POOL}" >
								<li>${acc.ACC_POOL}</li>
							</c:if>
                        	<c:if test="${!empty acc.ACC_BRE}" >
								<li>${acc.ACC_BRE}</li>
							</c:if>
                        	<c:if test="${!empty acc.ACC_PUFIT}" >
								<li>${acc.ACC_PUFIT}</li>
							</c:if>
                        	<c:if test="${!empty acc.ACC_WIFI}" >
								<li>${acc.ACC_WIFI}</li>
							</c:if>
                        	<c:if test="${!empty acc.ACC_GOLF}" >
								<li>${acc.ACC_GOLF}</li>
							</c:if>
                        	<c:if test="${!empty acc.ACC_SPA}" >
								<li>${acc.ACC_SPA}</li>
							</c:if>
                        	<c:if test="${!empty acc.ACC_MINIBAR}" >
								<li>${acc.ACC_MINIBAR}</li>
							</c:if>
                        	<c:if test="${!empty acc.ACC_AIRCON}" >
								<li>${acc.ACC_AIRCON}</li>
							</c:if>
                        	<c:if test="${!empty acc.ACC_PET}" >
								<li>${acc.ACC_PET}</li>
							</c:if>
                        	<c:if test="${!empty acc.ACC_SMOKING}" >
								<li>${acc.ACC_SMOKING}</li>
							</c:if>
                        	<c:if test="${!empty acc.ACC_VALET}" >
								<li>${acc.ACC_VALET}</li>
							</c:if>
                        </ul>
                    </div>
                    <div id="map"></div>
                </div>

                <button class="accordion">요금 정보</button>
                <div class="panel">
                    <div class="price">
                        <p>숙박 이용요금</p>
                        <table>
                            <tr>
                                <th>객실 등급</th>
                                <th>일, 월, 화, 수, 목</th>
                                <th>금</th>
                                <th>토</th>
                            </tr>
                            <tr>
                                <td>싱글</td>
                                <td><fmt:formatNumber value="${room_price.SINGLE_PRICE}" type="number"/></td>
                                <td><fmt:formatNumber value="${room_price.SINGLE_PRICE}" type="number"/></td>
                                <td><fmt:formatNumber value="${room_price.SINGLE_PRICE}" type="number"/></td>
                            </tr>
                            <tr>
                                <td>트윈</td>
                                <td><fmt:formatNumber value="${room_price.TWIN_PRICE}" type="number"/></td>
                                <td><fmt:formatNumber value="${room_price.TWIN_PRICE}" type="number"/></td>
                                <td><fmt:formatNumber value="${room_price.TWIN_PRICE}" type="number"/></td>
                            </tr>
                            <tr>
                                <td>더블</td>
                                <td><fmt:formatNumber value="${room_price.DOUBLE_PRICE}" type="number"/></td>
                                <td><fmt:formatNumber value="${room_price.DOUBLE_PRICE}" type="number"/></td>
                                <td><fmt:formatNumber value="${room_price.DOUBLE_PRICE}" type="number"/></td>
                            </tr>
                        </table>
                        <p>숙박 이용시간</p>
                        <table>
                            <tr>
                                <th>구분</th>
                                <th>월, 화, 수, 목</th>
                                <th>일, 금, 토</th>
                            </tr>
                            <tr>
                                <td>입실</td>
                                <td>13시</td>
                                <td>13시</td>
                            </tr>
                            <tr>
                                <td>퇴실</td>
                                <td>정오</td>
                                <td>정오</td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>

            <div id="Tokyo" class="tabcontent">
                <div class="review">
                    <div class="review_rate">
                        <p>
							<c:if test="${review_total.RATING + 0.001 >= 9.5}" >
								최고예요
							</c:if>
							<c:if test="${review_total.RATING + 0.001 < 9.5 && review_total.RATING + 0.001 >= 9.0}" >
								추천해요
							</c:if>
							<c:if test="${review_total.RATING + 0.001 < 9.0 && review_total.RATING + 0.001 >= 8.0}" >
								만족해요
							</c:if>
							<c:if test="${review_total.RATING + 0.001 < 8.0}" >
								좋아요
							</c:if>
                        </p>
                        <p>
                        	<span>
                            	<c:set var="star" value="${((review_total.RATING+0.001)/2)%1 }" />
                           		<c:if test="${star >= 0.75}" >
								    <c:forEach var="no" begin="1" end="${(review_total.RATING+0.01)/2 + 1}">
										&#9733;
									</c:forEach>
								</c:if>
	                            <c:if test="${star >= 0.25 && remain < 0.75}" >
								    <c:forEach var="no" begin="1" end="${(review_total.RATING+0.01)/2 + 0.01 }">
										&#9733;
									</c:forEach>
									    &#9734;
								</c:if>
	                            <c:if test="${star < 0.25}" >
								    <c:forEach var="no" begin="1" end="${(review_total.RATING+0.01)/2 + 0.01 }">
									    &#9733;
									</c:forEach>
								</c:if>
                        	</span>
                        	<span>${review_total.RATING }</span>
                        </p>
                        <div><span>전체 리뷰 ${review_total.REB }</span><span>제휴점 답변 ${review_total.RERE }</span></div>
                    </div>
                    <div id="review">
	                    <c:forEach items="${review_board }" var="review">
	                    	<div id="${review.RN }">
		                        <div class="customer_review">
		                            <div class="emoji">${review.REB_EMOJI }</div>
		                            <div>
		                                <p class="review_title">${review.REB_TITLE }</p>
		                                <div class="review_rating">
		                                	<span>
		                                		<c:set var="remain" value="${((review.REB_RATING+0.001)/2)%1 }" />
		                                		<c:if test="${remain >= 0.75}" >
												    <c:forEach var="no" begin="1" end="${(review.REB_RATING+0.01)/2 + 1}">
														&#9733;
													</c:forEach>
												</c:if>
		                                		<c:if test="${remain >= 0.25 && remain < 0.75}" >
												    <c:forEach var="no" begin="1" end="${(review.REB_RATING+0.01)/2 + 0.01 }">
														&#9733;
													</c:forEach>
													    &#9734;
												</c:if>
		                                		<c:if test="${remain < 0.25}" >
												    <c:forEach var="no" begin="1" end="${(review.REB_RATING+0.01)/2 + 0.01 }">
													    &#9733;
													</c:forEach>
												</c:if>
		                                	</span>
		                                	<span>${review.REB_RATING }</span>
		                                </div>
		                                <div class="reviewer"><span>${review.REB_ROOM }</span><span>	&#128900;${review.MEM_ID2 }</span></div>
		                                <p>${review.REB_CONTENT }</p>
		                                <p class="reveiw_date">
		                                	<fmt:parseNumber var="i" type="number" value="${review.REB_PAST }" />
		                                	<c:if test="${i lt 1 }">
		                                		<fmt:formatNumber maxFractionDigits="0" value="${i*24 - (i*24)%1}" />시간 전
		                                	</c:if>
		                                	<c:if test="${i ge 1 }">
		                                		<fmt:formatNumber maxFractionDigits="0" value="${i -(i%1)}" />일 전
		                                	</c:if>
		                                	  <c:if test="${loginUser.mem_access == String.valueOf(acc.ACC_CODE) && empty review.RERE_CONTENT }">
		                                	
		                                	<form action="review_reply?acc_code=${acc.ACC_CODE }" method="post">
		                                	<input type="hidden" name="reb_seq" value="${review.REB_SEQ}" />
		                                	<textarea style="width: 100%; height: 70px;margin-bottom: 5px;" class="rebre_write_text" name="reb_reply_content"  ></textarea>
		                                	<button style="border-radius: 5px; color: white;background-color: rgba(241,31,93,1);" class="rebre_write_btn">작성완료</button>
		                                	</form>
		                                	</c:if>
		                                	
		                                </p>
		                                <c:if test="${not empty review.RERE_CONTENT }">
			                                <div class="review_reply">
			                                    <div  class="emoji">&#128512;</div>
			                                    <div>
			                                        <p class="review_title">제휴점 답변</p>
			                                        <p>${review.RERE_CONTENT }</p>
			                                        <p class="reveiw_date">
			                                        	<fmt:parseNumber var="i" type="number" value="${review.RERE_PAST }" />
					                                	<c:if test="${i lt 1 }">
					                                		<fmt:formatNumber maxFractionDigits="0" value="${i*24 - (i*24)%1}" />시간 전
					                                	</c:if>
					                                	<c:if test="${i ge 1 }">
					                                		<fmt:formatNumber maxFractionDigits="0" value="${i -(i%1)}" />일 전
					                                	</c:if>
			                                        </p>
			                                    </div>
			                                </div>
		                                </c:if>
		                            </div>
		                        </div>
	                        </div>
                        </c:forEach>
                    </div>
                    <div id="data-container"></div>
                    <div id="pagination"></div>
                </div>
            </div>
        </div>
    </div>
    <!-- <div class="footer">footer</div> -->
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ba8cda54b467ae4c09c9eb4b024cd01c"></script>
	<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new kakao.maps.LatLng(${acc.ACC_LATITUDE}, ${acc.ACC_LONGITUDE}), // 지도의 중심좌표
			level : 3
		// 지도의 확대 레벨
		};

		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

		// 마커가 표시될 위치입니다 
		var markerPosition = new kakao.maps.LatLng(${acc.ACC_LATITUDE}, ${acc.ACC_LONGITUDE});

		// 마커를 생성합니다
		var marker = new kakao.maps.Marker({
			position : markerPosition
		});

		// 마커가 지도 위에 표시되도록 설정합니다
		marker.setMap(map);

		// 아래 코드는 지도 위의 마커를 제거하는 코드입니다
		// marker.setMap(null);
	</script>
		<script>
		var current_date = "${in} - ${out}";
		var acc_code = "${acc.ACC_CODE}";
		var total = [];
		var rere_total = ${review_total.REB };
		for(var i=1; i<=rere_total; i++) {
		    total.push(i);
		}
	</script>

</body>
</html>