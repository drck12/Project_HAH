
function selectAll(selectAll)  {
  const checkboxes 
     = document.querySelectorAll('input[type="checkbox"]');
  
  checkboxes.forEach((checkbox) => {
    checkbox.checked = selectAll.checked
  })
};

sms_check = "";
function openModal_pay() {
	
var name = document.getElementById('reservename').value;
	
	if(name.length<2){
		alert("예약자 이름을 입력하세요");
		return;
	};
	if(sms_check==""){
		alert("휴대폰 번호를 인증하세요.");
		return;
	};
	
	if(!(document.getElementById("chk1").checked == true && document.getElementById("chk2").checked == 
		true && document.getElementById("chk3").checked == true && document.getElementById("chk4").checked == true)){
		alert("약관에 동의 후 진행해주세요.");
		return;
	};

	
	document.getElementById('map-modal-bg-pay').classList.add('map-modal-bg-pay');
	document.getElementById('map-modal-container-pay').classList.add('map-modal-container-pay');
	document.getElementById('modal-container-pay').classList.add('modal-container-pay');
}

function closeMap_pay() {
	document.getElementById('map-modal-bg-pay').classList.remove('map-modal-bg-pay');
	document.getElementById('map-modal-container-pay').classList.remove('map-modal-container-pay');
	document.getElementById('modal-container-pay').classList.remove('modal-container-pay');
	

}




		
		// ajax로 인증번호 확인하기 
function checkSms() { 		
			var params = {
					"phone" : $("#phonenumber").val()
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
						alert("인증되었습니다.");
						document.getElementsByClassName("btn-action")[0].style.backgroundColor = 'rgb(239,239,239,1)';
						document.getElementsByClassName("btn-action")[0].style.color = 'black';
						document.getElementsByClassName("btn-action")[0].disabled = true;
						/*document.getElementById('phonenumber').disabled = true;*/
						document.getElementById('check_number_form').classList.remove('check_number_on');
						sms_check = "success";
					}else{
						alert("인증번호가 올바르지 않습니다.");
					}
					
				},error : function(a,b,c){
					
					alert(a + b + c);}
			})};	
			

		