<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- <link rel="stylesheet" href="resources/css/content.css?ver=3" /> -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.1/js/all.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/myinfo/myinfo_page.css" />
<script src="${pageContext.request.contextPath}/resources/script/myinfo_page.js"></script>
</head>
<body>
<div id="map-modal-container" class="map_modal_off"> 


		<div id="leave-modal-bg" class="leave-modal-bgoff" >
		<form action="delete_user">
			<div class="section_fix_title">
				<div class="fix_title">
					<strong>회원탈퇴</strong>
					<button class="close" onclick="closemodal2();">닫기</button>
				</div>
			</div>
			
			<div class="cont_section">
				<div class="cont_step01">
					<div class="cont_why">
						<h1>
							왜 떠나시는지<br />
						
						<span class="red_tag">
							<span class="point-text">이유</span>
						</span>
						가 있을까요?
						</h1>
					</div>
					
					<ul class="reason_list">
						<li>
							<input class="radio_btn" name="radios" type="radio" />
							<label for="label1">
								사용을 잘 안하게 돼요
							</label>
						</li>
						
						<li>
							<input class="radio_btn" name="radios" type="radio"/>
							<label for="label1">
								예약하고 싶은 숙소가 없어요
							</label>
						</li>
						
						<li>
							<input class="radio_btn" name="radios" type="radio" />
							<label for="label1">
								예약, 취소, 혜택받기 등 사용이 어려워요
							</label>
						</li>
						
						<li>
							<input class="radio_btn" class="radio_btn" name="radios" type="radio"/>
							<label for="label1">
								혜택(쿠폰, 포인트)이 너무 적어요
							</label>
						</li>
						
						<li>
							<input class="radio_btn" name="radios" type="radio" />
							<label for="label1">
								개인정보 보호를 위해 삭제할 정보가 있어요
							</label>
						</li>
						
						<li>
							<input class="radio_btn" name="radios" type="radio" />
							<label for="label1">
								다른 계정이 있어요
							</label>
						</li>
						
						<li>
							<input class="radio_btn" name="radios" type="radio"  />
							<label for="label1">
								기타
							</label>
						</li>
					</ul>
					
					<div class="real_leave_panel">
						<div class="real_leave_layout">
							<button disabled type="submit" id="real_leave_btn" class="real_leave_btn" >
								진짜 안녕
							</button>
						</div>
					</div>
				</div>
			</div>
			</form>
		</div>

</div>
<!-- <script>
document.getElementById("real_leave_btn").style.backgroundColor = 'black';
$(document).ready(function(){
    $('input[type="radio"]').change(function(){
    	const target = document.getElementById("real_leave_btn")[0];
    	if(document.getElementsByClassName('radio_btn').checked){
    		target.style.backgroundColor = 'rgb(242,17,76)'; target.disabled = false;
    		}else {
    			target.style.backgroundColor = 'rgb(239,239,239,1)'; target.disabled = true;
    		}
    });
});
</script> -->

</body>
</html>