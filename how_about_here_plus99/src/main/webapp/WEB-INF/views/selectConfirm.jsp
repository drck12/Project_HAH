<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="resources/css/selectConfirm.css" />
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.1/js/all.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
</head>
<body>
	<div class="body_form">
			<div class="join_user_title">
				<a href="main">여기어때</a>
			</div>
		<div id="certify_form">
			<div class="select_form">
				<input class="font" type="radio" id="email" name="type" value="${email }" />
				<input type="hidden" id="email_" value="${email_ }" />
				<label class="info" for="email" ><strong>등록된 이메일로 인증번호 받기</strong><br /><span>${email }</span></label>
			</div>
			<div class="select_form">
				<input class="font"  type="radio" id="phone" name="type" value="${phone }"/>
				<input type="hidden" id="phone_" value="${phone_ }"/>
				<label class="info" for="phone" ><strong>등록된 휴대폰번호로 인증번호 받기</strong><br /><span>${phone }</span></label>
			</div>
			<input type="hidden" id="sel_type" value="111"/>
	

			<button onclick="send_Certification();" id="send_btn" class="btn-submit">인증번호 전송</button>	
			
			<div id="check_number_form" class="check_number_off">
				<p>인증 번호</p>
				<div class="input_wrap">
					<input autocomplete="off" class="input_number" type="text" id="certificationNumber"
						type="text" maxlength="4" />
				</div>
				<button class="btn-submit" type="button"
					onclick="checkSms();">확인</button>
			</div>
		</div>
		<div class="pw_modify_form">
		<form action="pw_modify">
		<input type="hidden" id="email_" name="email" value="${email_ }" />
			<h3 style="text-align: center;">비밀번호 변경</h3>
				<div class="input_form_wrap">
					<input type="password" title="비밀번호를 " name="pw" class="chk input_pw" />
					<div class="valid">비밀번호를 입력하세요. <br />(영문 대/소문자, 숫자를 모두 포함)</div>
					<!-- <input type="password" name="upw" required placeholder="비밀번호를 입력해주세요." id="new_pw"> -->
				</div>
				<b>비밀번호 확인</b>
				<div class="input_form_wrap">
					<input type="password" title="비밀번호 확인을 " name="pw_ck" class="chk input_pw" />
					<div class="valid">비밀번호를 다시 입력하세요.</div>
				</div>
				<button type="button" onclick="pw_modify()" class="btn-submit" >비밀번호 변경완료</button>
			</form>
		
		</div>
	</div>
	<script>
	email = $("#email_").val();
	phone = $("#phone_").val();
	target = $("#sel_type").val();
	function send_Certification(){
		if(document.getElementById('email').checked){

			var a = {
				"email" : $("#email_").val()
			};
			$.ajax({
						url : "mailSending",
						type : "post",
						data : a,
						success : function(result) {
							document.getElementById('send_btn').innerHTML = "재전송";
							target = email;
							document.getElementById('check_number_form').style.display = "block";
						},
						error:function(request, error) {
							


						}
					})
			
			
			
			
		}else if(document.getElementById('phone').checked){
			
		/* 		document.getElementsByClassName("btn-action")[0].innerHTML = "재전송";
				document.getElementById('check_number_form').classList.add('check_number_on'); */

				var a = {
					"phone" : $("#phone_").val()
				};
				jQuery.ajaxSettings.traditional = true;
				$.ajax({
							url : "sendsms",
							dataType : "text",
							contentType : "application/x-www-form-urlencoded; charset=UTF-8",
							type : "post",
							data : a,
							success : function(result) {
								document.getElementById('send_btn').innerHTML = "재전송";
								target = phone;
								document.getElementById('check_number_form').style.display = "block";
								
							},
							error : function(a, b, c) {
								alert("실패");
								
							}
						})
			
			
			
		
		}else{
			alert("인증수단을 선택하세요.");
		}
		
	}
	
	function checkSms() { 		
		var params = {
				"phone" : target
				, "certificationNumber" : $("#certificationNumber").val()
		};
		
		$.ajax({
			url : "checksms",
			dataType : "text",
			contentType : "application/x-www-form-urlencoded; charset=UTF-8",
			type : "post",
			data : params,
			success : function(result){ 
				if(result=="success"){
					document.getElementById('certify_form').style.display = "none";
					document.getElementsByClassName("pw_modify_form")[0].style.display = "block";
					
				}else{
					alert("인증번호가 올바르지 않습니다.");
				}
				
			},error : function(a,b,c){
				
				alert(a + b + c);}
		})};
		
		
		// 유효성검사 실시간 확인
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
		
		function validate(t) {
			var data = join.tag_status(t);
			display_status(t.siblings('div'), data);
		}

		function display_status(div, data) {
			div.text(data.desc);
			div.removeClass();
			div.addClass(data.code)
		}
	
		
		
		var space = /\s/g;

		function item_check(item) {
			var data = join.tag_status(item);
			if(data.code == 'invalid') {
				
				alert(data.desc);
				item.focus();
				return false;
			} else return true;
		}

		var join = {
			
			pw: {
				valid: { code:'valid', desc: '사용 가능한 비밀번호입니다.' },
				invalid: { code:'invalid', desc: '비밀번호는 영문 대/소문자, 숫자만 입력하세요.' },
				lack: { code:'invalid', desc: '비밀번호는 영문 대/소문자, 숫자를 모두 포함해야 합니다.' },
				equal: { code: 'valid', desc: '비밀번호가 일치합니다.' },
				notEqual: { code: 'invalid', desc: '비밀번호가 일치하지 않습니다.' }
			},
				
			pw_status: function(pw) {
				var reg = /[^a-zA-Z0-9]/g;
				var upper = /[A-Z]/g, lower = /[a-z]/g, digit = /[0-9]/g;
				if(pw == '') return this.empty.pw;
				else if(pw.match(space)) return this.common.space;
				else if(reg.test(pw)) return this.pw.invalid;
				else if(pw.length < 5) return this.common.min;
				else if(pw.length > 12) return this.common.max;
				else if ( !upper.test(pw) || !lower.test(pw) || !digit.test(pw) ) return this.pw.lack;
				else return this.pw.valid;
			},
			
			pw_ck_status: function(pw_ck) {
				if ( pw_ck=='' ) return this.empty.pwck;
				else if(pw_ck == $('[name=pw]').val() ) return this.pw.equal;
				else return this.pw.notEqual; 
			},

			common: {
				space: {code: 'invalid', desc: '공백 없이 입력하세요.'},
				min: {code: 'invalid', desc: '최소 5자 이상 입력하세요.'},
				max: {code: 'invalid', desc: '최대 12자 이내로 입력하세요.'}
			},
			empty: {
				pw: {code: 'invalid', desc: '비밀번호를 입력하세요.'},
				pwck: {code: 'invalid', desc: '비밀번호 확인을 입력하세요.'}
			},
			
			tag_status: function(tag){ 
				var data = tag.val();
				tag = tag.attr('name');
				if(tag == 'pw') {
					data = this.pw_status(data);
				} else if(tag == 'pw_ck') {
					data = this.pw_ck_status(data);
				}
				return data;
			}
		}
	
		function pw_modify() {
			if (!item_check($('[name=pw]')))
				return;
			if (!item_check($('[name=pw_ck]')))
				return;
			alert("비밀번호 변경이 완료되었습니다.");
			$('form').submit();
		}
	</script>


</body>
</html>