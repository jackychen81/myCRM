<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Add Business</title>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap.min.css">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/dashboard.css">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/datatable/css/jquery.dataTables.css">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/datetimepicker/css/bootstrap-datetimepicker.min.css">
<style type="text/css">
.addBusiness{
border: 1px solid #eee;
background-color: #eee
}
.error{
	color:#a94442;
}
#addBusiness{
padding-top: 10px;
padding-bottom: 10px;
}
</style>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/jquery.validate.min.js"></script>
<script type="text/javascript"	src="${pageContext.request.contextPath}/resources/datatable/js/jquery.dataTables.min.js"></script>
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
	getAllItem("${pageContext.request.contextPath}/admin/item/listAllItem");
	getUser("${pageContext.request.contextPath}/admin/user/listAll");
	
	$(".remaining").val("");
	var remaining = null;
	var userCard = null;
	var cid = null;
	var discount = null
	$(".user").on("change",function(){
		var $card = $(".card");
		var id= $(this).val();
		//console.log(id);
		$card.children().remove();
		$card.append("<option></option>");
		//getCardOfUser("${pageContext.request.contextPath}/admin/card/listCardByUid/"+id);
		$.get("${pageContext.request.contextPath}/admin/card/listCardByUid/"+id,function(data){
			userCard=data;
			for(var i =0; i<data.length;i++){
					$(".card").append("<option value='"+data[i].cid+"'>"+data[i].description+"</option>");
					discount = data[i].cardCategory.discount;
			}
		});
	});
	
	$(".card").on("change",function(){
		//$(".remaining").val(remaining);
		cid =$(this).val();
		for(var i=0;i<userCard.length;i++){
			if(userCard[i].cid==cid){
				$(".remaining").val(userCard[i].remaining);
			}
		}
	});
	
	
	//var params = {"name":"search","value":[]};
	/* var bid = "${bid}"==""?"No":"${bid}";
	var table = $("#myTable").DataTable(
			{
				"processing" : false, // 是否显示取数据时的那个等待提示
				"ajaxSource" : "${pageContext.request.contextPath}/business/listBusinessItemByPage/0/0",//这个是请求的地址
				dom:'B<"new">rtip',
				"order": [[ 0, "asc" ]],
				"columns" : [
				        {
				        	"data":"itemId","visible" : false,
				        },
						{
							"data" : "name"
						},
						{
							"data":"price"
						},
						{
							"data" : "itemDiscount"
						},
						{
							"data" : "count"
						},
						{
							"data" : null, "orderable":false,
							"render" : function(data, type, row) {
								var subTotal;
								subTotal = row.price * row.count * row.itemDiscount/100;
								return subTotal;
							}
						},
						{
							"data" : null, "orderable":false,
							"render" : function(data, type, row) {
								var button;
								button = '<a href="${pageContext.request.contextPath}/business/update/'+row.itemId+'" class="update btn btn-xs btn-warning glyphicon glyphicon-edit" data-trigger="hover" data-toggle="tooltip" data-placement="top" title="Edit"></a>&nbsp'
									+'<button bid="'+row.itemId+'" class="setRole btn btn-xs btn-default glyphicon glyphicon-edit" data-trigger="hover" data-toggle="tooltip" data-target="#myModal" data-placement="top" title="Set Role"></button>&nbsp'
									+ '<button bid="'+row.itemId+'" class="remove btn btn-xs btn-danger glyphicon glyphicon-trash" data-trigger="hover" data-toggle="tooltip" data-placement="top" title="Delete"></button>'
								return button;
							}
						}
				],
				select : true
			}); */
	
	$(".submit").on("click",function(){
		var data = {bid:"1",totalPrice:"20.25",item:[{name:"项目1",price:"66.66"},{name:"项目2",price:"100.12"}]}
		$.ajax({
			url:"${pageContext.request.contextPath}/business/add",
			type:"POST",
			data: JSON.stringify(data),
			dateType:"json",
			contentType:"application/json;charset=UTF-8",
			success:function(data){
				console.log(data);
			},
			error:function(data){
				console.log(data);
			}
		});
		/* if(validateForm()){
			$.post("${pageContext.request.contextPath}/business/add",$("#addBusiness").serializeArray(),function(flag){
				if(flag){
					alert("ok");
				}else{
					alert("error");
				}
			});
		} */
	});
	
	$(".addItem").on("click",function(){
		//$('#myModal').modal('toggle');
		var itemName=null;
		var itemCount=null;
		itemName = $(".item option:selected").text();
		itemCount = $(".count").val();
		var tr = "<tr>"+
					"<td>"+itemName+"</td>"+
					"<td>"+price+"</td>"+
					"<td>"+discount+"</td>"+
					"<td>"+itemCount+"</td>"+
					"<td>"+(price*itemCount*discount/100)+"</td>"+
					"<td><button class='remove btn btn-xs btn-danger glyphicon glyphicon-trash' data-trigger='hover' data-toggle='tooltip' data-placement='top' title='Delete'></button></td>"+
				"</tr>";
		$("#myTable tbody").append(tr);
	});
	
	$("#myTable").on("click",".remove",function(){
		$(this).parent().parent().remove();
	});
	
	function validateForm(){
		return $("#addBusiness").validate({
			rules:{
				'user.id':"required",
				'card.cid':"required"
			},
			messages:{
				'user.id':"Please select 'User Name'",
				'card.cid':"Please select 'Card'"
			}
		}).form();
	}
	
	$('[data-toggle=tooltip]').tooltip();
});

function retrieveData(sSource111, aoData111, fnCallback111) {
	$.ajax({
		url : sSource111,//这个就是请求地址对应sAjaxSource
		data : {
			"aoData" : JSON.stringify(aoData111)
		},//这个是把datatable的一些基本数据传给后台,比如起始位置,每页显示的行数
		contentType : "application/x-www-form-urlencoded;charset=UTF-8",
		type : 'get',
		dataType : 'json',
		async : false,
		success : function(result) {
			fnCallback111(result);//把返回的数据传给这个方法就可以了,datatable会自动绑定数据的
			console.log(result.data);
		},
		error : function(msg) {
			alert("error!");
		}
	});
}

</script>
<body>
</head>
<body>
<div>
	<jsp:include page="../top.jsp"></jsp:include>
	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-3 col-md-2 sidebar">
				<ul class="nav nav-sidebar">
					<li><a href="${pageContext.request.contextPath}/index">My Task</a></li>
					<li><hr></li>
					<li><a href="${pageContext.request.contextPath}/admin/user/list">Customer List</a></li>
					<li class="active"><a href="${pageContext.request.contextPath}/admin/user/add">Add Business</a></li>
				</ul>
				<hr>
			</div>
			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
				<h1 class="page-header">Add Business</h1>
				<div class="table-responsive">
					<div class="addBusiness">
						<form id="addBusiness" action="" method="post">
							<div class="container-fluid">
								<div class="row">
									<div class="col-md-2">
										<label>User Name</label>
									</div>
									<div class="col-md-4">
									  <select class="form-control user" name="user.id">
											<option></option>
										</select>
									</div>
									<div class="col-md-2">
										<label>Card</label>
									</div>
									<div class="col-md-4">
										<!-- <input class="form-control form_datetime" type="text" name=purchase_date> -->
										<select id="card" class="form-control card" name="card.cid">
											<option></option>
										</select>
									</div>
								</div>
								<br/>
								<div class="row">
									<div class="col-md-2">
										<label>Remaining</label>
									</div>
									<div class="col-md-4">
									  <input class="form-control remaining" type="text" name=card.remaining readonly>
									</div>
									<div class="col-md-2">
										<label>Total Price</label>
									</div>
									<div class="col-md-4">
										<input class="form-control" type="text" name=totalPrice readonly value="0">
									</div>
								</div>
								<br/>
								<div class="row">
									<div class="col-md-2">
										<input class="btn btn-primary submit" type="button" value="submit">
									</div>
								</div>
								<div class="row">
									<div class="col-md-2">
										<label>Item Name</label>
									</div>
						      		<div class="col-md-4">
						      			<select class="form-control item" name="item.itemId">
											<option></option>	      		
						      			</select>
						      		</div>
					      		
						      		<div class="col-md-2">
						      			<label>Count</label>
						      		</div>
						      		<div class="col-md-4">
						      			<input class="form-control count"  type="text" name="count">
						      		</div>
								</div>
								
							</div>
						</form>
							<div class="addBusiness">
								<button class="btn btn-primary addItem" style="margin-left:12px">Add Item</button>
							</div>
					</div>
					<div>
						<table class="display dataTable no-footer" id="myTable" width="100%">
							<thead>
								<tr>
									<th>Item Name</th>
									<th>Item Price</th>
									<th>Item Discount</th>
									<th>Item Count</th>
									<th>Item SubTotal</th>
									<th>Action</th>
								</tr>
							</thead>
							<tbody></tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- Modal -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="myModalLabel">Add Item</h4>
	      </div>
	      <div class="modal-body">
	      	<div class="row">
	      		<!-- <div><label>Name</label></div>
	      		<div>
	      			<select class="item" name="item.itemId">
						<option></option>	      		
	      			</select>
	      		</div>
	      		<div><label>Count</label></div>
	      		<div>
	      			<input type="text" name="count">
	      		</div> -->
	      	</div>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	        <button type="button" class="btn btn-primary save">Save changes</button>
	      </div>
	    </div>
	  </div>
	</div>
</body>
</html>