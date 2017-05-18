<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Service List</title>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap.min.css">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/dashboard.css">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/ztree/css/zTreeStyle.css">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/j-confirm/css/jquery-confirm.css">
<style type="text/css">

.ztree li span.button.add {
	
	margin-right:2px; 
	background-position:-143px 0px; 
	vertical-align:top; 
	*vertical-align:middle;
}

</style>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/ztree/js/jquery.ztree.all.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/j-confirm/js/jquery-confirm.js"></script>
<script type="text/javascript"	src="${pageContext.request.contextPath}/resources/datatable/js/jquery.dataTables.min.js"></script>
<script type="text/javascript">
var zTreeObj;
var setting = {
		data : {
			simpleData : {
				enable : true,
				idKey : "itemId",
				pIdKey : "itemPid",
				rootPId : 0
			},
			key:{
				url:"iurl"
			}
		},
		check: {
			enable: false
		},
		edit:{
			enable: true
		},
		view: {
			addHoverDom: addHoverDom,
			removeHoverDom: removeHoverDom,
		},
		callback:{
			beforeRemove: zTreeBeforeRemove,
			//onDblClick: zTreeOnDblClick,
			beforeEditName: zTreeBeforeEditName
		}
};

function zTreeBeforeEditName(treeId, treeNode) {
	var _name=null;
	var _price=treeNode.price==undefined?0:treeNode.price;
	var _status=null;
	var _itemPid=treeNode.itemPid;
	console.log(treeNode);
	$.confirm({
		title:"Edit",
		type:"orange",
		content:"<div class='container'>"+
					"<from id='updateItem'>"+
						"<div class='row'>"+
							"<div class='col-md-3'>"+
								"<input type='text' class='form-control' name='name' value="+treeNode.name+">"+
							"</div>"+
						"</div>"+
						"<br/>"+
						"<div class='row'>"+
							"<div class='col-md-3'>"+
								"<input type='text' class='form-control' name='price' value="+_price+">"+
							"</div>"+
						"</div>"+
						"<div class='row'>"+
							"<div class='col-md-3'>"+
								"<label><input type='checkbox' name='status' value="+treeNode.status+">启用</label>"+
							"</div>"+
						"</div>"+
					"</form>"+
				"</div>",
		buttons:{
			UPDATE:{
				text:"Update",
				action:function(){
					_name = $("input[name='name']").val();
					_price = $("input[name='price']").val();
					_status = $("input[name='status']").val();
					console.log(_name);
					console.log(_price);
					console.log(_status);
					$.ajax({
						url:"${pageContext.request.contextPath}/admin/item/update/"+treeNode.itemId+"?name="
								+_name+"&price="+_price+"&status="+_status+"&itemPid="+_itemPid,
						type:"post",
						//data:_item,
						//data:_item,
						success:function(){
							treeNode.name=_name;
							treeNode.price=_price;
							treeNode.status=_status;
							zTreeObj.updateNode(treeNode);
							$.alert("Update successfully");	
						},
						error:function(){
							$.alert("Update failed");
						}
					});
				}
			},
			Cancel:{
				text:"Cancel"
			}
		},
		onContentReady:function(){
			if(treeNode.status==1){
				$("input[name='status']").attr("checked",true);
			}else{
				$("input[name='status']").attr("checked",false);
			}
			$("input[name='status']").on("click",function(){
				var isChecked = $(this).is(':checked');
				if(isChecked){
					$("input[name='status']").val("1");
				}else{
					$("input[name='status']").val("0");
				}
			});
			_name = $("input[name='name']").val();
			_price = $("input[name='price']").val();
			_status = $("input[name='status']").val();
			console.log(_name);
			console.log(_price);
			console.log(_status);
		}
	});
	return false;
}


function zTreeOnDblClick(event, treeId, treeNode){
	$.confirm({
		
	});
}


function zTreeBeforeRemove(treeId, treeNode){
	console.log(treeNode.itemId);
	$.confirm({
		title:"Delete item",
		icon: 'glyphicon glyphicon-exclamation-sign',
		type:"red",
		buttons:{
			Yes:{
				text:"Yes",
				action:function(){
					$.ajax({
						url:"${pageContext.request.contextPath}/admin/item/delete/"+treeNode.itemId,
						type:"post",
						success:function(){
							zTreeObj.removeNode(treeNode);
							$.alert("Delete successfully");
						},
						error:function(){
							$.alert("Delete failed");
						}
					});
					
				}
			},
			No:{
				text:"No",
				btnClass:"btn-red",
				action:function(){
					
				}
			}
		}
	});
	return false;
}

function addHoverDom(treeId, treeNode) {
	var aObj = $("#" + treeNode.tId + "_span");
	//console.log(aObj);
	var newNode=null;
	if ($("#addBtn_"+treeNode.itemId).length>0) return;
	if(!treeNode.editNameFlag){
		var editStr = "<span class='button add' id='addBtn_" +treeNode.itemId
		+ "' title='"+treeNode.name+"' ></span>";
		aObj.after(editStr);
		var btn = $("#addBtn_"+treeNode.itemId);
		if (btn) btn.bind("click", function(){
			//alert("resId="+treeNode.resId+",resPid="+treeNode.resPid);
			//alert(treeNode.children);
			
			if(treeNode.children!=null && treeNode.children.length>0){
				/* if (treeNode.children.length==10) {
					alert("cannot over 10 sons");
					return;
				} */
				for(var i=0;i<treeNode.children.length;i++){
					var isLastNode = treeNode.children[i].isLastNode;
					//alert(isLastNode);
					if(isLastNode){
						var _itemId = treeNode.children[i].itemId+1;
						var _itemPid = treeNode.children[i].itemPid;
						console.log("itemId1="+_itemId);
						console.log("itemPid1="+_itemPid);
						newNode={name:"newNode1",itemId:_itemId,itemPid:_itemPid};
					}
				}
			}else if(treeNode.children==null){
				//alert("null");
				var _itemId = parseInt(treeNode.itemId+"00");
				var _itemPid = treeNode.itemId;
				console.log("itemId2="+_itemId);
				console.log("itemPid2="+_itemPid);
				newNode={name:"newNodesub1",itemId:_itemId,itemPid:_itemPid}
			}
			zTreeObj.addNodes(treeNode,-1,newNode);
			$.ajax({
				url:"${pageContext.request.contextPath}/admin/item/add",
				data:newNode,
				type:"post",
				datatype:"json",
				success:function(){
					$.alert("Add new item successfully");
				},
				error:function(){
					$.alert("Add new item failed");
				}
			});
		});
	}
	
};


function removeHoverDom(treeId, treeNode) {
	$("#addBtn_"+treeNode.itemId).unbind().remove();
};

$(function(){
	
	$(".navbar-right li").each(function(i,e){
		$(this).removeClass("active");
	});
	$("#admin").addClass("active");
	
	$.ajax({
		url:"${pageContext.request.contextPath}/admin/item/listAllItem",
		async : false,
		datatype:"json",
		//contentType:"text/html; charset=UTF-8",
		success:function(result){
			//console.log(result);
			zTreeObj = $.fn.zTree.init($(".ztree"),setting,result);
			zTreeObj.expandAll(true);
		},
		error:function(){
			$.alert("Date load error");
		}
		
	});
	
	
});
</script>
<body>
</head>
<body>
	<jsp:include page="../../top.jsp"></jsp:include>
	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-3 col-md-2 sidebar">
				<ul class="nav nav-sidebar">
					<li><a href="${pageContext.request.contextPath}/admin/user/list">User List</a></li>
					<li><a href="${pageContext.request.contextPath}/admin/role/list">Role List</a></li>
					<li class="active"><a href="${pageContext.request.contextPath}/admin/resource/list">Resource List</a></li>
					<li><a href="${pageContext.request.contextPath}/admin/assets/list">Assets List</a></li>
					<li><a href="${pageContext.request.contextPath}/task/deployTasks">Deployment Management</a></li>
				</ul>
				<hr>
			</div>
			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
				<h1 class="page-header">Service List</h1>
				<div class="table-responsive">
						<div class="ztree"></div>
				</div>
			</div>
		</div>
	</div>
	
</body>
</html>