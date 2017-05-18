<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Add Card</title>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap.min.css">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/dashboard.css">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/datetimepicker/css/bootstrap-datetimepicker.min.css">
<style type="text/css">
.addCard{
border: 1px solid #eee;
background-color: #eee
}
.error{
	color:#a94442;
}
#addCard{
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
	
	/*init cardCategory and user  */
	var username = document.getElementById("username");
	var cardCategory = document.getElementById("cardCategory");
	getCardCategoryAndSet("${pageContext.request.contextPath}/admin/cardCategory/listCategory","${card.cardCategory.cardCategoryId}",cardCategory);
	getUserAndSet("${pageContext.request.contextPath}/admin/user/listUsers","${card.uid}",username);
	
	$(".submit").on("click",function(){
		//alert("a");
		if(validateForm()){
			$.post("${pageContext.request.contextPath}/admin/card/add",$("#addCard").serializeArray(),function(flag){
				console.log(flag);
				if(flag){
					window.location.href="${pageContext.request.contextPath}/admin/card/list";
				}else{
					alert("error");
				}
			});
		}
	});
	
	function validateForm(){
		return $("#addCard").validate({
			rules:{
				uid:"required",
				'cardCategory.cardCategoryId':"required",
				amount:"required"
			},
			messages:{
				uid:"Please fill in 'UserName'",
				'cardCategory.cardCategoryId':"Please fill in 'Card Category'",
				amount:"Please select 'Amount'",
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
					<li class="active"><a href="${pageContext.request.contextPath}/admin/card/list">Card List</a></li>
					<li><a href="${pageContext.request.contextPath}/admin/cardCategory/list">Card Category List</a></li>
				</ul>
				<hr>
			</div>
			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
				<h1 class="page-header">Add Card</h1>
				<div class="table-responsive">
					<div class="addCard">
						<form id="addCard" action="" method="post">
							<div class="container-fluid">
								<div class="row">
									<div class="col-md-2">
										<label>User Name</label>
									</div>
									<div class="col-md-4">
									  <select id="uid" class="form-control user" name="uid">
											<option></option>
									  </select>
									</div>
									<div class="col-md-2">
										<label>Card Category</label>
									</div>
									<div class="col-md-4">
										<select class="form-control cardCategory" name="cardCategory.cardCategoryId">
											<option></option>
										</select>
									</div>
								</div>
								<br/>
								<div class="row">
									<div class="col-md-2">
										<label>Amount</label>
									</div>
									<div class="col-md-4">
									  <input class="form-control" type="text" name=amount>
									</div>
									<div class="col-md-2">
										<label>Plus Amount</label>
									</div>
									<div class="col-md-4">
									  <input class="form-control" type="text" name=plusAmount>
									</div>
								</div>
								<br/>
								<div class="row">
									<div class="col-md-2">
										<label>Description</label>
									</div>
									<div class="col-md-4">
									  <input class="form-control company" name=description>
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