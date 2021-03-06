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

                    <a class="prev" onclick="plusSlides(-1)">???</a>
                    <a class="next" onclick="plusSlides(1)">???</a>

                    <div class="caption-container">
                        <!--                        <p id="caption"></p>-->
                    </div>

                    <div class="row">
                        <div class="column">
                            <img class="demo cursor" src="resources/img/acc_img/${photo[0].PHOTO_NAME}" style="width:100%" onclick="currentSlide(1)" alt="????????? ?????????">
                        </div>
                        <div class="column">
                            <img class="demo cursor" src="resources/img/acc_img/${photo[1].PHOTO_NAME}" style="width:100%" onclick="currentSlide(2)" alt="????????? ?????????">
                        </div>
                        <div class="column">
                            <img class="demo cursor" src="resources/img/acc_img/${photo[2].PHOTO_NAME}" style="width:100%" onclick="currentSlide(3)" alt="????????? ?????????">
                        </div>
                        <div class="column">
                            <img class="demo cursor" src="resources/img/acc_img/${photo[3].PHOTO_NAME}" style="width:100%" onclick="currentSlide(4)" alt="????????? ?????????">
                        </div>
                        <div class="column">
                            <img class="demo cursor" src="resources/img/acc_img/${photo[4].PHOTO_NAME}" style="width:100%" onclick="currentSlide(5)" alt="????????? ?????????">
                        </div>
                        <div class="column">
                            <img class="demo cursor" src="resources/img/acc_img/${photo[5].PHOTO_NAME}" style="width:100%" onclick="currentSlide(6)" alt="????????? ?????????">
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
							????????????
						</c:if>
						<c:if test="${review_total.RATING + 0.001 < 9.5 && review_total.RATING + 0.001 >= 9.0}" >
							????????????
						</c:if>
						<c:if test="${review_total.RATING + 0.001 < 9.0 && review_total.RATING + 0.001 >= 8.0}" >
							????????????
						</c:if>
						<c:if test="${review_total.RATING + 0.001 < 8.0}" >
							?????????
						</c:if>
					</span>
                	<span>??????  ${review_total.REB }???</span>
                </p>
                <p>${acc.ACC_ADDR}</p>
                <p><span>??????????????????</span></p>
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
                <button class="tablinks" onclick="openCity(event, 'London')" id="defaultOpen">????????????/??????</button>
                <button class="tablinks" onclick="openCity(event, 'Paris')">????????????</button>
                <button class="tablinks" onclick="openCity(event, 'Tokyo')">??????</button>
            </div>

            <div id="London" class="tabcontent">
				<div class="datepicker_wrapper">
					<input id="datepicker" type="text" data-range="true"
						data-multiple-dates-separator=" - " data-language="en"
						class="datepicker-here" value="2021/07/07 - 2021/07/15" />
				</div>
				<c:if test="${empty room}" >
				<div class="empty_room"><p>&#128561;</p><p>?????? ????????? ?????? ????????????.</p></div>
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
	                        <div><span>??????</span><span><fmt:formatNumber value="${room.ROOM_PRICE }" type="number"/>???</span></div>
	                        <div><span>?????????</span><span>13:00</span></div>
	                        <div><span>????????????</span><span>12:00</span></div>
	                        <button type="button" onclick="location.href='reserve?room_code=${room.ROOM_CODE }&acc_code=${acc.ACC_CODE}&r_type=${room.ROOM_TYPE }&s_date=${in}&e_date=${out}' ">????????????</button>
	                    </div>
	                </div>
                </c:forEach>
            </div>

            <div id="Paris" class="tabcontent">
                <button class="accordion" id="defaultOpen1">?????? ??????</button>
                <div class="panel">
                    <div class="panel_content">
                        <p>?????? ??? ?????? ??????</p>
                        <ul>
                            <li>???????????? ?????? 3??? ????????? : 100% ??????</li>
                            <li>???????????? ?????? 2??? ??? ~ ?????? ??? No-show : ?????? ?????? </li>
                            <li>??????, ????????? ???????????? ????????? ??? ????????????. </li>
                        </ul>
                        <p>?????? ??????</p>
                        <ul>
                        	<c:forTokens items="${acc.ACC_ADDRINFO}" delims="|" var="item">
						    	<li>${item}</li>
							</c:forTokens>
                        </ul>
                        <p>???????????? ??????</p>
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

                <button class="accordion">?????? ??????</button>
                <div class="panel">
                    <div class="price">
                        <p>?????? ????????????</p>
                        <table>
                            <tr>
                                <th>?????? ??????</th>
                                <th>???, ???, ???, ???, ???</th>
                                <th>???</th>
                                <th>???</th>
                            </tr>
                            <tr>
                                <td>??????</td>
                                <td><fmt:formatNumber value="${room_price.SINGLE_PRICE}" type="number"/></td>
                                <td><fmt:formatNumber value="${room_price.SINGLE_PRICE}" type="number"/></td>
                                <td><fmt:formatNumber value="${room_price.SINGLE_PRICE}" type="number"/></td>
                            </tr>
                            <tr>
                                <td>??????</td>
                                <td><fmt:formatNumber value="${room_price.TWIN_PRICE}" type="number"/></td>
                                <td><fmt:formatNumber value="${room_price.TWIN_PRICE}" type="number"/></td>
                                <td><fmt:formatNumber value="${room_price.TWIN_PRICE}" type="number"/></td>
                            </tr>
                            <tr>
                                <td>??????</td>
                                <td><fmt:formatNumber value="${room_price.DOUBLE_PRICE}" type="number"/></td>
                                <td><fmt:formatNumber value="${room_price.DOUBLE_PRICE}" type="number"/></td>
                                <td><fmt:formatNumber value="${room_price.DOUBLE_PRICE}" type="number"/></td>
                            </tr>
                        </table>
                        <p>?????? ????????????</p>
                        <table>
                            <tr>
                                <th>??????</th>
                                <th>???, ???, ???, ???</th>
                                <th>???, ???, ???</th>
                            </tr>
                            <tr>
                                <td>??????</td>
                                <td>13???</td>
                                <td>13???</td>
                            </tr>
                            <tr>
                                <td>??????</td>
                                <td>??????</td>
                                <td>??????</td>
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
								????????????
							</c:if>
							<c:if test="${review_total.RATING + 0.001 < 9.5 && review_total.RATING + 0.001 >= 9.0}" >
								????????????
							</c:if>
							<c:if test="${review_total.RATING + 0.001 < 9.0 && review_total.RATING + 0.001 >= 8.0}" >
								????????????
							</c:if>
							<c:if test="${review_total.RATING + 0.001 < 8.0}" >
								?????????
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
                        <div><span>?????? ?????? ${review_total.REB }</span><span>????????? ?????? ${review_total.RERE }</span></div>
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
		                                		<fmt:formatNumber maxFractionDigits="0" value="${i*24 - (i*24)%1}" />?????? ???
		                                	</c:if>
		                                	<c:if test="${i ge 1 }">
		                                		<fmt:formatNumber maxFractionDigits="0" value="${i -(i%1)}" />??? ???
		                                	</c:if>
		                                	  <c:if test="${loginUser.mem_access == String.valueOf(acc.ACC_CODE) && empty review.RERE_CONTENT }">
		                                	
		                                	<form action="review_reply?acc_code=${acc.ACC_CODE }" method="post">
		                                	<input type="hidden" name="reb_seq" value="${review.REB_SEQ}" />
		                                	<textarea style="width: 100%; height: 70px;margin-bottom: 5px;" class="rebre_write_text" name="reb_reply_content"  ></textarea>
		                                	<button style="border-radius: 5px; color: white;background-color: rgba(241,31,93,1);" class="rebre_write_btn">????????????</button>
		                                	</form>
		                                	</c:if>
		                                	
		                                </p>
		                                <c:if test="${not empty review.RERE_CONTENT }">
			                                <div class="review_reply">
			                                    <div  class="emoji">&#128512;</div>
			                                    <div>
			                                        <p class="review_title">????????? ??????</p>
			                                        <p>${review.RERE_CONTENT }</p>
			                                        <p class="reveiw_date">
			                                        	<fmt:parseNumber var="i" type="number" value="${review.RERE_PAST }" />
					                                	<c:if test="${i lt 1 }">
					                                		<fmt:formatNumber maxFractionDigits="0" value="${i*24 - (i*24)%1}" />?????? ???
					                                	</c:if>
					                                	<c:if test="${i ge 1 }">
					                                		<fmt:formatNumber maxFractionDigits="0" value="${i -(i%1)}" />??? ???
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
		var mapContainer = document.getElementById('map'), // ????????? ????????? div 
		mapOption = {
			center : new kakao.maps.LatLng(${acc.ACC_LATITUDE}, ${acc.ACC_LONGITUDE}), // ????????? ????????????
			level : 3
		// ????????? ?????? ??????
		};

		var map = new kakao.maps.Map(mapContainer, mapOption); // ????????? ???????????????

		// ????????? ????????? ??????????????? 
		var markerPosition = new kakao.maps.LatLng(${acc.ACC_LATITUDE}, ${acc.ACC_LONGITUDE});

		// ????????? ???????????????
		var marker = new kakao.maps.Marker({
			position : markerPosition
		});

		// ????????? ?????? ?????? ??????????????? ???????????????
		marker.setMap(map);

		// ?????? ????????? ?????? ?????? ????????? ???????????? ???????????????
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