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
               <div class="click">
                <i class="fas fa-concierge-bell"></i>
                <h3>저기어때</h3>
                </div>
            </div>
            <div class="header_logout">
                <div class="dropdown">
					<i class="fas fa-user-circle dropbtn"></i>
					<div class="dropdown-content">
						<a href="#">Link 1</a>
						<a href="#">Link 2</a>
						<a href="#">Link 3</a>
					</div>
				</div>
            </div>
        </div>
        <div class="body_wrapper">
            <div class="sidebar">
               <div class="sidebar_menu">
                    <p>Dashboard</p>
                    <p>회원 관리</p>
                    <p>예약 관리</p>
                    <p>게시물 관리</p>
                    <p>업체 등록</p>
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
                <div class="item_chart">
                    <canvas id="myChart"></canvas>
                </div>
                <div class="item_chart">
                    <canvas id="myChart1"></canvas>
                </div>
                <div class="item_chart">
                    <canvas id="myChartThree"></canvas>
                </div>
                <div class="item_chart">
                    <canvas id="myChartFour"></canvas>
                </div>
                <br /><hr width="80%" color="red"/><br />
                <table>
                    <form action="write" method="post" enctype="multipart/form-data">
                        <tr>
                            <td class="left">이름</td>
                            <td><input type="text" name="bName" value="bname" /></td>
                        </tr>
                        <tr>
                            <td class="left">제목</td>
                            <td><input type="text" name="bTitle" value="btitle" /></td>
                        </tr>
                        <tr>
                            <td class="left">내용</td>
                            <td><textarea name="bContent" rows="10"></textarea></td>
                        </tr>
                        <tr>
                            <td class="left">첨부</td>
                            <td>"</td>
                        </tr>
                        <tr>
                            <td class="left">새로운첨부</td>
                            <td><input type="file" name="file" /></td>
                        </tr>
                        <tr>
                            <td colspan="2"><input type="submit" value="입력" /> <a
                                href="delete?bid=&img=}">삭제</a></td>
                        </tr>
                    </form>
                </table>
                <c:if test="">
                    <div>
                        <img width="100%" border="1" src="resources/img/"
                            alt="사진" />
                    </div>
                </c:if>
                <br /><hr width="80%" color="red"/><br />
                <div class="card mb-4">
                    <div class="card-header">
                        <i class="fas fa-table me-1"></i> DataTable Example
                    </div>
                    <div class="card-body">
                        <table id="datatablesSimple">
                            <thead>
                                <tr>
                                    <th>Name</th>
                                    <th>Position</th>
                                    <th>Office</th>
                                    <th>Age</th>
                                    <th>Start date</th>
                                    <th>Salary</th>
                                </tr>
                            </thead>
                            <tfoot>
                                <tr>
                                    <th>Name</th>
                                    <th>Position</th>
                                    <th>Office</th>
                                    <th>Age</th>
                                    <th>Start date</th>
                                    <th>Salary</th>
                                </tr>
                            </tfoot>
                            <tbody>
                                <tr>
                                    <td>Tiger Nixon</td>
                                    <td>System Architect</td>
                                    <td>Edinburgh</td>
                                    <td>61</td>
                                    <td>2011/04/25</td>
                                    <td>$320,800</td>
                                </tr>
                                <tr>
                                    <td>Tiger Nixon</td>
                                    <td>System Architect</td>
                                    <td>Edinburgh</td>
                                    <td>61</td>
                                    <td>2011/04/25</td>
                                    <td>$320,800</td>
                                </tr>
                                <tr>
                                    <td>Tiger Nixon</td>
                                    <td>System Architect</td>
                                    <td>Edinburgh</td>
                                    <td>61</td>
                                    <td>2011/04/25</td>
                                    <td>$320,800</td>
                                </tr>
                                <tr>
                                    <td>Tiger Nixon</td>
                                    <td>System Architect</td>
                                    <td>Edinburgh</td>
                                    <td>61</td>
                                    <td>2011/04/25</td>
                                    <td>$320,800</td>
                                </tr>
                                <tr>
                                    <td>Tiger Nixon</td>
                                    <td>System Architect</td>
                                    <td>Edinburgh</td>
                                    <td>61</td>
                                    <td>2011/04/25</td>
                                    <td>$320,800</td>
                                </tr>
                                <tr>
                                    <td>Tiger Nixon</td>
                                    <td>System Architect</td>
                                    <td>Edinburgh</td>
                                    <td>61</td>
                                    <td>2011/04/25</td>
                                    <td>$320,800</td>
                                </tr>
                                <tr>
                                    <td>Tiger Nixon</td>
                                    <td>System Architect</td>
                                    <td>Edinburgh</td>
                                    <td>61</td>
                                    <td>2011/04/25</td>
                                    <td>$320,800</td>
                                </tr>
                                <tr>
                                    <td>Tiger Nixon</td>
                                    <td>System Architect</td>
                                    <td>Edinburgh</td>
                                    <td>61</td>
                                    <td>2011/04/25</td>
                                    <td>$320,800</td>
                                </tr>
                                <tr>
                                    <td>Tiger Nixon</td>
                                    <td>System Architect</td>
                                    <td>Edinburgh</td>
                                    <td>61</td>
                                    <td>2011/04/25</td>
                                    <td>$320,800</td>
                                </tr>
                                <tr>
                                    <td>Tiger Nixon</td>
                                    <td>System Architect</td>
                                    <td>Edinburgh</td>
                                    <td>61</td>
                                    <td>2011/04/25</td>
                                    <td>$320,800</td>
                                </tr>
                                <tr>
                                    <td>Tiger Nixon</td>
                                    <td>System Architect</td>
                                    <td>Edinburgh</td>
                                    <td>61</td>
                                    <td>2011/04/25</td>
                                    <td>$320,800</td>
                                </tr>
                                <tr>
                                    <td>Tiger Nixon</td>
                                    <td>System Architect</td>
                                    <td>Edinburgh</td>
                                    <td>61</td>
                                    <td>2011/04/25</td>
                                    <td>$320,800</td>
                                </tr>
                                <tr>
                                    <td>Tiger Nixon</td>
                                    <td>System Architect</td>
                                    <td>Edinburgh</td>
                                    <td>61</td>
                                    <td>2011/04/25</td>
                                    <td>$320,800</td>
                                </tr>
                                <tr>
                                    <td>Tiger Nixon</td>
                                    <td>System Architect</td>
                                    <td>Edinburgh</td>
                                    <td>61</td>
                                    <td>2011/04/25</td>
                                    <td>$320,800</td>
                                </tr>
                                <tr>
                                    <td>Tiger Nixon</td>
                                    <td>System Architect</td>
                                    <td>Edinburgh</td>
                                    <td>61</td>
                                    <td>2011/04/25</td>
                                    <td>$320,800</td>
                                </tr>
                                <tr>
                                    <td>Tiger Nixon</td>
                                    <td>System Architect</td>
                                    <td>Edinburgh</td>
                                    <td>61</td>
                                    <td>2011/04/25</td>
                                    <td>$320,800</td>
                                </tr>
                                <tr>
                                    <td>Tiger Nixon</td>
                                    <td>System Architect</td>
                                    <td>Edinburgh</td>
                                    <td>61</td>
                                    <td>2011/04/25</td>
                                    <td>$320,800</td>
                                </tr>
                                <tr>
                                    <td>Tiger Nixon</td>
                                    <td>System Architect</td>
                                    <td>Edinburgh</td>
                                    <td>61</td>
                                    <td>2011/04/25</td>
                                    <td>$320,800</td>
                                </tr>
                                <tr>
                                    <td>Tiger Nixon</td>
                                    <td>System Architect</td>
                                    <td>Edinburgh</td>
                                    <td>61</td>
                                    <td>2011/04/25</td>
                                    <td>$320,800</td>
                                </tr>
                                <tr>
                                    <td>Tiger Nixon</td>
                                    <td>System Architect</td>
                                    <td>Edinburgh</td>
                                    <td>61</td>
                                    <td>2011/04/25</td>
                                    <td>$320,800</td>
                                </tr>
                                <tr>
                                    <td>Tiger Nixon</td>
                                    <td>System Architect</td>
                                    <td>Edinburgh</td>
                                    <td>61</td>
                                    <td>2011/04/25</td>
                                    <td>$320,800</td>
                                </tr>
                                <tr>
                                    <td>Tiger Nixon</td>
                                    <td>System Architect</td>
                                    <td>Edinburgh</td>
                                    <td>61</td>
                                    <td>2011/04/25</td>
                                    <td>$320,800</td>
                                </tr>
                                <tr>
                                    <td>Tiger Nixon</td>
                                    <td>System Architect</td>
                                    <td>Edinburgh</td>
                                    <td>61</td>
                                    <td>2011/04/25</td>
                                    <td>$320,800</td>
                                </tr>
                                <tr>
                                    <td>Tiger Nixon</td>
                                    <td>System Architect</td>
                                    <td>Edinburgh</td>
                                    <td>61</td>
                                    <td>2011/04/25</td>
                                    <td>$320,800</td>
                                </tr>
                                <tr>
                                    <td>Tiger Nixon</td>
                                    <td>System Architect</td>
                                    <td>Edinburgh</td>
                                    <td>61</td>
                                    <td>2011/04/25</td>
                                    <td>$320,800</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
			</div>
		</div>
        <div class="footer_wrapper">
        	footerfooterfooterfooterfooterfooterfooterfooterfooterfooterfooter
        </div>
	</div>
	<script>
		var jArray = new Array();

		jArray = JSON.parse('${arr}');

		let myChartThree = document.getElementById('myChartThree').getContext(
				'2d');

		let barChartThree = new Chart(myChartThree, {
			type : 'bar',//pie,line,doughnut,polarArea
			data : {
				labels : [ jArray[0].goods, jArray[1].goods, jArray[2].goods,
						jArray[3].goods, jArray[4].goods ],
				datasets : [ {
					label : '청바지 매출액',
					data : [ jArray[0].sum, jArray[1].sum, jArray[2].sum,
							jArray[3].sum, jArray[4].sum ],
					backgroundColor : [ 'red', 'rgba(255,255,0,0.5)',
							'#f9f9f9', 'skyblue', 'dodgerblue' ],
					borderWidth : 5,
					borderColor : '#f5f5f5',
					hoverBorderWidth : 10
				} ]
			},
			options : {
				title : {
					display : true,
					text : '청바지 매출액~~',
					fontSize : 20,
					fontColor : 'red'
				},
				legend : {
					display : true,
					position : 'top'//right,left,top,bottom
				},
				tooltips : {
					enabled : false
				},
				layout : {
					padding : {
						left : 10,
						right : 10,
						top : 10,
						bottom : 10
					}
				}
			}
		});

		jArray = JSON.parse('${arr2}');
		let myChartFour = document.getElementById('myChartFour').getContext(
				'2d');
		let varChartFour = new Chart(myChartFour, {
			type : 'bar',
			data : {
				labels : [ 'aa1', 'aa2', 'aa3', 'aa4', 'aa5', ],
				/* labels : [ jArray[0].goods, jArray[1].goods, jArray[2].goods,
						jArray[3].goods, jArray[4].goods ], */
				datasets : [ {
					label : "청바지 매출액",
					data : [ jArray[0].sum, jArray[1].sum, jArray[2].sum,
							jArray[3].sum, jArray[4].sum ]
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