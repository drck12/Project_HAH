<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="resources/css/Cjoin.css" />
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript"
	src="resources/script/Cjoin.js?v=<%=new java.util.Date().getTime()%>"></script>
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.1/js/all.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
</head>
<body>
	<form class="section" action="mainjoin" method="post">
		<div id="join_check_form">
			<strong class="title">저기어때 약관 동의</strong>
			<div>
				<div class="joinform">
					<p>
						<input name="aaa" id="all_select" value="selectAll"
							type="checkbox" onclick="selectAll(this);" /><a
							class="all-check" href="#">전체동의</a>
					</p>
					<p>
						<input name="requiredCheck1" type="checkbox" id="requiredCheck1" value="yes"
							id="terms" required /><a href="${pageContext.request.contextPath}/more/terms">이용약관 동의</a><span>(필수)</span>
					</p>
					<p>
						<input name="requiredCheck2" type="checkbox" id="requiredCheck2" value="yes"
							id="teenager" required /><a href="${pageContext.request.contextPath}/more/terms">만 14세 이상 확인</a><span>(필수)</span>
					</p>
					<p>
						<input name="requiredCheck3" type="checkbox" id="requiredCheck3" value="yes"
							id="privacy" required /><a href="${pageContext.request.contextPath}/more/terms">개인정보 수집 및 이용 동의</a><span>(필수)</span>
					</p>
					<p>
						<input name="selCheck1" type="checkbox" id="selCheck1" value="yes" /><a href="${pageContext.request.contextPath}/more/terms">개인정보
							수집 및 이용 동의</a>(선택)
					</p>
					<p>
						<input name="selCheck2" type="checkbox" id="selCheck2" value="yes" /><a href="${pageContext.request.contextPath}/more/terms">위치기반
							서비스 이용약관 동의</a>(선택)
					</p>
					<button style="cursor: pointer;" type="button" onclick="join_next();" class="btn-next"
						disabled>
						<span>다음</span>
					</button>
				</div>
			</div>
		</div>


		<div id="join_sms_form" class="join_form_none">
			<div class="title">
				<strong>휴대폰 본인 확인</strong>
			</div>
			<p>원활한 서비스 제공을 위해, 휴대폰 번호를 입력해주세요.</p>

			<div>
				<p>휴대폰 번호</p>
				<div class="input_wrap">
					<input autocomplete="off" class="input_number" name="phone" type="text" id="phone" maxlength="11" />
				</div>
				<button  style="cursor: pointer;" disabled class="btn-sms btn-action" type="button"
					onclick="sendSms();">인증번호 전송</button>
			</div>



			<div id="check_number_form" class="check_number_off">
				<p>인증 번호</p>
				<div class="input_wrap">
					<input autocomplete="off" class="input_number" type="text" id="certificationNumber"
						type="text" maxlength="4" />
				</div>
				<button style="cursor: pointer;" disabled class="btn-sms btn-action2" type="button"
					onclick="checkSms();">확인</button>
			</div>
		</div>
		<div id="join_user_form" class="join_user_off">
			<div class="join_user_title">
				<a href="#">여기어때</a>
			</div>
			<div>
				<div class="sub_title">
					<strong>회원가입</strong><br />
				</div>
				<b>이메일 아이디</b>
				<div class="input_form_wrap">
					<input autocomplete="off" id="email" type="email" title="이메일을 " name="email" class="chk" />
					<div class="valid">이메일을 입력하세요.</div>
					<!-- <input type="email" name="uid" id="gcuseremail" required placeholder="이메일 주소를 입력해주세요."> -->
				</div>
				<b>비밀번호</b>
				<div class="input_form_wrap">
					<input  type="password" title="비밀번호를 " name="pw" class="chk" />
					<div class="valid">비밀번호를 입력하세요. (영문 대/소문자, 숫자를 모두 포함)</div>
					<!-- <input type="password" name="upw" required placeholder="비밀번호를 입력해주세요." id="new_pw"> -->
				</div>
				<b>비밀번호 확인</b>
				<div class="input_form_wrap">
					<input type="password" title="비밀번호 확인을 " name="pw_ck" class="chk" />
					<div class="valid">비밀번호를 다시 입력하세요.</div>
					<!-- <input type="password" name="upw_retry" required placeholder="비밀번호를 입력해주세요." id="new_pw_re"> -->
				</div>
				<b>닉네임</b>
				<div>
					<input autocomplete="off" type="text" id="unick" name="unick" required minlength="2"
						maxlength="10" spacechar="false" specialchar="true">
				</div>
				<button style="cursor: pointer;" id="joinBtn" type="button" onclick="go_join();"
					class="join_btn">
					<span>가입하기</span>
				</button>
				





			</div>
		</div>
	</form>
	<script>
		// 휴대폰 번호 검증
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
							if (temp.length >= 11) {
								if (/(010[1-9][0-9]{7})/.test(temp)) {
									document
											.getElementsByClassName("btn-action")[0].style.backgroundColor = 'rgb(242,17,76)';
									document
											.getElementsByClassName("btn-action")[0].disabled = false;
								} else {
									alert("올바른 휴대폰 형식이 아닙니다.")
								document.getElementById('phone').value = "";
									document
											.getElementsByClassName("btn-action")[0].disabled = true;

								}
							} else {
							
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
								document.getElementsByClassName("btn-action2")[0].disabled = false;

							} else {
					
								document.getElementsByClassName("btn-action2")[0].disabled = true;
							}

						});
		// ajax로 메세지 보내기
		function sendSms() {
			document.getElementsByClassName("btn-action")[0].innerHTML = "재전송";
			document.getElementById('check_number_form').classList
					.add('check_number_on');

			var a = {
				"phone" : $("#phone").val()
			};
			jQuery.ajaxSettings.traditional = true;
			$.ajax({
						url : "sendsms",
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

		$('.chk').on('keyup', function() {
			if ($(this).attr('name') == 'id') {
				if (event.keyCode == 13) {
					id_check();
				} else {
					$(this).removeClass('chked');
					validate($(this));
				}
			} else {
				validate($(this));
			}
		});
		// 유효성검사 실시간 확인
		function validate(t) {
			var data = join.tag_status(t);
			display_status(t.siblings('div'), data);
		}

		function display_status(div, data) {
			div.text(data.desc);
			div.removeClass();
			div.addClass(data.code)
		}
		
		// 가입 버튼에서 이메일 패스워드, 패스워드확인, 닉네임 유효성 검사하고 유효하면 submit으로 진행
		function go_join() {
			  if (!item_check($('[name=email]')))
				return;
			if (!item_check($('[name=pw]')))
				return;
			if (!item_check($('[name=pw_ck]')))
				return;
			if (!item_check($('[name=unick]')))
				return;
			  
			
			var a = {
					"email" : $("#email").val()
				};
			//이메일 중복여부 체크하여 중복 없으면 insert 진행
			$.ajax({
				url : "emailcheck",
				dataType : "text",
				contentType : "application/x-www-form-urlencoded; charset=UTF-8",
				type : "post",
				data : a,
				success : function(result) {
					if(result=="success"){
						$('form').submit();
				}else if(result=="fail"){
					alert("이미 가입된 메일입니다.");
					}
				},
				error : function(a, b, c) {

					alert(a + b + c);
				}
			})
			
			
		}
	</script>
</body>
</html>