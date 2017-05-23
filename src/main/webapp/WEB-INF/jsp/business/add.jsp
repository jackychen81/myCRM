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
<link type="text/css" rel="stylesheet"	href="${pageContext.request.contextPath}/resources/ztree/css/zTreeStyle.css">
<style type="text/css">
.addBusiness{
	border: 1px solid #eee;
	background-color: #eee;
}
.error{
	color:#a94442;
}
#addBusiness{
	padding-top: 10px;
	padding-bottom: 10px;
}
#serviceList{
	border: 1px solid red;
	background-color: red;
}
.addItem{
	float: right;
}
#list{
	border: 1px solid #bbb;
	height: 130px;
	overflow-y: scroll;  
	border-radius:5px;
}
#menuContent{
	display:none; 
	position: absolute; 
	z-index: 9999;
	background-color: #eee; 
	border: 1px solid #ddd;
	overflow-y: scroll; 
}
#treeDemo{
	margin-top:0; 
	width:180px; 
	height: 200px;
}
/* #close{
	background-color:#fff;
	width: 13px;
	height: 21px;
	color: #aaa;
} */
</style>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/jquery.validate.min.js"></script>
<script type="text/javascript"	src="${pageContext.request.contextPath}/resources/datatable/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/datetimepicker/js/bootstrap-datetimepicker.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/init.js"></script>
<script type="text/javascript"	src="${pageContext.request.contextPath}/resources/ztree/js/jquery.ztree.all.js"></script>
<script type="text/javascript">
var setting = {
		check: {
			enable: true,
			//chkboxType: {"Y":"", "N":""}
			chkStyle: "radio",
			radioType: "all"
		},
		view: {
			dblClickExpand: false
		},
		data : {
			simpleData : {
				enable : true,
				idKey : "itemId",
				pIdKey : "itemPid",
				rootPId : 0
			},
			key : {
				url : "iurl"
			}
		},
		callback: {
			beforeClick: beforeClick,
			onCheck: onCheck
		}
	};
function beforeClick(treeId, treeNode) {
	var zTree = $.fn.zTree.getZTreeObj("treeDemo");
	zTree.checkNode(treeNode, !treeNode.checked, null, true);
	return false;
}
function onCheck(e, treeId, treeNode) {
	var zTree = $.fn.zTree.getZTreeObj("treeDemo"),
	nodes = zTree.getCheckedNodes(true),
	v = "";
	id="";
	price="";
	for (var i=0, l=nodes.length; i<l; i++) {
		v += nodes[i].name + ",";
		id=nodes[i].itemId;
		price=nodes[i].price;
	}
	if (v.length > 0 ) v = v.substring(0, v.length-1);
	var cityObj = $("#citySel");
	cityObj.attr("value", v);
	hideMenu();
}

function showMenu() {
	var cityObj = $("#citySel");
	var cityOffset = $("#citySel").offset();
	//$("#menuContent").css({left:cityOffset.left + "px", top:cityOffset.top + cityObj.outerHeight() + "px"}).slideDown("fast");
	$("#menuContent").css({left:cityOffset.left +cityObj.outerWidth()+ "px", top:cityOffset.top + "px"}).slideDown("fast");

	$("body").bind("mousedown", onBodyDown);
}
function hideMenu() {
	$("#menuContent").fadeOut("fast");
	$("body").unbind("mousedown", onBodyDown);
}
function onBodyDown(event) {
	if (!(event.target.id == "menuBtn" || event.target.id == "citySel" || event.target.id == "menuContent" || $(event.target).parents("#menuContent").length>0)) {
		hideMenu();
	}
}
function showAppointmentDate(){
	$("#appointmentDate").slideDown("fast");
}
function hideAppointmentDate(){
	$("#appointmentDate").fadeOut("fast");
}
$(function(){
	$(".form_datetime").datetimepicker({
		format:'yyyy-mm-dd',
		minView:"month",
		autoclose:true,
		todayBtn: true,
	});
	
	/*init company and user  */
	getAllItem("${pageContext.request.contextPath}/admin/item/listAllItem");
	getUser("${pageContext.request.contextPath}/admin/user/listAll");
	
	$(".remaining").val("");
	var remaining = null;
	var userCard = null;
	var cid = null;
	var discount = null;
	var userId = null;
	var iscoupon = $("#iscoupon").is(':checked');
	var isappointment = $("#isappointment").is(':checked');
	if(!isappointment){
		$("#appointment").val("");
	}else{
		$("#appointmentDate").css("display","");
	}
	$(".addItem").prop("disabled","disabled");
	$(".user").on("change",function(){
		var $card = $(".card");
		userId= $(this).val();
		//console.log(id);
		$card.children().remove();
		$card.append("<option></option>");
		//getCardOfUser("${pageContext.request.contextPath}/admin/card/listCardByUid/"+id);
		$.get("${pageContext.request.contextPath}/admin/card/listCardByUid/"+userId,function(data){
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
		if(cid==null || cid==""){
			$(".addItem").prop("disabled","disabled");
		}else{
			for(var i=0;i<userCard.length;i++){
				if(userCard[i].cid==cid){
					$(".remaining").val(userCard[i].remaining);
				}
			}
			$(".addItem").prop("disabled","");
			
		}
		
	});
	
	
	$(".save").on("click",function(){
		var _list = $("#list li");
		var _appointment = $("#appointment").val();
		if(_list.length==0){
			alert("添加项目！");
		}else{
			var _item = new Array();
			
			for(var i=0;i<_list.length;i++){
				var $list = $(_list[i]);
				var _itemId = $list.children()[0].innerHTML;
				var _count = $list.children()[3].innerHTML;
				var _price = $list.children()[2].innerHTML
				_item.push({itemId:_itemId,count:_count,price:_price});
			}
			
			var _data = {'user.id':userId,'card.cid':cid,item:_item,iscoupon:iscoupon,isappointment:isappointment,appointment:_appointment};
			console.log(_data);
			//data = {bid:"1",totalPrice:"20.25",item:[{name:"项目1",price:"66.66"},{name:"项目2",price:"100.12"}]}
			/* $.ajax({
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
			}); */
			/* if(validateForm()){
				$.post("${pageContext.request.contextPath}/business/add",$("#addBusiness").serializeArray(),function(flag){
					if(flag){
						alert("ok");
					}else{
						alert("error");
					}
				});
			} */
		}
		
	});
	
	$("#myModal .modal-body").on("click","#iscoupon",function(){
		iscoupon = $(this).is(':checked');
	});
	
	$("#myModal .modal-body").on("click","#isappointment",function(){
		isappointment = $(this).is(':checked');
		if(isappointment){
			showAppointmentDate();
		}else{
			hideAppointmentDate();
			$("#appointment").val("");
		}
	});
			
	$(".add").on("click",function(){
		var zTree = $.fn.zTree.getZTreeObj("treeDemo");
		var nodes = zTree.getCheckedNodes();
		var count = $("input[name='count']").val();
		var name = $("input[name='item.name']").val();//nodes[0].name;
		var id = $("input[name='item.itemId']").val();//nodes[0].itemId;
		var price = nodes[0].price;
		if(name!="" && name!=null && count!="" && count!=0 && count!=null){
			$("#list").append("<li><span id='itemId' style='display: none;'>"+id+"</span>Item:<span id='name'>"+name+"</span>		<span id='price'>"+price+"</span>  x  <span id='count'>"+count+"</span><button type='button' id='close'><span aria-hidden='true'>&times;</span></button></li>");
			
			/* console.log(nodes);
			if (nodes.length>0) { 
				zTree.checkNode(nodes[0],false,true);
			} */
			
			//zTree.checkAllNodes(false);
		}else{
			alert("填写项目或数量");
		}
		
	})
	
	$("#myModal .modal-body").on("click","#close",function(){
		$(this).parent("li").remove();
	});
	
	$("#myModal .modal-body").on("click",".item",function(){
		
	});
	
	$(".addItem").on("click",function(){
		$('#myModal').modal('toggle');
		//$("input[name='item.name']").val("");
		//$("input[name='count']").val("");
		$.get("${pageContext.request.contextPath}/admin/item/listAllItem",function(result){
			zTreeObj = $.fn.zTree.init($("#treeDemo"), setting, result);
			zTreeObj.expandAll(true);
		});
		
		/* var itemName=null;
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
		$("#myTable tbody").append(tr); */
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
					<div class="addBusiness col-md-12">
						<!-- <form id="addBusiness" action="" method="post"> -->
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
										<label>Balance</label>
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
								<!-- <div class="row">
									<div class="col-md-2">
										<input class="btn btn-primary submit" type="button" value="submit">
									</div>
								</div> -->
								<div class="row">
									<div class="col-md-2">
										<!-- <label></label> -->
									</div>
						      		<div class="col-md-4">
						      			<!-- <select class="form-control item" name="item.itemId">
											<option></option>	      		
						      			</select> -->
						      		</div>
					      		
						      		<div class="col-md-2">
						      			<!-- <label></label> -->
						      		</div>
						      		<div class="col-md-4">
						      			<!-- <input class="form-control count"  type="text" name="count"> -->
						      		</div>
								</div>
								
							</div>
						<!-- </form> -->
							<div class="addBusiness">
								<button class="btn btn-primary addItem" disabled="disabled" style="margin-left:12px">Add Item</button>
							</div>
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

<!-- Modal -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="myModalLabel">Add Item</h4>
	      </div>
	      <div class="modal-body">
	      	<div class="container-fluid">
				<div class="col-md-6">
					<div class="row">
	    				<div class="col-md-2">
		    				<label>name</label>
		    			</div>
		    			<div class="col-md-4">
							<input class="form-control input-sm" name="item.name" id="citySel" style="width: 120px" readonly type="text" onclick="showMenu();"/>    				
							<input type="hidden" name="item.price">
							<input type="hidden" name="item.itemId">
		    			</div>
		    			<div class="col-md-6 checkbox">
							<label style="float: right">
								<input type="checkbox" id="iscoupon" name="iscoupon">团购
							</label>
						</div>
	    			</div>
	    			<div class="row">
	    				<div class="col-md-2">
		    				<label>count</label>
		    			</div>
		    			<div class="col-md-4">
							<input class="form-control input-sm" style="width: 120px" type="text" name="count"/>    				
		    			</div>
		    			<div class="col-md-6 checkbox">
							<label style="float: right">
								<input type="checkbox" id="isappointment" name="isappointment">预约
							</label>
						</div>
	    			</div>
	    			<div id="appointmentDate" class="row" style="display: none;">
						<div class="col-md-2">
							<label>Date</label>
						</div>
						<div class="col-md-4">
							<input id="appointment" class="form-control input-sm form_datetime" name="appointment" style="width: 120px" type="text">
						</div>
					</div>
	    			<div class="row">
	    				<div class="col-md-2">
		    				<label>add</label>
		    			</div>
		    			<div class="col-md-4">
							<button class="btn btn-s add btn-success">Add</button>		
		    			</div>
    				</div>
				</div>
	    		<div class="col-md-6">
	    			<div class="row">
		    			<div class="col-md-12">
							<ul class="nav nav-sidebar" id="list">	
							</ul>    				
		    			</div>
	    			</div>
	    		</div>
	     	 </div>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	        <button type="button" class="btn btn-primary save">Save changes</button>
	      </div>
	    </div>
	  </div>
	</div>
	<div id="menuContent" class="menuContent">
		<ul id="treeDemo" class="ztree">
		</ul>
	</div>
</body>
</html>