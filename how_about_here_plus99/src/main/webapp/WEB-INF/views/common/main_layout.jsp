<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>The Value %</title>
<!-- 브라우저이미지 파비콘 -->
<link rel="icon" href="${pageContext.request.contextPath}/resources/img/team_value.png" />
<title>
	<tiles:insertAttribute name="title" />
</title>
</head>
<body>

	
	<div id="container">
		
		<div id="modal">
			<tiles:insertAttribute name="modal" />
		</div>
		
		<div id="header">
			<tiles:insertAttribute name="header" />
		</div>
		
		<div id="content">
			<tiles:insertAttribute name="content" />
		</div> 
		
		<div id="footer">
			<tiles:insertAttribute name="footer" />
		</div>
	
	 </div>

</body>
</html>