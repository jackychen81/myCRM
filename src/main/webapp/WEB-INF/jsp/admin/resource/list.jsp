<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Role List</title>
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
				idKey : "resId",
				pIdKey : "resPid",
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
	var _url= treeNode.url==null?"":treeNode.url;
	$.confirm({
		title:"Edit",
		type:"orange",
		content:"<div class='container'><div class='row'><div class='col-md-3'><input type='text' class='form-control' name='name' value="+treeNode.name+"></div></div><br/>"+
		"<div class='row'><div class='col-md-3'><input type='text' class='form-control' name='url' value="+_url+"></div></div></div>",
		buttons:{
			UPDATE:{
				text:"Update",
				action:function(){
					var _name = $("input[name='name']").val();
					var _url = $("input[name='url']").val();
					$.ajax({
						url:"${pageContext.request.contextPath}/admin/resource/update/"+treeNode.resId+"?name="+_name+"&url="+_url,
						type:"post",
						success:function(){
							treeNode.name=_name;
							treeNode.url=_url;
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
		}
	});
	return false;
}


function zTreeOnDblClick(event, treeId, treeNode){
	$.confirm({
		
	});
}

function zTreeBeforeRemove(treeId, treeNode){
	$.confirm({
		title:"Delete item",
		icon: 'glyphicon glyphicon-exclamation-sign',
		type:"red",
		buttons:{
			Yes:{
				text:"Yes",
				action:function(){
					$.ajax({
						url:"${pageContext.request.contextPath}/admin/resource/delete/"+treeNode.resId,
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
	var newNode=null;
	if ($("#addBtn_"+treeNode.tId).length>0) return;
	if(!treeNode.editNameFlag){
		var editStr = "<span class='button add' id='addBtn_" +treeNode.tId
		+ "' title='"+treeNode.name+"' ></span>";
		aObj.after(editStr);
		var btn = $("#addBtn_"+treeNode.tId);
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
						var _resId = treeNode.children[i].resId+1;
						var _resPid = treeNode.children[i].resPid;
						console.log("resId="+_resId);
						console.log("resPid="+_resPid);
						newNode={name:"newNode1",resId:_resId,resPid:_resPid};
					}
				}
			}else /* if(treeNode.children==null) */{
				//alert("null");
				var _resId = parseInt(treeNode.resId+"00");
				var _resPid = treeNode.resId;
				console.log("resId="+_resId);
				console.log("resPid="+_resPid);
				newNode={name:"newNodesub1",resId:_resId,resPid:_resPid}
				/*这里写update父节点的nocheck为true*/
				updateNode={resId:treeNode.resId,nocheck:true};
				$.ajax({
					url:"${pageContext.request.contextPath}/admin/resource/update/"+treeNode.resId,
					data:updateNode,
					type:"post",
					datatype:"json",
					success:function(){
						//$.alert("Update successfully");
					},
					error:function(){
						$.alert("Update failed");
					}
				});
			}
			zTreeObj.addNodes(treeNode,-1,newNode);
			$.ajax({
				url:"${pageContext.request.contextPath}/admin/resource/addResource",
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
	$("#addBtn_"+treeNode.tId).unbind().remove();
};

$(function(){
	
	$(".navbar-right li").each(function(i,e){
		$(this).removeClass("active");
	});
	$("#admin").addClass("active");
	
	$.ajax({
		url:"${pageContext.request.contextPath}/admin/resource/listResource",
		async : false,
		datatype:"json",
		//contentType:"text/html; charset=UTF-8",
		success:function(result){
			console.log(result.data);
			zTreeObj = $.fn.zTree.init($(".ztree"),setting,result.data);
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
	<%-- <nav class="navbar navbar-inverse navbar-fixed-top">
	<div class="container-fluid">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#navbar" aria-expanded="false"
				aria-controls="navbar">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="#">Project name</a>
		</div>
		<div id="navbar" class="navbar-collapse collapse">
			<ul class="nav navbar-nav navbar-right">
				<li><a href="${pageContext.request.contextPath}/index">Home</a></li>
				<li class="active"><shiro:hasRole name="ADMIN">
						<a href="${pageContext.request.contextPath}/admin/user/list">Admin</a>
					</shiro:hasRole></li>
				<li><shiro:hasRole name="HR">
						<a href="javascript:;">HR</a>
					</shiro:hasRole></li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">Forms <span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="${pageContext.request.contextPath}/cargo2k/customer/list">Cargo2k</a></li>
						<li role="separator" class="divider"></li>
						<li><a href="#">Leave Application</a></li>
						<li><a href="#">OT Application</a></li>
						<li><a href="#">Annual Leave</a></li>
						<li role="separator" class="divider"></li>
						<li><a href="#">Cash Advance</a></li>
						<li><a href="#">Payment Voucher</a></li>
						<li role="separator" class="divider"></li>
					</ul></li>
				<li><a href="javascript:;">Settings</a></li>
				<li><a href="${pageContext.request.contextPath}/logout">Logout</a></li>
				<li><a href="javascript:;">Help</a></li>
			</ul>
			<!-- <form class="navbar-form navbar-right">
            <input type="text" class="form-control" placeholder="Search...">
          </form> -->
		</div>
	</div>
	</nav> --%>
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
				<!-- <ul class="nav nav-sidebar">
          	<li><a href="#" link="cargo2k/customer/list">Cargo2k</a></li>
            <li><a href="">Leave Application</a></li>
            <li><a href="">OT Application</a></li>
          </ul>
           <hr>
          <ul class="nav nav-sidebar">
            <li><a href="">Nav item again</a></li>
          </ul> -->
			</div>
			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
				<h1 class="page-header">Resource List</h1>
				<div class="table-responsive">
						<div class="ztree"></div>
				</div>
			</div>
		</div>
	</div>
	
</body>
</html>