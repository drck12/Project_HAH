<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="${pageContext.request.contextPath}/resources/script/myinfo_page.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/myinfo/myinfo_page.css" />
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
					<li><a class="res_history" href="myinfo_reserve">예약 내역</a></li>
					<li><a class="myinfo_page" href="">내 정보 관리</a></li>

				</ul>
			</div>
			<div class="info_layout">
					<div class="info_top">
						<strong>내 정보 수정</strong>
					</div>
			<form action="nik_modify">
					<div class="info_nik">
						<div class="info_nik_title">
							<b>닉네임</b>
							<span class="login_nik">${loginUser.mem_nick}</span>
						</div>
					
					
					<div class="nik_modify_section" id="nik_modify_section" style="display: none;">
						<div class="nik_modify_wrap">
						
						
							<input minlength="2" required oninput="this.value = this.value.replace(/ /gi,'');" name="nik_modify_text" type="text" maxlength="10" placeholder="체크인시 필요한 정보입니다."/>
						
					
						</div>
					</div>
					
					<div class="nik_modify_layout">
						<button type="button" id="nik_modify_btn" class="nik_modify_btn" onclick="nik_modify_on();">
							수정
						</button>
						
						<button id="nik_modify_finish_btn" class="nik_modify_finish_btn">
							수정완료
						</button>
						
						
						<button type="button" id="nik_modify_cancel_btn" class="nik_modify_cancel_btn" onclick="nik_cancel_on();">
							수정취소
						</button>
					</div>
				</div>
			</form>
				
				<!--예약자 이름-->
				<!-- <div class="info_res">
						<div class="info_res_title">
							<b>예약자 이름</b>
						</div>
					
					
					<div class="res_modify_section" id="res_modify_section" style="display: none;">
						<div class="res_modify_wrap">
							<input type="text" value="" placeholder="체크인시 필요한 정보입니다."/>
						</div>
					</div>
					
					<div class="res_modify_layout">
						<button type="button" id="res_modify_btn" class="res_modify_btn" onclick="res_modify_on();">
							수정
						</button>
						
						<button type="button" id="res_modify_finish_btn" class="res_modify_finish_btn">
							수정완료
						</button>
						
						<button type="button" id="res_modify_cancel_btn" class="res_modify_cancel_btn" onclick="res_cancel_on();">
							수정취소
						</button>
					</div>
				</div> -->
					
				<!--휴대폰 번호-->
			<form action="phone_modify">	
				<div class="info_phone">
						<div class="info_phone_title">
							<b>휴대폰 번호</b>
							<span class="phone_num">${loginUser.mem_phone}</span>
							<div class="phone_blurb">개인 정보 보호를 위해 내 정보는 모두 안전하게 암호화됩니다.</div>
						</div>
					
					
					<div class="phone_modify_section" id="phone_modify_section" style="display: none;">
						<div class="phone_modify_wrap">
							<input id="phone" type="text" placeholder="' - ' 없이 숫자만 입력하세요."/>
							<input type="hidden" id="phone_modify_number" name="phone_modify_text" />
							<button type="button" onclick="sendSms();" id="phone_certification" class="phone_certification">
							인증번호 전송
						</button>
						</div>
						
						
						
					</div>
					
					<div id="check_number_form" class="check_number_off">
						<div class="phone_certification_num">
						<p>인증 번호</p>
						</div>
							<div class="input_wrap">
								<input class="input_number" type="text" id="certificationNumber"
										type="text" maxlength="4" />
						<button disabled class="btn-sms btn-action2" type="button"
								onclick="checkSms();">확인</button>
							</div>
					</div>
					
					<div class="phone_modify_layout">
						<button type="button" id="phone_modify_btn" class="phone_modify_btn" onclick="phone_modify_on();">
							수정
						</button>
						
						<button disabled id="phone_modify_finish_btn" class="phone_modify_finish_btn">
							수정완료
						</button>
						
						<button type="button" id="phone_modify_cancel_btn" class="phone_modify_cancel_btn" onclick="phone_cancel_on();">
							수정취소
						</button>
					</div>
				</div>
			</form>	
			
			
<div class="hate_you">
	<p>여기어때를 이용하고 싶지 않으신가요?</p>
	<button type="button" OnClick="location.href ='../logout'">로그아웃</button>
	<button type="button" id="member_leave" onclick="leave_modal_on();">회원탈퇴</button>

</div>
</div>

			</div>
		</div>

<script>
function sendSms() {
	document.getElementsByClassName("phone_certification")[0].innerHTML = "재전송";
	document.getElementById('check_number_form').classList.add('check_number_on');

	var a = {
		"phone" : $("#phone").val()
	};
	jQuery.ajaxSettings.traditional = true;
	$.ajax({
				url : "../sendsms",
				dataType : "text",
				contentType : "application/x-www-form-urlencoded; charset=UTF-8",
				type : "post",
				data : a,
				success : function(result) {
					target.value = "재전송";
					target.disabled = true;
				},
				error : function(a, b, c) {

					alert(a + b + c);
				}
			})
};

$("#phone")
.bind(
		"keyup",
		function(event) {
			var regNumber = /^[0-9]*$/;
			var temp = $("#phone").val();
			if (!regNumber.test(temp)) {
				console.log('숫자만 입력하세요');
				$("#phone").val(temp.replace(/[^0-9]/g, ""));
			}
			if (temp.length >= 11 && temp.length <= 12) {
				if (/(010[1-9][0-9]{7})/.test(temp)) {
					document
							.getElementsByClassName("phone_certification")[0].style.backgroundColor = 'rgb(242,17,76)';
					document
							.getElementsByClassName("phone_certification")[0].disabled = false;
				} else {
					alert("올바른 휴대폰 형식이 아닙니다.")
					document
							.getElementsByClassName("phone_certification")[0].style.backgroundColor = 'rgb(239,239,239,1)';
					document
							.getElementsByClassName("phone_certification")[0].disabled = true;

				}
			} else {
				document.getElementsByClassName("phone_certification")[0].style.backgroundColor = 'rgb(239,239,239,1)';
				document.getElementsByClassName("phone_certification")[0].disabled = true;

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
				document.getElementsByClassName("btn-action2")[0].disabled = false;

			} else {
				document.getElementsByClassName("btn-action2")[0].style.backgroundColor = 'rgb(239,239,239,1)';
				document.getElementsByClassName("btn-action2")[0].disabled = true;
			}

		});

</script>


</body>
</html>