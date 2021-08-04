<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet" href="resources/css/kstyle.css">
<link rel="stylesheet" href="resources/css/kstyle2.css" /> <!-- table용 -->

<script src="https://kit.fontawesome.com/d730d6aca1.js" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<title>Insert title here</title>
</head>
<body>
    <div class="wrapper">
        <div class="header_wrapper">
            <div class="header_title">
               <div class="click" onclick="location.href='${pageContext.request.contextPath}/main';">
                <i class="fas fa-concierge-bell"></i>
                <h3>저기어때</h3>
                </div>
            </div>
            <div class="header_logout">
                <div class="dropdown">
					<i class="fas fa-user-circle dropbtn"></i>
					<div class="dropdown-content">
						<a href="logout">Logout</a>
					</div>
				</div>
            </div>
        </div>
        <div class="body_wrapper">
            <div class="sidebar">
               <div class="sidebar_menu">
               		<c:if test="${loginUser.mem_access == 0 }">
	                    <a class="here" href="kadmin_page">Dashboard</a>
	                    <a href="kaccommodation">업체 등록</a>
	                    <a href="kmember">회원 관리</a>
	                    <a href="kinquiry">1:1 문의 관리</a>
                    </c:if>
                    <a href="kreservation">예약 관리</a>
                    <a href="kreview">리뷰 관리</a>
                </div>
                <div class="sidebar_footer">
                    <p>Logged in as:</p>
                    <p>Start Bootstrap</p>
                </div>
            </div>
            <div class="sidebar_right">
                    <div class="three col" onclick="content_size()">
                    <div class="hamburger" id="hamburger-1">
                        <span class="line"></span>
                        <span class="line"></span>
                        <span class="line"></span>
                    </div>
                </div>
            </div>
			<div class="content" id="contentid">
				<div class="content_title">Dashboard</div>
				<div class="chart">
	                <div class="item_chart">
	                    <canvas id="myChartOne"></canvas>
	                    <canvas id="myChartTwo"></canvas>
	                </div>
	                <div class="item_chart">
	                    <canvas id="myChartThree"></canvas>
	                    <canvas id="myChartFour"></canvas>
	                </div>
                </div>
			</div>
		</div>
        <div class="footer_wrapper">
        	
        </div>
	</div>
	<script>
		var jArray = new Array();
		jArray = JSON.parse('${arr1}');
		let myChartOne = document.getElementById('myChartOne').getContext(
				'2d');
		let varChartOne = new Chart(myChartOne, {
			type : 'bar',
			data : {
				labels : [ jArray[0].x, jArray[1].x, jArray[2].x,
						jArray[3].x, jArray[4].x, jArray[5].x, jArray[6].x ],
				datasets : [ {
					label : "일간 예약 건수",
					data : [ jArray[0].y, jArray[1].y, jArray[2].y,
							jArray[3].y, jArray[4].y, jArray[5].y, jArray[6].y ],
							backgroundColor: 'rgb(255, 99, 132)',
				} ]
			}
		});
		
		jArray = JSON.parse('${arr2}');
		let myChartTwo = document.getElementById('myChartTwo').getContext(
				'2d');
		let varChartTwo = new Chart(myChartTwo, {
			type : 'bar',
			data : {
				labels : [ jArray[0].x, jArray[1].x, jArray[2].x,
						jArray[3].x, jArray[4].x, jArray[5].x, jArray[6].x ],
				datasets : [ {
					label : "월간 예약 건수",
					data : [ jArray[0].y, jArray[1].y, jArray[2].y,
							jArray[3].y, jArray[4].y, jArray[5].y, jArray[6].y ],
							backgroundColor: 'rgb(255, 99, 132)',
				} ]
			}
		});
		
		jArray = JSON.parse('${arr3}');
		const x = [];
		const y = [];
		jArray.forEach(function(element){
			x.push(element.x);
			y.push(element.y)
		});
		let myChartThree = document.getElementById('myChartThree').getContext(
				'2d');
		let varChartThree = new Chart(myChartThree, {
			type : 'bar',
			data : {
				labels : x,
				datasets : [ {
					label : "룸 타입별 평균 가격",
					data : y,
							backgroundColor: 'rgb(255, 99, 132)',
				} ]
			}
		});

		jArray = JSON.parse('${arr4}');
		const x1 = [];
		const y1 = [];
		jArray.forEach(function(element){
			x1.push(element.x);
			y1.push(element.y)
		});
		let myChartFour = document.getElementById('myChartFour').getContext(
				'2d');
		let varChartFour = new Chart(myChartFour, {
			type : 'bar',
			data : {
				labels : x1,
				datasets : [ {
					label : "도시별 업체 수",
					data : y1,
							backgroundColor: 'rgb(255, 99, 132)',
				} ]
			}
		});
	</script>
	<script src="resources/script/kscript.js" defer></script>
	
	<!-- table용  2개-->
	<script src="resources/script/kscript2.js"></script> 
	<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
</body>
</html>