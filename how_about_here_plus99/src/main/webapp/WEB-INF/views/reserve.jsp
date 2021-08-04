<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.1/js/all.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript"
	src="resources/script/reserve.js?v=4"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/contenta.css?ver=5" />
</head>
<body>
<form action="reservation" method="post">
<input type="hidden" name="acc_code" value="${reserve.acc_code }" />
<input type="hidden" name="room_code" value="${reserve.room_code }" />
	<div class="content">
	<div class="modal_off" id="map-modal-container-pay">
		<div class="" id="modal-container-pay">
			<div class="openModal">
				<strong>예약내역 확인</strong>
				<div class="confirm_detail">
					<div>
						<p class="name ellip">${reserve.acc_name }</p>
						<p class="name">${reserve.r_type }/ ${accdays }박</p>
						<p class="chkin_print_date">
							<span>체크인 </span> <b>${reserve.s_date }</b>
						</p>
						<p class="chkout_print_date">
							<span>체크아웃</span> <b>${reserve.e_date }</b>
						</p>
						<ul id="refund_policy">
							<li class="dot_txt">미성년자는 보호자 동반 시 투숙이 가능합니다.</li>
							<li class="dot_txt"><b>취소 시 환불이 불가</b>합니다.</li>
						</ul>

					</div>

					<div class="confirm_btn">
						<button type="button" class="cancel" onclick="closeMap_pay()">취소</button>
						<button type="button" onclick="pay();" class="agrre_payment">동의 후 결제</button>

					</div>
				</div>
			</div>

		</div>

		<div class="" id="map-modal-bg-pay" onclick="closeMap_pay()"></div>
	</div>

		<div class="reserve">
		<div class="react_right">
				<div class="react_info">
					<p class="name">
						<strong>숙소이름</strong> ${reserve.acc_name }
					</p>
					<p>
						<strong>객실타입/기간</strong> ${reserve.r_type }/ ${accdays }박
					</p>
					<p>
						<strong>체크인</strong> ${reserve.s_date }
					</p>
					<p>
						<strong>체크아웃</strong> ${reserve.e_date }
					</p>
				</div>
				<div class="section" id=react_total_price>
					<p>
						<strong> <b>총 결제 금액</b> (VAT포함)
						</strong> <span class="react_in_price">${reserve.r_price }원</span>
					</p>
					<ul>
						<li>해당 객실가는 세금, 봉사료가 포함된 금액입니다</li>
						<li>결제완료 후 <span>예약자 이름</span> 으로 바로 <span>체크인</span> 하시면
							됩니다.
						</li>
					</ul>
				</div>
			</div>
		<div class="left">
			<div class="title">
				<strong>예약자 정보</strong>
			</div>
			<p>예약자 이름</p>
			
				<div>
				
				<div class="input_wrap">
					<input autocomplete="off" class="input_form input_name" onchange="name_change(this.value);" id="reservename" name="r_name" type="text"  maxlength="11" />
				</div>
			</div>
			
						
							
			
				<div id="join_sms_form" class="join_form_none">
			<div class="title">
				<strong>휴대폰 본인 확인</strong>
			</div>
			<p>원활한 서비스 제공을 위해, 휴대폰 번호를 입력해주세요.</p>

			<div>
				
				<div class="input_wrap">
					<input autocomplete="off" class="input_form" onchange="tel_change(this.value);" id="phonenumber" name="r_phone" type="text" maxlength="11" />
				</div>
				<button disabled class="btn-sms btn-action" type="button"
					onclick="sendSms();">인증번호 전송</button>
			</div>



			<div id="check_number_form" class="check_number_off">
				<p>인증 번호</p>
				<div class="input_wrap">
					<input autocomplete="off" class="input_form" type="text" id="certificationNumber"
						type="text" maxlength="4" />
				</div>
				<button disabled class="btn-sms btn-action2" type="button"
					onclick="checkSms();">확인</button>
			</div>
		</div>
					
					
             <c:if test="${loginUser == null }">
            <div class="guest_login" style="display: block;">
						<a href="login.do"> 로그인 후 예약하시면 <br /> 할인 쿠폰과 추가 혜택을 받을 수 있어요
							<br /> <span>로그인</span>
						</a>
					</div>
              </c:if>
					
					
					
					
					




				
				<div class="react_pirce_tag">
					<p>
						<strong> <b>총 결제 금액</b> (VAT포함)
						</strong> <span class="in_price_app">${reserve.r_price }원</span>
					</p>
					<ul>
						<li>해당 객실가는 세금, 봉사료가 포함된 금액입니다.</li>
						<li>결제 완료 후 <span>예약자 이름</span> 으로 바로 <span>체크인</span> 하시면
							됩니다
						</li>
					</ul>
				</div>

				<div class="pay_select">
					<h3>결제수단선택</h3>
					<select id="payment_select" onchange="select_change(this.value);" class="select_type_1"
						style="margin: 0;">
						<option class="select_pay" value="kakaopay">카카오페이</option>
						<option class="select_pay" value="card" >신용/체크카드</option>
						<option class="select_pay" value="trans">실시간계좌이체</option>
						<option class="select_pay" value="payco">PAYCO</option>
						<option class="select_pay" value="phone">휴대폰결제</option>
					</select>
				</div>

				<div class="agree">
					<p class="all_check">
						<label for=""> <input type="checkbox"
							onclick="selectAll(this);" name="checkAll" class="inp_chk02" />
							<span>전체 동의</span>
						</label>
					</p>

					<p>
						<input id="chk1" type="checkbox" name="checkOne" class="inp_chk02" /> 
						<a href="${pageContext.request.contextPath}/more/terms"><span
							onclick="openModal2();"> <i>숙소이용규칙 및 취소/환불규정 동의</i> <b>(필수)</b>
						</span></a>

					</p>

					<p>
						<input id="chk2" type="checkbox" name="checkOne" class="inp_chk02" /> 
						<a href="${pageContext.request.contextPath}/more/terms"><span
							onclick=""> <i>개인정보 수집 및 이용 동의</i> <b>(필수)</b>
						</span></a>

					</p>

					<p>
						<input id="chk3" type="checkbox" name="checkOne" class="inp_chk02" /> 
						<a href="${pageContext.request.contextPath}/more/terms"><span
							onclick=""> <i>개인정보 제 3자 제공 동의</i> <b>(필수)</b>
						</span></a>

					</p>

					<p class="guest_chk_area">
						<input id="chk4" type="checkbox" name="checkOne" class="inp_chk02" /> 
						<a href="${pageContext.request.contextPath}/more/terms"><span
							onclick=""> <i>개인정보 제 3자 제공 동의</i> <b>(필수)</b>
						</span></a>

					</p>

				</div>


<button type="button" class="btn_pay_react" onclick="openModal_pay()">결제하기</button>
			</div>
			<div class="right">
				<div class="section" id="info">
					<p class="name">
						<strong>숙소이름</strong> <div id="accname">${reserve.acc_name }</div>
						<input type="hidden" name="acc_name" id="acc_name_hidden" value="${reserve.acc_name }" />
					</p>
					<p>
						<strong>객실타입/기간</strong> <div id="r_type">${reserve.r_type}</div> / <div id="r_date">${accdays }박</div>
						<input type="hidden" name="r_type" id="r_type_hidden" value="${reserve.r_type}"/>
						<input type="hidden" name="r_date" id="r_date_hidden" value="${accdays }"/>
					</p>
					<p>
						<strong>체크인</strong > <div id="s_date">${reserve.s_date }</div> 
						<input type="hidden" name="s_date" id="s_date_hidden" value="${reserve.s_date }"/>
					</p>
					<p>
						<strong>체크아웃</strong> <div id="e_date">${reserve.e_date }</div> 
						<input type="hidden" name="e_date" id="e_date_hidden" value="${reserve.e_date }"/>
					</p>
				</div>

				<div class="section" id=total_price>
					<p>
						<strong> <b>총 결제 금액</b> (VAT포함)
						</strong> <span id="r_price" class="react_in_price">${reserve.r_price }원</span>
						<input type="hidden" name="r_price" id="r_price_hidden" value="${reserve.r_price }"/>
					</p>
					<ul>
						<li>해당 객실가는 세금, 봉사료가 포함된 금액입니다</li>
						<li>결제완료 후 <span>예약자 이름</span> 으로 바로 <span>체크인</span> 하시면
							됩니다.
						</li>
					</ul>
				</div>



				<button type="button" class="pay_btn" onclick="openModal_pay()">결제하기</button>
			</div>
			
			
			

			
		</div>
	</div>
</form>

<script>
/* document.getElementById('acc_name_hidden').value = document.getElementById('accname').innerText;
document.getElementById('r_type_hidden').value = document.getElementById('r_type').innerText;
document.getElementById('r_date_hidden').value = document.getElementById('r_date').innerText;
document.getElementById('s_date_hidden').value = document.getElementById('s_date').innerText;
document.getElementById('e_date_hidden').value = document.getElementById('e_date').innerText;
document.getElementById('r_price_hidden').value = document.getElementById('r_price').innerText; */


var IMP = window.IMP; // 생략가능
IMP.init('imp22649016');

accname = document.getElementById('accname').innerText;
roomprice = document.getElementById('r_price_hidden').value;
reserve_name = document.getElementById('reservename').value;
reserve_phone = document.getElementById('phonenumber').value;
sel="kakaopay";
sel2 = "card";
str=""
 function select_change(str){
	 if(str=='kakaopay' || str=='payco'){
			sel = str;
			/* alert(sel); */
		}else{
			sel2 = str;
			sel = "html5_inicis";
		} 
	 
 }
 function name_change(str){
		 reserve_name=str;
}
 function tel_change(str){
	 /* alert(str); */
	 reserve_tel=str;
}

	
	function pay(){
		
		var IMP = window.IMP; // 생략가능
		IMP.init('imp22649016');

		IMP.request_pay({
		    pg : sel, // version 1.1.0부터 지원.
		    pay_method : sel2,
		    merchant_uid : 'merchant_' + new Date().getTime(),
		    name : accname,
		    amount : roomprice,
		    buyer_email : 'iamport@siot.do',
		    buyer_name : reserve_name,
		    buyer_tel : reserve_tel,
		    m_redirect_url : 'https://www.yourdomain.com/payments/complete'
		}, function(rsp) {
		    if ( rsp.success ) {
		        var msg = '결제가 완료되었습니다.';
		        msg += '고유ID : ' + rsp.imp_uid;
		        msg += '상점 거래ID : ' + rsp.merchant_uid;
		        msg += '결제 금액 : ' + rsp.paid_amount;
		        msg += '카드 승인번호 : ' + rsp.apply_num;
		        $('form').submit();
		    } else {
		        var msg = '결제에 실패하였습니다.';
		        msg += '에러내용 : ' + rsp.error_msg;
		        alert(msg);
		        
		    }
		    
		});};



$("#phonenumber")
.bind(
		"keyup",
		function(event) {
			var regNumber = /^[0-9]*$/;
			var temp = $("#phonenumber").val();
			if (!regNumber.test(temp)) {
				console.log('숫자만 입력하세요');
				$("#phonenumber").val(temp.replace(/[^0-9]/g, ""));
			}
			if (temp.length >= 11) {
				if (/(010[1-9][0-9]{7})/.test(temp)) {
					document.getElementsByClassName("btn-action")[0].style.backgroundColor = 'rgb(242,17,76)';
					document.getElementsByClassName("btn-action")[0].style.color = 'white';
					document.getElementsByClassName("btn-action")[0].disabled = false;
				} else {
					alert("올바른 휴대폰 형식이 아닙니다.")
					document.getElementsByClassName("btn-action")[0].style.backgroundColor = 'rgb(239,239,239,1)';
					document.getElementsByClassName("btn-action")[0].style.color = 'black';
					document.getElementsByClassName("btn-action")[0].disabled = true;

				}
			} else {
				document.getElementsByClassName("btn-action")[0].style.backgroundColor = 'rgb(239,239,239,1)';
				document.getElementsByClassName("btn-action")[0].style.color = 'black';
				document.getElementsByClassName("btn-action")[0].disabled = true;

			}

		});

$("#certificationNumber")
.bind(
		"keyup",
		function(event) {
			var regNumber = /^[0-9]*$/;
			var temp = $("#certificationNumber").val();
			if (!regNumber.test(temp)) {
				console.log('숫자만 입력하세요');
				$("#certificationNumber").val(
						temp.replace(/[^0-9]/g, ""));
			}
			if (temp.length >= 4) {
				document.getElementsByClassName("btn-action2")[0].style.backgroundColor = 'rgb(242,17,76)';
				document.getElementsByClassName("btn-action2")[0].style.color = 'white';
				document.getElementsByClassName("btn-action2")[0].disabled = false;

			} else {
				document.getElementsByClassName("btn-action2")[0].style.backgroundColor = 'rgb(239,239,239,1)';
				document.getElementsByClassName("btn-action2")[0].style.color = 'black';
				document.getElementsByClassName("btn-action2")[0].disabled = true;
			}

		});
		
	/* 문자보내기 */	
function sendSms() {
	document.getElementsByClassName("btn-action")[0].innerHTML = "재전송";
	document.getElementById('check_number_form').classList.add('check_number_on');
	
	var a = {
		"phone" : $("#phonenumber").val()
	};
	jQuery.ajaxSettings.traditional = true;
	$.ajax({
				url : "sendsms",
				dataType : "text",
				contentType : "application/x-www-form-urlencoded; charset=UTF-8",
				type : "post",
				data : a,
				success : function(result) {
					
					
				},
				error : function(a, b, c) {

					alert(a + b + c);
				}
			})
};




		
		
		
		
		
		
		
		
		

</script>



</body>
</html>