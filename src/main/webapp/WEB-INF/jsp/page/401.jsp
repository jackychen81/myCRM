<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap.min.css">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/dashboard.css">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/datatable/css/jquery.dataTables.css">
<style type="text/css">
.badge:empty {
	display: none;
}
</style>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/datatable/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/bootstrap/js/bootstrap.min.js"></script>
<title>401</title>
<style type="text/css">
#error_401{
	border:1px solid #aaa;
	background-color:#eee;
	margin-left: auto;
	margin-right: auto;
	margin-top:120px;
	margin-bottom:auto;
	width:960px;
	height:150px;
	text-align: center;	
}
</style>
</head>
<body>
<jsp:include page="../top.jsp"></jsp:include>
<div id="error_401">
  <h1>你无权访问改页面！</h1>
</div>
</body>
</html>