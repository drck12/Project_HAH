<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
	                    <a href="kadmin_page">Dashboard</a>
	                    <a href="kaccommodation">업체 등록</a>
	                    <a href="kmember">회원 관리</a>
	                    <a href="kinquiry">1:1 문의 관리</a>
               		</c:if>
                    <a class="here" href="kreservation">예약 관리</a>
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
				<div class="content_title">예약 관리</div>
				<div class="card mb-4">
                    <div class="card-header">
                        <i class="fas fa-table me-1"></i> RESERVE Table
                    </div>
                    <div class="card-body">
                        <table id="datatablesSimple2">
                            <thead>
                                <tr>
                                    <th>RES_CODE</th>
                                    <th>ACC_CODE</th>
                                    <th>ROOM_CODE</th>
                                    <th>R_TYPE</th>
                                    <th>R_STATUS</th>
                                    <th>S_DATE</th>
                                    <th>E_DATE</th>
                                </tr>
                            </thead>
                            <tfoot>
                                <tr>
                                    <th>RES_CODE</th>
                                    <th>ACC_CODE</th>
                                    <th>ROOM_CODE</th>
                                    <th>R_TYPE</th>
                                    <th>R_STATUS</th>
                                    <th>S_DATE</th>
                                    <th>E_DATE</th>
                                </tr>
                            </tfoot>
                            <tbody>
                            	<c:forEach items="${res }" var="res">
	                                <tr>
	                                    <td>${res.RES_CODE }</td>
	                                    <td>${res.ACC_CODE }</td>
	                                    <td>${res.ROOM_CODE }</td>
	                                    <td>${res.R_TYPE }</td>
	                                    <td>${res.R_STATUS }</td>
	                                    <td><fmt:formatDate pattern="yyyy-MM-dd" value="${res.S_DATE }" /></td>
	                                    <td><fmt:formatDate pattern="yyyy-MM-dd" value="${res.E_DATE }" /></td>
	                                </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="card mb-4">
                    <div class="card-header">
                        <i class="fas fa-table me-1"></i> ROOM Table
                    </div>
                    <div class="card-body">
                        <table id="datatablesSimple">
                            <thead>
                                <tr>
                                    <th>ROOM_CODE</th>
                                    <th>ACC_CODE</th>
                                    <th>ROOM_TYPE</th>
                                    <th>ROOM_PRICE</th>
                                </tr>
                            </thead>
                            <tfoot>
                                <tr>
                                    <th>ROOM_CODE</th>
                                    <th>ACC_CODE</th>
                                    <th>ROOM_TYPE</th>
                                    <th>ROOM_PRICE</th>
                                </tr>
                            </tfoot>
                            <tbody>
                            	<c:forEach items="${room }" var="room">
	                                <tr>
	                                    <td>${room.ROOM_CODE }</td>
	                                    <td>${room.ACC_CODE }</td>
	                                    <td>${room.ROOM_TYPE }</td>
	                                    <td>${room.ROOM_PRICE }</td>
	                                </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
			</div>
		</div>
        <div class="footer_wrapper">
        	
        </div>
	</div>
	<script src="resources/script/kscript.js" defer></script>
	
	<!-- table용  2개-->
	<script src="resources/script/kscript2.js"></script> 
	<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
</body>
</html>