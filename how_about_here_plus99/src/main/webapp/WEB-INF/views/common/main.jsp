<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<!-- content.css는 main_layout.jsp에서 받기때문에 주석처리함 -->
<!-- <link rel="stylesheet" href="resources/css/content.css?ver=2" /> -->
</head>
<body>
<div class="content">
   <!--======================content_main이미지=======================-->
   <div class="content_main_img"></div>
</div>

   <!--======================content 카테고리링크=======================-->
<div class="category_layout">
   <div class="list_layout">
      
      <div class="category_list">
         <div class="motel_icon">
           <a href="motel"> <img src="resources/img/01motel.png" alt="" />
               <p>모텔</p></a>
         </div>
         
         <div class="hotel_icon">
            <a href="hotel"><img src="resources/img/02hotel.png" alt="" />
               <p>호텔</p></a></a>
         </div>
         
      </div>            
            
      <div class="category_list">
      
         <div class="pension_icon">
           <a href="pension"> <img src="resources/img/03pension.png" alt="" />
               <p>펜션</p></a>
         </div>
            
         <div class="location_icon">
             <a href="myplace"> <img src="resources/img/08location.png" alt="" />
             <p>내주변</p></a>
               
            </div>          
      </div>
   </div>
</div>
   
   <!--========================여기어때 소식=========================-->   
<div class="recommend">
   <h2>여기어때 소식</h2>
      <div class="recom_panel">
         <div class="recom_01_layout" OnClick="location.href ='${pageContext.request.contextPath}/more/notice'">
            <div class="recom_01_img">
               <img src="resources/img/recom_01.png" alt="" />
            </div>
            <div class="recom_01_write">
               <div class="recom_01_title">여기어때 럭키백 판매</div>
               <div class="recom_01_content">
               젊고 당당한 여기어때 럭키백 <br />
               지금 구매하세요!
               </div>
            </div>
         </div>
         
         <div class="recom_02_layout" OnClick="location.href ='${pageContext.request.contextPath}/more/notice'">
            <div class="recom_02_img">
               <img src="resources/img/recom_02.png" alt="" />
            </div>
            <div class="recom_02_write">
               <div class="recom_02_title">여기어때 아큐브 굿즈</div>
               <div class="recom_02_content">
               모텔 리얼리뷰 무료초대권 <br />
               지금 신청하세요!
               </div>
            </div>
         </div>
         
      </div>
</div>   

<!--==============================앱 다운===============================-->

<!-- <div class="banner_bg_layout">
   <p>
   앱 다운 받고
   <b>더 많은 혜택</b>
   받으세요
   </p>
   
   <div class="app_layout">
      <div class="android">
         <a href="#">
            <img src="resources/img/banner_and.png" alt="" />
         </a>
      </div>   
      
      <div class="ios">
         <a href="#">
            <img src="resources/img/banner_ios.png" alt="" />
         </a>
      </div>   
   </div>
</div>       -->

<!--===========================메인 이벤트============================-->

   <!-- 이벤트 슬라이더 -->
   <div class="event_layout">
	   <div class="event_h2">
	   	<h2>이벤트</h2>
	   </div>
 <div class="slide">
    <input type="radio" name="pos" id="pos1" checked>
    <input type="radio" name="pos" id="pos2">
    <input type="radio" name="pos" id="pos3">
    <input type="radio" name="pos" id="pos4">
    <input type="radio" name="pos" id="pos5">
    <ul>
      <li>
      	<a href="${pageContext.request.contextPath}/more/notice">
      		<img class="slider_img" src="resources/img/slider01.png" alt="" />
      	</a>
      </li>
      <li>
      	<a href="${pageContext.request.contextPath}/more/notice">
      		<img class="slider_img" src="resources/img/slider02.png" alt="" />
      	</a>
      </li>
      <li>
      	<a href="${pageContext.request.contextPath}/more/notice">
      		<img class="slider_img" src="resources/img/slider03.png" alt="" />
      	</a>
      </li>
      <li>
      	<a href="${pageContext.request.contextPath}/more/notice">
      		<img class="slider_img" src="resources/img/slider04.png" alt="" />
      	</a>
      </li>
      <li>
      	<a href="${pageContext.request.contextPath}/more/notice">
      		<img class="slider_img" src="resources/img/slider05.png" alt="" />
      	</a>
      </li>
    </ul>
    <p class="bullet">
      <label for="pos1">1</label>
      <label for="pos2">2</label>
      <label for="pos3">3</label>
      <label for="pos4">4</label>
      <label for="pos5">5</label>
    </p>
  </div>
 </div> 

<!--===========================메인 ask============================-->

<div class="ad_ask">
	<div class="ask_layout">
		<div class="ask_01">
			<a href="${pageContext.request.contextPath}/more/inquiry">
				<img src="resources/img/ask01.png" alt="" />
			</a>
		</div>
		
		<div class="ask_02">
			<a href="${pageContext.request.contextPath}/more/inquiry">
				<img src="resources/img/ask02.png" alt="" />
			</a>
		</div>
	</div>
</div>
   
   
    
   
   
   
   
</body>
</html>