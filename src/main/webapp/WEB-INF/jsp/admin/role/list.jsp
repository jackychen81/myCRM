<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Role List</title>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap.min.css">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/dashboard.css">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/datatable/css/jquery.dataTables.css">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/editor/css/buttons.dataTables.min.css">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/editor/css/select.dataTables.min.css">
<link type="text/css" rel="stylesheet"	href="${pageContext.request.contextPath}/resources/editor/css/editor.dataTables.min.css">
<link type="text/css" rel="stylesheet"	href="${pageContext.request.contextPath}/resources/j-confirm/css/jquery-confirm.css">
<style type="text/css">
#controller{
	border:1px solid yellow;
	width: 25px;
	height: 200px;
	/* position: relative; */
	float: left;
	margin: 5px 5px 5px 2px;
}

#left-searcher{
	margin:10px 30px 10px 20px;
	width: 100px;
}

#right-searcher{
	margin:10px 20px 10px 50px;
	width: 100px;
}
#right{
	margin:10px 20px 10px 20px;
	/* border: 1px solid #eee; */
	/* height: 130px; */
	width:100px;
	/* position: relative; */
	float: left;
}
.controller{
	margin-top:50px;
	/* position: relative; */
	float: left;

}
#left{
	margin:10px 20px 10px;
	/* border: 1px solid #eee; */
	/* height: 130px; */
	width:100px;
	/* position: relative; */
	float: left;
}

.jconfirm-content-pane {
	height: auto;
}

.jconfirm-content{
	height: auto;
}

</style>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript"	src="${pageContext.request.contextPath}/resources/datatable/js/jquery.dataTables.min.js"></script>
<script type="text/javascript"	src="${pageContext.request.contextPath}/resources/j-confirm/js/jquery-confirm.js"></script>
<script type="text/javascript">
	
	$(function() {
		//init();
		
		$(".navbar-right li").each(function(i,e){
			$(this).removeClass("active");
		});
		$("#admin").addClass("active");
		
		var params = {"name":"search","value":[]};
		
		var table = $("#myTable").DataTable(
			{
				"processing" : false, // 是否显示取数据时的那个等待提示
				"serverSide" : true,//这个用来指明是通过服务端来取数据
				"ajaxSource" : "${pageContext.request.contextPath}/admin/role/listRoleByPage",//这个是请求的地址
				"serverParams":function(aoData){
					aoData.push(params);
				},
				"serverData" : retrieveData, // 获取客户端传的参数数据（起始页，页长，search参数等）->服务器端的处理函数
				//dom : 'Bfrtip',
				dom:'B<"new">rtip',
				"order": [[ 1, "asc" ]],
				"columns" : [
				        {
				        	"data":"rid","visible" : false,
				        },
						{
							"data" : "roleName"
						},
						{
							"data" : "id", "orderable":false,
							"render" : function(data, type, row) {
								var button;
								button = '<button roleId="'+row.rid+'" class="update btn btn-xs btn-warning glyphicon glyphicon-edit" data-trigger="hover" data-toggle="tooltip" data-placement="top" title="Edit"></button>&nbsp'
									+'<button roleId="'+row.rid+'" class="setPermission btn btn-xs btn-default glyphicon glyphicon-edit" data-trigger="hover" data-toggle="tooltip" data-placement="top" title="Set Permission"></button>&nbsp'
									+ '<button roleId="'+row.rid+'" class="remove btn btn-xs btn-danger glyphicon glyphicon-trash" data-trigger="hover" data-toggle="tooltip" data-placement="top" title="Delete"></button>'
								return button;
							}
						}
				],
				select : true
			});
		
		//删除
		$("#myTable").on('click','.remove',function(){
			var id = $(this).attr("roleId")
			console.log(id);
			$.confirm({
			title:'Delete account',
			content: 'Are you sure to Delete it?',
			icon: 'glyphicon glyphicon-exclamation-sign',
			type:'red',
			 buttons: {
				 Delete:{
					 text:'Delete',
					 btnClass:'btn',
					 action:function(){
						 $.get("${pageContext.request.contextPath}/admin/role/delete/"+id,function(flag){
								if(flag){
									table.ajax.reload( null, false );
									$.alert("Delete successfuly");
								}else{
									$.alert("Delete failed");
								}
						});
					 }
				 },
				 cancel:{
					 text:'Cancel',
					 btnClass:'btn-red',  
			     }
			 	}
			});
		});
		
		 // Setup - add a text input to each footer cell
	    $('#myTable tfoot th').each( function () {
	        var title = $('#myTable thead th').eq( $(this).index() ).text();
	        if(title!="Action"){
	        	$(this).html( '<input type="text" style="width:100%" placeholder="'+title+'" />' );
	        }
	    } );
		 
	 	// Apply the search
	   table.columns().eq( 0 ).each( function ( colIdx ) {
	        $( 'input', table.column( colIdx ).footer() ).on( 'change', function () {
	        	params.value.length=0;
	        	$( 'input[type="text"]').each(function(index){
	        		if(this.value!=""){
	        			params.value.push({"name":index,"value":this.value});
	        		}
	        	});
	        	console.log(params.value);
	            table.draw();
	        } );
	    } );
		
		//自定义按钮，然后回通过datatable的dom绑定到表单上
		$("div.new").html('<button href="#" id="new" class="dt-button" style="float:left">New</button>');
		$('[data-toggle=tooltip]').tooltip();
		
		$("#new").on('click',function(){
			//window.location.href="${pageContext.request.contextPath}/admin/role/add";
			$.confirm({
				title:'Add Role',
				content: '<form id="addRole" action="" method="post">'+
							'<div class="container-fluid">'+
							'<div class="row">'+
								'<div class="col-md-10">'+
									'<input class="form-control" type="test" name="roleName" >'+
								'</div>'+
							'</div>'+
							'</div>'+
						 '</from>',
				icon: 'glyphicon glyphicon-exclamation-sign',
				type:'green',
				 buttons: {
					 Add:{
						 text:'Add',
						 btnClass:'btn-green',
						 action:function(){
							 $.post("${pageContext.request.contextPath}/admin/role/add",$("#addRole").serializeArray(),function(flag){
								 console.log(flag);	
								 if(flag){
										table.ajax.reload( null, false );
										$.alert("Add successfuly");
									}else{
										$.alert("Add failed");
									}
							});
						 }
					 },
					 cancel:{
						 text:'Cancel',
						 btnClass:'btn-red',  
				     }
				 	}
				});
		});
	 		
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
	<jsp:include page="../../top.jsp"></jsp:include>
	<div class="container-fluid">
		<div class="row">
	<div class="col-sm-3 col-md-2 sidebar">
				<ul class="nav nav-sidebar">
					<li><a href="${pageContext.request.contextPath}/admin/user/list">Customer List</a></li>
					<li class="active"><a href="${pageContext.request.contextPath}/admin/role/list">Role List</a></li>
					<li><a href="${pageContext.request.contextPath}/admin/resource/list">Resource List</a></li>
				</ul>
				<hr>
			</div>
			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
				<h1 class="page-header">Role List</h1>
				
				<div id="pdfDiv" ></div>
				<div class="table-responsive">
					<div>
						<table class="display" id="myTable" width="100%">
							<thead>
								<tr>
									<th>Id</th>
									<th>Role Name</th>
									<th>Action</th>
								</tr>
							</thead>
							<tbody></tbody>
							<!-- <tfoot>
								<tr>
									<th>Id</th>
									<th>Username</th>
									<th>Action</th>
								</tr>
							</tfoot> -->
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>