
//닉네임 수정버튼 누르면
function nik_modify_on(){
	document.getElementById("nik_modify_section").style.display ='block';
	document.getElementById("nik_modify_btn").style.display ='none';
	document.getElementById("nik_modify_finish_btn").style.display ='block';
	document.getElementById("nik_modify_cancel_btn").style.display ='block';
}
//닉네임 취소버튼 누르면
function nik_cancel_on(){
	document.getElementById("nik_modify_section").style.display ='none';
	document.getElementById("nik_modify_btn").style.display ='block';
	document.getElementById("nik_modify_finish_btn").style.display ='none';
	document.getElementById("nik_modify_cancel_btn").style.display ='none';
}

/*
//예약자 이름 수정 버튼 누르면
function res_modify_on(){
	document.getElementById("res_modify_section").style.display ='block';
	document.getElementById("res_modify_btn").style.display ='none';
	document.getElementById("res_modify_finish_btn").style.display ='block';
	document.getElementById("res_modify_cancel_btn").style.display ='block';
}

//예약자 이름 취소 버튼 누르면
function res_cancel_on(){
	document.getElementById("res_modify_section").style.display ='none';
	document.getElementById("res_modify_btn").style.display ='block';
	document.getElementById("res_modify_finish_btn").style.display ='none';
	document.getElementById("res_modify_cancel_btn").style.display ='none';
}
*/

//휴대폰 번호 수정 버튼 누르면
function phone_modify_on(){
	document.getElementById("phone_modify_section").style.display ='block';
	document.getElementById("phone_modify_btn").style.display ='none';
	document.getElementById("phone_modify_finish_btn").style.display ='block';
	document.getElementById("phone_modify_cancel_btn").style.display ='block';
}

//휴대폰 번호 취소 버튼 누르면
function phone_cancel_on(){
	document.getElementById("phone_modify_section").style.display ='none';
	document.getElementById("phone_modify_btn").style.display ='block';
	document.getElementById("phone_modify_finish_btn").style.display ='none';
	document.getElementById("phone_modify_cancel_btn").style.display ='none';
	document.getElementById("check_number_form").style.display ='none';
}		

function leave_modal_on(){ //회원탈퇴 / 모달창
	document.getElementById('leave-modal-bg').classList.add('leave-modal-bg');
	document.getElementById('map-modal-container').classList.add('map-modal-container2');
	
};

function closemodal2(){ //모달창 닫을때 
	document.getElementById('leave-modal-bg').classList.remove('leave-modal-bg');
	document.getElementById('map-modal-bg').classList.remove('map-modal-bg');
	document.getElementById('map-modal-container').classList.remove('map-modal-container');
	document.getElementById('map-modal-container').classList.remove('map-modal-container2');
	document.getElementById('srch_lab').classList.remove('srch_extend');
};

//탈퇴 체크박스 체크되면 아래 버튼 색활성화
$(document).ready(function(){
    $('input[type="radio"]').change(function(){
    	const target = document.getElementById("real_leave_btn");
    	if(!document.getElementsByClassName('radio_btn').checked){
    			target.style.background = '#eb4242'; target.disabled = false;
    			target.style.color = '#fff'; 
    		}else{
    			target.disabled = true;
    		}
    });
});

//모달 탈퇴하기창 사이즈 변할때마다 사라지게
var mqls = window.matchMedia("screen and (max-width: 1024px)");

mqls.addListener(function(e) { 
    if(e.matches) {
    	document.getElementById('leave-modal-bg').classList.remove('leave-modal-bg');
    	document.getElementById('map-modal-container').classList.remove('map-modal-container');
    	document.getElementById('map-modal-container').classList.remove('map-modal-container2');
    } else {
    	document.getElementById('leave-modal-bg').classList.remove('leave-modal-bg');
    	document.getElementById('map-modal-container').classList.remove('map-modal-container');
    	document.getElementById('map-modal-container').classList.remove('map-modal-container2');
    }
});

//인증번호 확인 ajax
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
		url : "../checksms",
		dataType : "text",
		contentType : "application/x-www-form-urlencoded; charset=UTF-8",
		type : "post",
		data : params,
		success : function(result){ 
			if(result=="success"){
				document.getElementsByClassName("phone_modify_finish_btn")[0].style.background = '#ff0055';
				document.getElementsByClassName("phone_modify_finish_btn")[0].disabled = false;
				document.getElementById('phone_modify_number').value = document.getElementById('phone').value;
				document.getElementById('phone').disabled = 'disabled';
				
				
			}else{
				alert("인증번호가 올바르지 않습니다.");
			}
			
		},error : function(a,b,c){
			
			alert(a + b + c);}
	})};	





