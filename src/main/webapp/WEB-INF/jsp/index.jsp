<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Index</title>
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

<script type="text/javascript">
$(function(){
	
	/* 默认打开待完成的个人任务 */
	$("#business").load("${pageContext.request.contextPath}/business/list");
	/* 显示业务列表 */
	$("a[href='#business']").on("click",function(){
		$("#business").load("${pageContext.request.contextPath}/business/list");
	});
});
</script>
</head>
<body>
    <jsp:include page="top.jsp"></jsp:include>
    <div class="container-fluid">
      <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
          <ul class="nav nav-sidebar">
            <li class="active">
				<a href="#">My Task<span class="sr-only">(current)</span></a>
			</li>
			<li><hr></li>
			<li><a href="${pageContext.request.contextPath}/admin/user/list">Customer List</a></li>
			<li><a href="${pageContext.request.contextPath}/admin/role/list">Role List</a></li>
			<li><a href="${pageContext.request.contextPath}/admin/resource/list">Resource List</a></li>
			<li><a href="${pageContext.request.contextPath}/admin/card/list">Card List</a></li>
			<li><a href="${pageContext.request.contextPath}/admin/cardCategory/list">Card Category List</a></li>
          </ul>
          <hr>
        </div>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
        	<!-- Nav tabs -->
			<ul class="nav nav-tabs" role="tablist">
				<!-- <li role="presentation"><a href="#allTasks" aria-controls="allTasks" role="tab" data-toggle="tab">All Tasks</a></li> -->
  				<li role="presentation" class="active"><a href="#business" aria-controls="business" role="tab" data-toggle="tab">Buesiness<span class="badge"></span></a></li>
			    <!-- <li role="presentation"><a href="#processingTasks" aria-controls="processingTasks" role="tab" data-toggle="tab">Processing Tasks</a></li>
			    <li role="presentation"><a href="#processedTasks" aria-controls="processedTasks" role="tab" data-toggle="tab">Processed Tasks</a></li>
		    	<li role="presentation"><a href="#allGroupTasks" aria-controls="allGroupTasks" role="tab" data-toggle="tab">Group Tasks<span class="badge"></span></a></li> -->
		    	<!-- <li role="presentation"><a href="#closedTasks" aria-controls="closedTasks" role="tab" 
		    		data-toggle="tab">Closed Tasks</a></li> -->
			</ul>
			<!-- Tab panes -->
		    <div class="tab-content">
		    	<!-- <div role="tabpanel" class="tab-pane fade in" id="allTasks"></div> -->
		   	 	<div role="tabpanel" class="tab-pane fade in active" id="business">Business</div>
		    	<!-- <div role="tabpanel" class="tab-pane fade in" id="processingTasks">处理中任务</div>
		    	<div role="tabpanel" class="tab-pane fade in" id="processedTasks">已处理任务</div>
		    	<div role="tabpanel" class="tab-pane fade in" id="allGroupTasks">待处理的组任务</div> -->
		    	<!-- <div role="tabpanel" class="tab-pane fade in" id="closedTasks">已关闭任务</div> -->
		    </div>
        </div>
      </div>
    </div>
</body>
</html>