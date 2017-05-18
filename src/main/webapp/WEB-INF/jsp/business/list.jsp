<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Business List</title>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap.min.css">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/dashboard.css">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/datatable/css/jquery.dataTables.css">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/editor/css/buttons.dataTables.min.css">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/editor/css/select.dataTables.min.css">
<link type="text/css" rel="stylesheet"	href="${pageContext.request.contextPath}/resources/editor/css/editor.dataTables.min.css">
<link type="text/css" rel="stylesheet"	href="${pageContext.request.contextPath}/resources/j-confirm/css/jquery-confirm.css">
<style type="text/css">
td.details-control {
    background: url('${pageContext.request.contextPath}/resources/datatable/images/details_open.png') no-repeat center center;
    cursor: pointer;
}
tr.shown td.details-control{
    background: url('${pageContext.request.contextPath}/resources/datatable/images/details_close.png') no-repeat center center;
    cursor: pointer;
}
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
<script type="text/javascript"	src="${pageContext.request.contextPath}/resources/js/init.js"></script>
<script type="text/javascript">
	
	$(function() {
		//init();
		var roles;
		var userId;
		
		$(".navbar-right li").each(function(i,e){
			$(this).removeClass("active");
		});
		$("#admin").addClass("active");
		
		var params = {"name":"search","value":[]};
		
		var table = $("#myTable").DataTable(
			{
				"processing" : false, // 是否显示取数据时的那个等待提示
				"serverSide" : true,//这个用来指明是通过服务端来取数据
				"ajaxSource" : "${pageContext.request.contextPath}/business/listBusinessByPage",//这个是请求的地址
				"serverParams":function(aoData){
					aoData.push(params);
				},
				"serverData" : retrieveData, // 获取客户端传的参数数据（起始页，页长，search参数等）->服务器端的处理函数
				//dom : 'Bfrtip',
				dom:'B<"new">rtip',
				"order": [[ 1, "asc" ]],
				"columns" : [
			             {
			          	   "class":          'details-control',
			                 "orderable":      false,
			                 "data":           null,
			                 "defaultContent": ''
			             },
				        {
				        	"data":"bid","visible" : false,
				        },
						{
							"data" : "user.username"
						},
						{
							"data":"totalPrice"
						},
						{
							"data" : "date"
						},
						{
							"data" : "status", "orderable":false,
							"render" : function(data, type, row) {
								var button;
								button = '<a href="${pageContext.request.contextPath}/business/update/'+row.bid+'" class="update btn btn-xs btn-warning glyphicon glyphicon-edit" data-trigger="hover" data-toggle="tooltip" data-placement="top" title="Edit"></a>&nbsp'
									+'<button bid="'+row.bid+'" class="setRole btn btn-xs btn-default glyphicon glyphicon-edit" data-trigger="hover" data-toggle="tooltip" data-target="#myModal" data-placement="top" title="Set Role"></button>&nbsp'
									+ '<button bid="'+row.bid+'" class="remove btn btn-xs btn-danger glyphicon glyphicon-trash" data-trigger="hover" data-toggle="tooltip" data-placement="top" title="Delete"></button>'
								return button;
							}
						}
				],
				select : true
			});
		
		//set Role
		$('#myTable').on('click','.setRole',function(e){
			e.preventDefault();
			$('.modal-body div').remove();
			userId = $(this).attr("userId");
			$('#myModal').modal('toggle');
			var col = null;
			var line = Math.ceil(roles.length / 3);
			var $rows = $("<div></div>");
			var index = 0;
			var $row;
			for(var i=1;i<=line;i++){
				$row = $("<div id='"+i+"'class='row'></div>")
				for(var j=0;j<3 && index<roles.length;j++){
					col = "<div class='col-md-4 checkbox' style='margin-top: 10px;'>"+
							"<label>"+
								"<input type='checkbox' value="+roles[index].rid+">"+roles[index].roleName
							"</label>"+
					 	  "</div>";
					$row.append(col);
					index++;
				}
				$rows.append($row);
			}
			$('.modal-body').append($rows);
			$.get("${pageContext.request.contextPath}/admin/role/getRoles/"+userId,function(roles){
				for(var i=0;i<roles.length;i++){
					setDropDownList(roles[i].rid,$("input[type='checkbox']"));
				}
			});
		});
		
		$("#myModal .modal-body").on('click',"input[type='checkbox']",function(){
			var roleId = $(this).val();
			var isChecked = $(this).is(':checked');
			console.log(isChecked);
			if(isChecked){
				//console.log("y");
				$.post("${pageContext.request.contextPath}/admin/role/addUserRole/"+userId+"/"+roleId,function(){
				});
			}else{
				$.post("${pageContext.request.contextPath}/admin/role/deleteUserRole/"+userId+"/"+roleId,function(){
				});
				//console.log("n");
			}
			
		});
		
		//打开关闭子表单
		$('#myTable').on('click','.details-control',function(e){
			e.preventDefault();
			var tr = $(this).closest('tr');
			var row = table.row( tr );
	        if ( row.child.isShown() ) {
	            // This row is already open - close it
	            row.child.hide();
	            tr.removeClass('shown');
	            //checkTreeStatus();
	        }
	        else {
	            // Open this row
	            row.child(format(row.data().item)).show();
	            /*  $("tbody tr").each(function(){
	            	$(this).removeClass('shown');
	            }); */
	            tr.addClass('shown');
	            //checkTreeStatus();
	        }
		});
		
		function format(d){
			var tr="";
			var tab =""
			console.log(d);
			if(d!=null && d.length>0){
				for(var i =0; i<d.length;i++){
					var subTotal = d[i].count * d[i].price * d[i].itemDiscount /100;
					  tr = tr+'<tr>'+
					  			'<td>'+d[i].itemId+'</td>'+
								'<td>'+d[i].name+'</td>'+
								'<td>'+d[i].price+'</td>'+
								'<td>'+d[i].itemDiscount+'%</td>'+
								'<td>'+d[i].count+'</td>'+
								'<td>'+subTotal+'</td>'+
						   '</tr>';
					}
					tab = '<table width="100%">'+
							'<theard>'+
							'<tr>'+
								'<th>Item Id</th>'+
								'<th>Item Name</th>'+
								'<th>Item price</th>'+
								'<th>Item discount</th>'+
								'<th>Item count</th>'+
								'<th>Sub total</th>'+
							'</tr>'+
						'</theard>'+
						'<tbody>'+
							tr
						'</tbody>'+
						'</table>';
					return tab;
			}else{
				return 'empty';
			}
			
		}
		
		//删除
		$("#myTable").on('click','.remove',function(){
			var id = $(this).attr("userId");
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
						 $.get("${pageContext.request.contextPath}/admin/user/delete/"+id,function(flag){
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
	    /* $('#myTable tfoot th').each( function () {
	        var title = $('#myTable thead th').eq( $(this).index() ).text();
	        if(title!="Action"){
	        	$(this).html( '<input type="text" style="width:100%" placeholder="'+title+'" />' );
	        }
	    } ); */
		 
	 	// Apply the search
	   /* table.columns().eq( 0 ).each( function ( colIdx ) {
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
	    } ); */
		
		//自定义按钮，然后回通过datatable的dom绑定到表单上
		$("div.sendMsg2All").html('<button href="#" id="sendMsg2All" class="dt-button" style="float:left">SendMsg2All</button>');
		$("div.pdf").html('<button href="#" id="pdf" class="dt-button" style="float:left">PDF</button>');
		$("div.addUserforMananger").html('<button href="#" id="addUserforMananger" class="dt-button" style="float:left">addUserListforUser</button>');
		$("div.new").html('<a href="${pageContext.request.contextPath}/business/add" id="new" class="dt-button" style="float:left">New</a>');
		//INIT
		function init() {
			$.ajax({
				url : "${pageContext.request.contextPath}/admin/role/initRole",
				async : false,
				dataType : "json",
				contentType : "application/x-www-form-urlencoded;charset=UTF-8",
				success : function(data) {
					//console.log("roles=="+data);
					console.log(data);
					roles=data;
				},
				error : function(msg) {
					alert("error");
				}
			})
		}
		
		$('[data-toggle=tooltip]').tooltip();
		
		$("#sendMsg2All").on('click',function(){
			$.confirm({
				title:"Send message to all staff",
				type:"orange",
				content:"<div class='container'><div class='row'><div class='col-md-3'><textarea id='myMsg' row=5 col=3 class='form-control' ></textarea>",
				buttons:{
					Send:{
						text:"Send",
						action:function(){
							var _myMsg = $("#myMsg");
							var socket = getSocket();
							socket.send(JSON.stringify({
								'name' : '系统',
								'chatContent' : _myMsg.val(),
								'isSysMsg':'sys'
							}));
							_myMsg.val("");
						}
					},
					Cancel:{
						text:"Cancel"
					}
				}
			});
		});
		
		//点击addUserListforUser按钮触发事件
	 	$("#addUserforMananger").on('click',function(){
	 		var row = table.row('.selected');
	 		var emp_id = row.data().emp_id;
	 		var member = null;
	 		var removeTempData = null;
	 		console.log(row.data().emp_id);
	 		$.ajax({
	 			url:"${pageContext.request.contextPath}/admin/user/listAll4Select/"+emp_id,
	 			success:function(data){
	 				$.confirm({
	 					title: 'Add staff for Manager',
						content:
						"<div class='container'><div class='row'><div>"+
							"<input id='left-searcher' type='text' placeholder='left searcher' class='form-control col-md-3' autocomplete='off'/>"+
							"<input id='right-searcher' type='text' placeholder='right searcher' class='form-control col-md-3' autocomplete='off'/>"+
						"</div></div>"+
						"<div class='row'><div id='right'>"+
							"<select autocomplete='off' name='from' id='from' class='form-control' multiple='multiple' size='10' style='width: 100%;font-size:10px;'>"+
							"</select>"+
						"</div>"+
						"<div class='controller'>"+
							"<div><button id='add' class='btn btn-primary' type='button'><span class='glyphicon glyphicon-triangle-right' aria-hidden='true'></span></button></div>"+
							"<div><button id='addAll' class='btn btn-primary' type='button'><span class='glyphicon glyphicon-forward' aria-hidden='true'></span></button></div>"+
							"<div><button id='remove' class='btn btn-primary' type='button'><span class='glyphicon glyphicon-triangle-left' aria-hidden='true'></span></button></div>"+
							"<div><button id='removeAll' class='btn btn-primary' type='button'><span class='glyphicon glyphicon-backward' aria-hidden='true'></span></button></div>"+
						"</div>"+
						"<div id='left'>"+
			    			"<select autocomplete='off' name='to' id='to' class='form-control' multiple='multiple' size='10' style='width: 100%;font-size:10px;'>"+
			    			"</select>"+
			    		"</div></div></div>",
			    		buttons: {
			    			OK:{
			    				action:function(){
			    					console.log("member------------");
									console.log(member);
									console.log("removeTempData------------");
									console.log(removeTempData);
									console.log("JSON.stringify(member)------------");
									console.log(JSON.stringify(member));
									console.log(JSON.stringify(removeTempData));
									//var d = [{username:"1",emp_id:"11"},{username:"2"}];
									if(member!=null){
										$.ajax({
											url:"${pageContext.request.contextPath}/admin/user/addStaff4Manager/"+emp_id,
											type:"POST",
											data:JSON.stringify(member),//{"member":JSON.stringify(member)},
											dataType: "json", 
											async : false,
											//contentType:"application/x-www-form-urlencoded;charset=UTF-8",
											contentType:"application/json;charset=UTF-8",
											success : function(result) {  
										        console.log(result);  
										    } 
										});
									}
									if(removeTempData!=null){
										 $.ajax({
												url:"${pageContext.request.contextPath}/admin/user/removerStaff4Manager",
												type:"POST",
												data:JSON.stringify(removeTempData),
												dataType: "json", 
												async : false,
												contentType:"application/json;charset=UTF-8",
												success : function(result) {  
											        console.log(result);  
											    } 
											});
									}
			    				}
			    			},
			    			Cancel:{
			    				
			    			}
			    		},
			    		onContentReady:function(){
			    			//console.log(data);
							initLeftRight(data);
							//单击左侧事件
							$("#from").on('click',"option",function(){
								$("#add").prop("disabled",false);
							});
							//双击左侧事件
							$("#from").on('dblclick',"option",function(){
								member = addBtn();
							});
							//单击右侧事件
							$("#to").on('click',"option",function(){
								$("#remove").prop("disabled",false);
							});
							//双击右侧事件
							$("#to").on('dblclick',"option",function(){
								removeTempData = removeBtn();
							});
							//添加一个或多个
							$("#add").on('click',function(){
								member = addBtn();
							});
							//添加所有
							$("#addAll").on('click',function(){
								member = addAll();
							});
							//删除一个或多个
							$("#remove").on('click',function(){
								removeTempData = removeBtn();
							});
							//删除所有
							$("#removeAll").on('click',function(){
								//optData = [{name:"java",value:"java"},{name:"html",value:"html"},{name:"jsp",value:"jsp"},{name:"jquery",value:"jquery"}];
								removeTempData = removeAll();
							});
							
							//左侧搜索框按键响应
							$("#left-searcher").on("keyup",function(e){
								$_val = $(this);
								lastTime = e.timeStamp;
								setTimeout(function(){
									if(lastTime - e.timeStamp==0){
										//console.log("延迟1秒");
										var data = $_val.val();
										if((data!="")/*&& e.keyCode!=8*/){
											//console.log(data);
											leftSearch(data);
										}else{
											showLeft(leftOrgData);
										}
									}
								},1000);
							});
							
							//右侧搜索框按键响应
							$("#right-searcher").on("keyup",function(e){
								$_val = $(this);
								lastTime = e.timeStamp;
								setTimeout(function(){
									if(lastTime - e.timeStamp==0){
										//console.log("延迟1秒");
										var data = $_val.val();
										if((data!="")/*&& e.keyCode!=8*/){
											//console.log(data);
											rightSearch(data);
										}else{
											showRight(rightOrgData);
										}
									}
								},1000);
							});
							
							//一个或多个选中的元素置顶
							$("#top").on('click',function(){
								var selected = $("#to option:selected");
								var opt = $("#to option");
								console.log("selected="+selected.length);
								console.log("opt="+opt.length);
								console.log("selected.get="+selected.get(0).index);
								if(selected.get(0).index!=0){
									for(var i=0;i<selected.length;i++){  
					                	var item = $(selected.get(i));  
					                	var top = $(opt.get(0));  
					                 	item.insertBefore(top);  
			                		} 
								}
							});
							//一个或多个选中的元素上移一行
							$("#up").on('click',function(){
								var selected = $("#to option:selected");
								if(selected.get(0).index!=0){
									
									selected.each(function(){  
										$(this).prev().before($(this));  
									});
								}
							});
							//一个或多个选中的元素下移一行
							$("#down").on('click',function(){
								var selected = $("#to option:selected");
								var opt = $("#to option");
								if(selected.get(selected.length-1).index!=opt.length-1){
									for(i=selected.length-1;i>=0;i--){
										var item = $(selected.get(i)); 
										item.insertAfter(item.next());
									}
								}
							});
							//一个或多个选中的元素置底
							$("#buttom").on('click',function(){
								var selected = $("#to option:selected");
								var opt = $("#to option");
								if(selected.get(selected.length-1).index!=opt.length-1){
									for(i=selected.length-1;i>=0;i--){
										var item=$(selected.get(i));
										var buttom = $(opt.get(length-1));
										item.insertAfter(buttom);
									}
								}
							});
						}
						
					});
	 			},
	 			error:function(){
	 				alert("error");
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
	<jsp:include page="../top.jsp"></jsp:include>
	<div class="container-fluid">
		<div class="row">
	<div class="col-sm-3 col-md-2 sidebar">
				<ul class="nav nav-sidebar">
					<li class="active"><a href="${pageContext.request.contextPath}/admin/user/list">Customer List</a></li>
					<li><a href="${pageContext.request.contextPath}/admin/role/list">Role List</a></li>
					<li><a href="${pageContext.request.contextPath}/admin/resource/list">Resource List</a></li>
					<li><a href="${pageContext.request.contextPath}/admin/card/list">Card List</a></li>
					<li><a href="${pageContext.request.contextPath}/admin/cardCategory/list">Card Category List</a></li>
				</ul>
				<hr>
			</div>
			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
				<h1 class="page-header">Business List</h1>
				<div class="table-responsive">
					<div>
						<table class="display" id="myTable" width="100%">
							<thead>
								<tr>
									<th></th>
									<th>Id</th>
									<th>User Name</th>
									<th>Total Price</th>
									<th>Date</th>
									<th>Action</th>
								</tr>
							</thead>
							<tbody></tbody>
							<tfoot>
								<tr>
									<th></th>
									<th>Id</th>
									<th>User Name</th>
									<th>Total Price</th>
									<th>Date</th>
									<th>Action</th>
								</tr>
							</tfoot>
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
	        <h4 class="modal-title" id="myModalLabel">Set Roles</h4>
	      </div>
	      <div class="modal-body">
	      </div>
	      <div class="modal-footer">
	        <!-- <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	        <button type="button" class="btn btn-primary">Save changes</button> -->
	      </div>
	    </div>
	  </div>
	</div>
</body>
</html>