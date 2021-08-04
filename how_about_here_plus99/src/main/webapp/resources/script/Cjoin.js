
// 가입시 체크박스 전체선택 기능
function selectAll(selectAll)  {
  const checkboxes 
     = document.querySelectorAll('input[type="checkbox"]');
  
  checkboxes.forEach((checkbox) => {
    checkbox.checked = selectAll.checked
  })
};


// 가입시 체크박스 필수체크 했는지 확인하고 했으면 버튼 활성화, 버튼취소되면 다시 비활성화
$(document).ready(function(){
    $('input[type="checkbox"]').change(function(){
    	const target = document.getElementsByClassName("btn-next")[0];
    	if(document.getElementById("requiredCheck1").checked == true && document.getElementById("requiredCheck2").checked == true && document.getElementById("requiredCheck3").checked){
    		target.style.backgroundColor = 'rgb(242,17,76)'; target.disabled = false;
    		}else {
    			target.style.backgroundColor = 'rgb(220,212,212,1)'; target.disabled = true;
    		}
    });
});



		
		// ajax로 인증번호 확인하기 
function checkSms() { 		
			var params = {
					"phone" : $("#phone").val()
					, "requiredCheck1" : $("#requiredCheck1").val()
					, "requiredCheck2" : $("#requiredCheck2").val()
					, "requiredCheck3" : $("#requiredCheck3").val()
					, "selCheck1" : $("#selCheck1").val()
					, "selCheck2" : $("#selCheck2").val()
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
						document.getElementById('join_sms_form').classList.remove('join_next2');
						document.getElementById('join_user_form').classList.add('join_user_on');
					}else{
						alert("인증번호가 올바르지 않습니다.");
					}
					
				},error : function(a,b,c){
					
					alert(a + b + c);}
			})};	
			
	// 체크박스에서 sms인증으로 화면 전환		
function join_next(){
	document.getElementById('join_check_form').classList.add('join_next');
	document.getElementById('join_sms_form').classList.add('join_next2');
}


		
// 이메일, 비밀번호, 비밀번호 확인, 닉네임 유효성 검증
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
	unick_status: function(unick) {
		if ( unick=='' ) return this.empty.unick;
		else if(unick.length < 2) return this.nick.min;
		else if(unick.length > 12) return this.common.max;
		else return this.nick.valid;
	},
	nick: {
		valid: { code:'valid', desc: '사용 가능한 닉네임.' },
		min: { code: 'invalid', desc: '최소2자 이상 입력하세요.'},
	},
	
	email: {
		valid: { code: 'valid', desc: '유효한 이메일입니다.' },
		invalid: { code: 'invalid', desc: '유효하지 않은 이메일입니다.' }
	},
	
	email_status: function(email) {
		var reg = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		if( email == '' ) return this.empty.email;
		else if(email.match(space)) return this.common.space;
		else if( reg.test(email) ) return this.email.valid;
		else return this.email.invalid;  
	},
	common: {
		space: {code: 'invalid', desc: '공백 없이 입력하세요.'},
		min: {code: 'invalid', desc: '최소 5자 이상 입력하세요.'},
		max: {code: 'invalid', desc: '최대 12자 이내로 입력하세요.'}
	},
	empty: {
		email: {code: 'invalid', desc: '이메일을 입력하세요.'},
		pw: {code: 'invalid', desc: '비밀번호를 입력하세요.'},
		pwck: {code: 'invalid', desc: '비밀번호 확인을 입력하세요.'},
		unick: { code: 'invalid', desc: '닉네임을 입력하세요.'}
	},
	
	tag_status: function(tag){ 
		var data = tag.val();
		tag = tag.attr('name');
		if(tag == 'email') {
			data = this.email_status(data);
		}  else if(tag == 'pw') {
			data = this.pw_status(data);
		} else if(tag == 'pw_ck') {
			data = this.pw_ck_status(data);
		}else if(tag == 'unick') {
			data = this.unick_status(data);
		}
		return data;
	}
}