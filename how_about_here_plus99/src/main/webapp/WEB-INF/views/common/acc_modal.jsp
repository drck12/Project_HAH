<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/content.css?ver=4" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/Cstyle.css?ver=4" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/script/header.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/script/Cscript.js"></script>
</head>
<body>

<div class="" id="map-modal-container">
 <form onsubmit="changedate3();" class="all" style="width:100%">
<div class="modar-container" id="map-container">
</div>
<div class="order-container" id="order-container">
<ul class="order-mdal">
<li>
<button type="submit" onclick="recommend_();" type="button">추천 순</button>
</li>
<li>
<button type="submit" onclick="distance_();" type="button">거리 순</button>
</li>
<li>
<button type="submit" onclick="lowprice_();" type="button">낮은 가격 순</button>
</li>
<li>
<button type="submit" onclick="highprice_();" type="button">높은 가격 순</button>
</li>
</ul>
<button class="order-modar-close" onclick="closeMap()" type="button">취소</button>
</div>
       
<div class="" id="map-modal-bg" onclick="closeMap()">
</div>
</div>
	
		
</body>
</html>