<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>500</title>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap.min.css">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/dashboard.css">
<style type="text/css">
#error{
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
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
<jsp:include page="../top.jsp"></jsp:include>
<div id="error">
  <h1>500</h1>
  <h2>网页出错了</h2>
</div>
</body>
</html>