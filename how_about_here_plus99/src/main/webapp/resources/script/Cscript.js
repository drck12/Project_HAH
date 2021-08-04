
    	
function inputPhoneNumber(obj) {
    var number = obj.value.replace(/[^0-9]/g, "");
    var phone = "";

    if(number.length < 4) {
        return number;
    } else if(number.length < 7) {
        phone += number.substr(0, 3);
        phone += "-";
        phone += number.substr(3);
    } else if(number.length < 11) {
        phone += number.substr(0, 3);
        phone += "-";
        phone += number.substr(3, 3);
        phone += "-";
        phone += number.substr(6);
    } else {
        phone += number.substr(0, 3);
        phone += "-";
        phone += number.substr(3, 4);
        phone += "-";
        phone += number.substr(7);
    }
    obj.value = phone;
}

function classremove(){
	document.getElementById('recommend').classList.remove('order-active');
	document.getElementById('distance').classList.remove('order-active');
	document.getElementById('lowprice').classList.remove('order-active');
	document.getElementById('highprice').classList.remove('order-active');
}


function recommend_(){
	$('input[id=order_]').attr('value',"recommend");}
	
	
function distance_(){
	$('input[id=order_]').attr('value',"distance");}

function lowprice_(){
	$('input[id=order_]').attr('value',"lowprice");}

function highprice_(){
	$('input[id=order_]').attr('value',"highprice");}
//거리, 가격 정렬 ajax하다 보류
/*function aaorder() {
	order = document.getElementById('order').value;
	alert(order+"sfdgg");

	var acclist = [];
	$('input[name="acc_name"]').each(function(i) {// 체크된 리스트 저장
		acclist.push($(this).val());
	});
	jQuery.ajaxSettings.traditional = true;

	$.ajax({
		url : "order?order="+order,
		dataType : "json",
		contentType : "application/x-www-form-urlencoded; charset=UTF-8",
		type : "get",
		data : {
			acclist : acclist
		},
		success : function(result){ alert("fgsdfss");
			
			}})}*/
function openOrder() {
	
	document.getElementById('map-modal-bg').classList.add('map-modal-bg');
	document.getElementById('map-modal-container').classList.add('map-modal-container');
	document.getElementById('order-container').classList.add('order-modal-container');
	document.getElementById('order-container').classList.remove('order-container');
}

//맵 여는 기능	
function openMap() {

	// ajax로 현재 정렬된 업체리스트 지도에 마커표시
	var acclist = [];

	$('input[id="acccode"]').each(function(i) {// 체크된 리스트 저장
		acclist.push($(this).val());
	});
	jQuery.ajaxSettings.traditional = true;

	$.ajax({
		url : "openmap",
		dataType : "json",
		contentType : "application/x-www-form-urlencoded; charset=UTF-8",
		type : "post",
		data : {
			acclist : acclist
		},
		success : function(result){ 
			var positions = [];
			if(result.result.length==0){
				alert("조건에 맞는 숙소가 없습니다.");
				return;
			}
			for (var i = 0; i < result.result.length; i++) {
				positions.push({
							content : '<div><a style="color : black;" href="kdetail_page?acc_code='+result.result[i][0].acc_code+'">' + result.result[i][1].acc_name
									+ '</a></div>',
							latlng : new kakao.maps.LatLng(
									result.result[i][2].acc_latitude,
									result.result[i][3].acc_longitude)

						});
			}

			var mapContainer = document.getElementById('map-container'), // 지도를
																			// 표시할
																			// div
			mapOption = {
				center : new kakao.maps.LatLng(userlatitude, userlongitude), // 지도의
																				// 중심좌표
				level : 3
			// 지도의 확대 레벨
			};
			map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

			for (var i = 0; i < positions.length; i++) {
				// 마커를 생성합니다
				var marker = new kakao.maps.Marker({
					map : map, // 마커를 표시할 지도
					position : positions[i].latlng
				// 마커의 위치
				});

				// 마커에 표시할 인포윈도우를 생성합니다
				var infowindow = new kakao.maps.InfoWindow({
					content : positions[i].content,
					removable : true
				// 인포윈도우에 표시할 내용
				});

				// 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
				// 이벤트 리스너로는 클로저를 만들어 등록합니다
				// for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
				kakao.maps.event.addListener(marker, 'click',
						makeClickListener(map, marker, infowindow));
			
			}

			// 인포윈도우를 표시하는 클로저를 만드는 함수입니다
			function makeClickListener(map, marker, infowindow) {
				return function() {
					infowindow.open(map, marker);
				};
			}

		

			document.getElementById('map-container').classList
					.add('map-modal-wrap');
			document.getElementById('map-modal-bg').classList
					.add('map-modal-bg');
			document.getElementById('map-modal-container').classList
					.add('map-modal-container');
			map.relayout();
		}

	});

}
// 맵닫기
function closeMap() {
	document.getElementById('map-modal-bg').classList.remove('map-modal-bg');
	document.getElementById('map-container').classList.remove('map-modal-wrap');
	document.getElementById('order-container').classList.remove('order-modal-container');
	document.getElementById('map-modal-container').classList.remove('map-modal-container');
	document.getElementById('order-container').classList.add('order-container');
	map.relayout();
	

}

// 사용자 위치
navigator.geolocation.getCurrentPosition(function(pos) {
	userlatitude = pos.coords.latitude;
	userlongitude = pos.coords.longitude;
	document.getElementById('user_latitude').value = userlatitude;
	document.getElementById('user_longitude').value = userlongitude;

});

var mql = window.matchMedia("screen and (max-width: 992px)");

mql.addListener(function(e) {
	if (e.matches) {
		changedate2();
		

	} else {
		
		changedate();
		document.getElementById('bodyclass3').classList.remove('lock_on');
		document.getElementById('bodyclass4').classList.remove('lock_on');
		document.getElementById('bodyclass5').classList.remove('lock_on');
		document.getElementById('bodyclass6').classList.remove("lock_on2");
		document.getElementById('bodyclass7').classList.remove('lock_on');
		document.getElementById('bodyclass9').classList.remove('aaon');
		document.getElementById('bodyclass10').classList.remove('lock_on');
		document.getElementById('detail_form').classList
				.remove('detail_form_fix');
	}
});

function openCity(evt, cityName) {
	/* Declare all variables */
	var i, tabcontent, tablinks;

	/* Get all elements with class="tabcontent" and hide them */
	tabcontent = document.getElementsByClassName("tabcontent");
	for (i = 0; i < tabcontent.length; i++) {
		tabcontent[i].style.display = "none";
	}

	/* Get all elements with class="tablinks" and remove the class "active" */
	tablinks = document.getElementsByClassName("tablinks");
	for (i = 0; i < tablinks.length; i++) {
		tablinks[i].className = tablinks[i].className.replace(" active", "");
	}

	/*
	 * Show the current tab, and add an "active" class to the link that opened
	 * the tab
	 */
	document.getElementById(cityName).style.display = "block";
	evt.currentTarget.className += " active";
}

function calc_go(plus_minus) {
	var val = parseInt(document.getElementById("res").innerHTML);
	var val2 = parseInt(document.getElementById("person").value);
	if (plus_minus == "-") {
		val -= 1;
		val2 -= 1;
	}
	if (plus_minus == "+") {
		val += 1;
		val2 += 1;
	}

	document.getElementById("res").innerText = val;
	document.getElementById("person").value = val2;
	if (val < 2)
		document.getElementById("minus").disabled = true;
	else if (val == 10)
		document.getElementById("plus").disabled = true;
	else {
		document.getElementById("minus").disabled = false;
		document.getElementById("plus").disabled = false;

	}
}

function reset_all() {
	document.getElementById('dist_text').value=1;
    document.getElementById('dist_send').value=1;
	document.getElementById("res").innerText = "2";
	document.getElementById("minus").disabled = false;
	document.getElementById("plus").disabled = false;
	document.getElementById("box1").checked = false;
	document.getElementById("text1").style.color = "black";
	document.getElementById("img1").src = "resources/img/single-black.png";
	document.getElementById("box2").checked = false;
	document.getElementById("text2").style.color = "black";
	document.getElementById("img2").src = "resources/img/double-black.png";
	document.getElementById("box3").checked = false;
	document.getElementById("text3").style.color = "black";
	document.getElementById("img3").src = "resources/img/twin-black.png";
	document.getElementById("box4").checked = false;
	document.getElementById("text4").style.color = "black";
	document.getElementById("img4").src = "resources/img/ondol-black.png";
	document.getElementById('order_').value = "recommend";
	classremove();
    document.getElementById('recommend').classList.add('order-active');
    document.getElementById('ordertext').innerText="추천 순";
    if(document.getElementById('dist_text').value==1){document.getElementById('dist_text').innerHTML = "서울 > 강남/역삼/삼성/신사/청담";}
    if(document.getElementById('dist_text').value==2){document.getElementById('dist_text').innerHTML = "부산 > 해운대(센텀,송정)";}
    if(document.getElementById('dist_text').value==3){document.getElementById('dist_text').innerHTML = "제주 > 제주공항/애월/함덕";}
}
function singleroom() {
		if (document.getElementById("box1").checked) {
			document.getElementById("img1").src = "resources/img/single-black.png";
			document.getElementById("text1").style.color = "black";
			document.getElementById("box1").checked = false;
		} else {
			document.getElementById("img1").src = "resources/img/single-red.png";
			document.getElementById("text1").style.color = "red";
			document.getElementById("box1").checked = true;
		}
	}
function doubleroom() { 
		if (document.getElementById("box2").checked) {
			document.getElementById("img2").src = "resources/img/double-black.png";
			document.getElementById("text2").style.color = "black";
			document.getElementById("box2").checked = false;
		} else {
			document.getElementById("img2").src = "resources/img/double-red.png";
			document.getElementById("text2").style.color = "red";
			document.getElementById("box2").checked = true;
		}
	}
function twinroom()  {
		if (document.getElementById("box3").checked) {
			document.getElementById("img3").src = "resources/img/twin-black.png";
			document.getElementById("text3").style.color = "black";
			document.getElementById("box3").checked = false;
		} else {
			document.getElementById("img3").src = "resources/img/twin-red.png";
			document.getElementById("text3").style.color = "red";
			document.getElementById("box3").checked = true;
		}
	}
function ondolroom()  {
	if (document.getElementById("box4").checked) {
		document.getElementById("img4").src = "resources/img/ondol-black.png";
		document.getElementById("text4").style.color = "black";
		document.getElementById("box4").checked = false;
	} else {
		document.getElementById("img4").src = "resources/img/ondol-red.png";
		document.getElementById("text4").style.color = "red";
		document.getElementById("box4").checked = true;
	}
}


$(function() {
	var dateFormat = "yy-mm-dd", from = $("#from").datepicker({
		// defaultDate: "+1w",
		changeMonth : true,
		numberOfMonths : 1,
		minDate : 0
	}).on("change", function() {
		to.datepicker("option", "minDate", getDate(this));
	}), to = $("#to").datepicker({
		defaultDate : "+1d",
		changeMonth : true,
		numberOfMonths : 1,
		minDate : 0
	}).on("change", function() {
		from.datepicker("option", "maxDate", getDate(this));
	});

	function getDate(element) {
		var date;
		try {
			date = $.datepicker.parseDate(dateFormat, element.value);
		} catch (error) {
			date = null;
		}
		return date;
	}
});

function class_change() {
	document.getElementById('bodyclass3').className += ' lock_on'
	document.getElementById('bodyclass4').className += ' lock_on'
	document.getElementById('bodyclass5').className += ' lock_on'
	document.getElementById('bodyclass6').className += ' lock_on2'
	document.getElementById('bodyclass7').className += ' lock_on'
	document.getElementById('bodyclass9').className += ' aaon'
	document.getElementById('bodyclass10').className += ' lock_on'
	document.getElementById('detail_form').classList.add("detail_form_fix");
}

function removeFooClass() {
	document.getElementById('bodyclass3').classList.remove('lock_on');
	document.getElementById('bodyclass4').classList.remove('lock_on');
	document.getElementById('bodyclass5').classList.remove('lock_on');
	document.getElementById('bodyclass6').classList.remove('lock_on2');
	document.getElementById('bodyclass7').classList.remove('lock_on');
	document.getElementById('bodyclass9').classList.remove('aaon');
	document.getElementById('bodyclass10').classList.remove('lock_on');
	document.getElementById('detail_form').classList.remove('detail_form_fix');
}

/*===========================날짜에 오늘날짜 넣기 ===*/
window.onload = function(){
    var date = new Date();
    var year = date.getFullYear();
    var month = ("0" + (1 + date.getMonth())).slice(-2);
    var day = ("0" + date.getDate()).slice(-2);
    var nextday = ("0" + (date.getDate()+1)).slice(-2);

   let initdate = year + "-" + month + "-" + day + " - " +year + "-" + month + "-" + nextday;
   if(document.getElementById('date_text1').value==""){
document.getElementById('date_text1').value = initdate;
document.getElementById('date_text2').value = initdate; 
var id = document.getElementsByClassName("accdate");
for(i=0;i<id.length;i++){
	id[i].value = initdate;
}
	
   
   }

}; 






