<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Update Item</title>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap.min.css">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/dashboard.css">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/datetimepicker/css/bootstrap-datetimepicker.min.css">
<style type="text/css">
.updateItem{
border: 1px solid #eee;
background-color: #eee
}
.error{
	color:#a94442;
}
#updateItem{
padding-top: 10px;
padding-bottom: 10px;
}
</style>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/jquery.validate.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/datetimepicker/js/bootstrap-datetimepicker.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/init.js"></script>
<script type="text/javascript">

$(function(){
	$(".form_datetime").datetimepicker({
		format:'yyyy/mm/dd',
		minView:"month",
		autoclose:true,
		todayBtn: true,
	});
	
	/*init company and user  */
	var status = document.getElementById("status");
	setDropDownList("${item.status}",status);
	
	$(".submit").on("click",function(){
		//alert("a");
		if(validateForm()){
			$.post("${pageContext.request.contextPath}/admin/item/update/"+"${item.itemId}",$("#updateItem").serializeArray(),function(flag){
				console.log(flag);
				if(flag){
					window.location.href="${pageContext.request.contextPath}/admin/item/list";
				}else{
					alert("error");
				}
			});
		}
	});
	
	function validateForm(){
		return $("#updateItem").validate({
			rules:{
				name:"required",
				price:"required",
				status:"required"
			},
			messages:{
				name:"Please fill in 'Name'",
				price:"Please fill in 'Price'",
				status:"Please select 'Status'"
			}
		}).form();
	}
});

</script>
<body>
</head>
<body>
<div>
	<jsp:include page="../../top.jsp"></jsp:include>
	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-3 col-md-2 sidebar">
				<ul class="nav nav-sidebar">
					<li><a href="${pageContext.request.contextPath}/admin/user/list">Customer List</a></li>
					<li><a href="${pageContext.request.contextPath}/admin/role/list">Role List</a></li>
					<li><a href="${pageContext.request.contextPath}/admin/resource/list">Resource List</a></li>
					<li><a href="${pageContext.request.contextPath}/admin/card/list">Card List</a></li>
					<li class="active"><a href="${pageContext.request.contextPath}/admin/cardCategory/list">Card Category List</a></li>
				</ul>
				<hr>
			</div>
			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
				<h1 class="page-header">Update Item</h1>
				<div class="table-responsive">
					<div class="updateItem">
						<form id="updateItem" action="" method="post">
							<div class="container-fluid">
								<div class="row">
									<div class="col-md-2">
										<label>Name</label>
									</div>
									<div class="col-md-4">
									  <input class="form-control name" name=name value="${item.name }">
									</div>
									<div class="col-md-2">
										<label>Status</label>
									</div>
									<div class="col-md-4">
										<select id="status" class="form-control" name="status">
											<option></option>
											<option value="0">Disable</option>
											<option value="1">Enable</option>
										</select>
									</div>
								</div>
								<br/>
								<div class="row">
									<div class="col-md-2">
										<label>Price</label>
									</div>
									<div class="col-md-4">
									  <input class="form-control" type="text" name=price value="${item.price }">
									</div>
									<div class="col-md-2">
									</div>
									<div class="col-md-4">
									</div>
								</div>
								<br/>
								<div class="row">
									<div class="col-md-2">
										<input class="btn btn-primary submit" type="button" value="submit">
									</div>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>