<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/motel_header.css?ver=3" />

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/script/header.js"></script>
</head>
<body class="wrap" id="wrap">
<!--==============================헤더시작======================================-->
  <div id="map-modal-container"> <!--검색 모달창때문에 감쌈  -->
	<div id="side-menu" class="side-menu-off">
		<div id="side_top">
			<div class="side_guest">
				<div class="side_btn_join">
					<c:if test="${loginUser == null }">
						로그인 후 예약하시면 <br />
						할인 쿠폰과 추가 혜택을 받을 수 있어요.<br />
            			<div class="login_a"><a href="${pageContext.request.contextPath}/login">로그인</a></div>   
            		</c:if>
            		
            		 <c:if test="${loginUser != null }">
             			 <div class="side_btn_login">${loginUser.mem_nick}님 접속중!!!</div> <br /><!--닉네임들어갈자리-->
	             		  <a href="${pageContext.request.contextPath}/logout">로그아웃</a>
             		 </c:if>
				</div>
			</div>
		</div>
		
		<div class="side_content">
			<div class="side_content_layout">
				<div class="home">
					 <a href="${pageContext.request.contextPath}/main">홈</a>
				</div>
				
				<div class="accordion_01">
						<input id="label_layout" type="checkbox" />
							<label for="label_layout" class="label">
								숙소유형
								<em></em><br />
							</label>

						<div class="layout_wrap">
							<div class="layout_type">
								<a href="${pageContext.request.contextPath}/motel">모텔</a><br />
							</div>
							<div class="layout_type">
								<a href="${pageContext.request.contextPath}/hotel">호텔/리조트</a><br />
							</div>
							<div class="layout_type">
								<a href="${pageContext.request.contextPath}/pension">펜션</a><br />
							</div>
							<div class="layout_type">
								<a href="">게스트하우스</a><br />
							</div>
							<div class="layout_type">
								<a href="">캠핑.글램핑</a><br />
							</div>
							<div class="layout_type">
								<a href="">한옥</a><br />
							</div>
						</div>
				</div>
				
				<div class="location">
					<a href="#">내주변</a>
				</div>
				
				<div class="reservation">
					<a href="${pageContext.request.contextPath}/myinfo/<myinfo_reserve></myinfo_reserve>">예약 내역</a>
				</div>
				
				<div class="accordion_02">
						<input id="label_layout02" type="checkbox" />
							<label for="label_layout02" class="label02">
								더보기
								<em></em><br />
							</label>
						<div class="layout_wrap02">
							<div class="layout_type02">
								<a href="${pageContext.request.contextPath}/more/notice">공지사항</a><br />
							</div>
							<div class="layout_type02">
								<a href="${pageContext.request.contextPath}/more/faq/1">고객문의</a><br />
							</div>
							<div class="layout_type02">
								<a href="${pageContext.request.contextPath}/more/terms">약관 및 정책</a><br />
							</div>
						</div>
				</div>	
				
				<div class="side_footer">
					<p>여기어때 고객행복센터</p><br />
					<p>
						<a href="https://www.goodchoice.kr/tel:1670-6250">1670-6250</a>
					</p><br />
					<p>오전 9시 - 새벽 3시</p>
					
				</div>
			</div>
		</div>
	</div>
		 <div id="hamber_menu_mo" class="hamber_menu_mo">     
             <input type="checkbox" id="menuicon" onclick="ham_modal_on();">
				<label for="menuicon"><!--for = 값을 menuicon과 같이줘서 input과 한묶음-->
					<span></span><!--햄버거 가로줄-->
					<span></span>
					<span></span>
				</label>
           </div>
           <!-- 자식모달창 색상만 변함 / 클릭했을때 사라지게 온클릭 header.js에있음 -->
		<div id="map-modal-bgh" onclick="closemodal();">
		</div>
</div>
<!--===============================반응형 검색 모달=============================-->
<div class="search-modal-container">

</div>
   <div class="header">
      <div class="header_div">

          <!--메인로고-->
           <div class="main_logo">
               <a href="${pageContext.request.contextPath}/main"><img id="main_logo" src="${pageContext.request.contextPath}/resources/img/new_main_logo_pc.png" alt=""></a>
           </div>
           
            <!--검색바-->
           <div class="srch_bar">
               <div onclick="searchbar_on();" id="search_icon" class="srch_icon">
               </div>
               <div  id="srch_lab"  class="srch_init">
               <input class="srch_text" type="text" name="search" >
               </div>
           </div>

           <!--메뉴그룹-->
           <div class="grp_menu">
               <div class="nontop_color" >내주변</div>
               <div><a class="nontop_color" style="color: rgba(255,255,255,0.8);" href="${pageContext.request.contextPath}/myinfo/myinfo_reserve">예약내역</a></div>	
               <div class="grp_dropdown">
              <button class="grp_dropbtn nontop_color">더보기</button>
              <div class="dropdown-contenttt">
                <a href="${pageContext.request.contextPath}/more/notice">공지사항</a>
                <a href="${pageContext.request.contextPath}/more/faq/1">자주 묻는 질문</a>
                <a href="${pageContext.request.contextPath}/more/inquiry">1:1 문의</a>
                <a href="${pageContext.request.contextPath}/more/terms">약관 및 정책</a>
              </div>
            </div>
            
            <%-- <c:if test="${member != null }">${memeber.unick }</c:if>
            <c:if test="${member== null }"><div><a href="#">로그인</a></div></c:if> --%>
            
            
        
             
             <c:if test="${loginUser == null }">
            <div class="login_a nontop_color"><a href="${pageContext.request.contextPath}/login">로그인</a></div>   
             </c:if>
             
             <div class="logout_dropdown">
             <c:if test="${loginUser != null }">
              <button class="logout_dropbtn nontop_color">${loginUser.mem_nick}</button><!--닉네임들어갈자리-->
              </c:if>
              <div class="dropdown-logout">
                <a href="${pageContext.request.contextPath}/myinfo/myinfo_page">내정보</a>
				<c:if test="${loginUser.mem_access == '회원' }">
                	<a href="${pageContext.request.contextPath}/myinfo/myinfo_reserve">예약내역</a>
                </c:if>
                <c:if test="${loginUser.mem_access != '회원' }">
	                <a href="${pageContext.request.contextPath}/myinfo/myinfo_reserve">예약내역</a>
	                <a href="${pageContext.request.contextPath}/myinfo/myinfo_reserve">리뷰관리</a>
                </c:if>
                <a href="${pageContext.request.contextPath}/logout">로그아웃</a>
              </div>
            </div>  
           </div> 
      </div>
<!--===========================1024px아래=========================-->
      <div class="header_div_mo">
          <!--햄버거메뉴-->
          <div class="hamber_mo">
          
          </div>
           <!--  <div class="hamber_menu_mo">     
             <input type="checkbox" id="menuicon" onclick="ham_modal_on();">
				<label for="menuicon">for = 값을 menuicon과 같이줘서 input과 한묶음
					<span></span>햄버거 가로줄
					<span></span>
					<span></span>
				</label>
           </div> -->
           
           <!--메인로고-->
           <div class="main_logo_mo">
              <a href="${pageContext.request.contextPath}/main"><img src="${pageContext.request.contextPath}/resources/img/new_main_logo_mo.png" alt=""></a>
           </div>
           
            <!--검색바-->
            <div class="srch_bar_mo">
               <div onclick="searchbar_mo_on();" class="srch_icon_mo">
               
               </div>
           </div>
       </div>
   </div>
<!--==============================헤더끝======================================-->

</body>
</html>