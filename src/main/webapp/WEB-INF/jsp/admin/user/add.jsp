<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Add Customer</title>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap.min.css">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/dashboard.css">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/datetimepicker/css/bootstrap-datetimepicker.min.css">
<style type="text/css">
.addCustomer{
border: 1px solid #eee;
background-color: #eee
}
.error{
	color:#a94442;
}
#addCustomer{
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
	//getCompany("${pageContext.request.contextPath}/admin/company/list");
	//getUser("${pageContext.request.contextPath}/admin/user/listAll");
	
	$(".submit").on("click",function(){
		//alert("a");
		if(validateForm()){
			$.post("${pageContext.request.contextPath}/admin/user/add",$("#addCustomer").serializeArray(),function(flag){
				console.log(flag);
				if(flag){
					window.location.href="${pageContext.request.contextPath}/admin/user/list";
				}else{
					alert("error");
				}
			});
		}
	});
	
	function validateForm(){
		return $("#addCustomer").validate({
			rules:{
				username:"required",
				password:"required",
				gender:"required",
				userType:"required",
				status:"required"
			},
			messages:{
				username:"Please fill in 'UserName'",
				password:"Please fill in 'Password'",
				gender:"Please select 'Gender'",
				userType:"Please select 'user Type'",
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
					<li><a href="${pageContext.request.contextPath}/index">My Task</a></li>
					<li><hr></li>
					<li><a href="${pageContext.request.contextPath}/admin/user/list">Customer List</a></li>
					<li class="active"><a href="${pageContext.request.contextPath}/admin/user/add">Add Customer</a></li>
				</ul>
				<hr>
			</div>
			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
				<h1 class="page-header">Add Customer</h1>
				<div class="table-responsive">
					<div class="addCustomer">
						<form id="addCustomer" action="" method="post">
							<div class="container-fluid">
								<div class="row">
									<div class="col-md-2">
										<label>User Name</label>
									</div>
									<div class="col-md-4">
									  <input class="form-control company" name=username>
									</div>
									<div class="col-md-2">
										<label>User Type</label>
									</div>
									<div class="col-md-4">
										<!-- <input class="form-control form_datetime" type="text" name=purchase_date> -->
										<select class="form-control" name="userType">
											<option></option>
											<option value="4">Normal</option>
											<option value="5">VIP 1</option>
											<option value="6">VIP 2</option>
											<option value="7">VVIP</option>
										</select>
									</div>
								</div>
								<br/>
								<div class="row">
									<div class="col-md-2">
										<label>Password</label>
									</div>
									<div class="col-md-4">
									  <input class="form-control" type="password" name=password>
									</div>
									<div class="col-md-2">
										<label>Status</label>
									</div>
									<div class="col-md-4">
										<select class="form-control" name=status>
											<option></option>
											<option value="1">Enable</option>
											<option value="0">Disable</option>
										</select>
									</div>
								</div>
								<br/>
								<div class="row">
									<div class="col-md-2">
										<label>Gender</label>
									</div>
									<div class="col-md-4">
									  <select class="form-control user" name=gender>
									  	<option></option>
									  	<option value="1">Male</option>
									  	<option value="0">Female</option>
									  </select>
									</div>
									<div class="col-md-2">
										<!-- <label>Location</label> -->
									</div>
									<div class="col-md-4">
										<!-- <input class="form-control" type="text" name=location> -->
									</div>
								</div>
								<br/>
								<div class="row">
									<div class="col-md-2">
										<label>Age</label>
									</div>
									<div class="col-md-4">
									  <input class="form-control" type="text" name=age>
									</div>
									<div class="col-md-2">
										<!-- <label>Assets Code</label> -->
									</div>
									<div class="col-md-4">
										<!-- <input class="form-control" type="text" name=code> -->
									</div>
								</div>
								<br/>
								<div class="row">
									<div class="col-md-2">
										<label>Wechat Number</label>
									</div>
									<div class="col-md-4">
									  <input class="form-control" type="text" name=wechat>
									</div>
									<div class="col-md-6">
									 <!--  <div class="radio">
									    <label>
									      <input class="invoice_type" type="radio" name="invoice_type" value="1">Normal VAT invoice
									    </label>
									   <label>
									      <input class="invoice_type" type="radio" name="invoice_type" value="2">Special VAT invoice
									   </label>
									 </div> -->
									</div>
								</div>
								<br/>
								<div class="row">
									<div class="col-md-2">
										<label>Phone Number</label>
									</div>
									<div class="col-md-4">
									  <input class="form-control" type="text" name=phone>
									</div>
									<div class="col-md-2">
									</div>
									<div class="col-md-4">
										<!-- <select class="form-control" id="status" name="status">
											<option value="1">In USE 正常使用中</option>
											<option value="2">BROKEN 损坏</option>
											<option value="3">LOSE 丢失</option>
											<option value="4">UNUSED 闲置</option>
										</select> -->
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