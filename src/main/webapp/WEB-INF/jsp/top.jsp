<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style type="text/css">
#console-container {
	position: fixed;
	right: 50%;
	top: 0px;
	width: 600px;
	heihgt: 0px;
	margin-right:-300px;
	background-color: yellow;
	z-index: 2;
}

#console {
	position: absolute;
	/*border: 1px solid #CCCCCC;
	border-right-color: #999999;
	border-bottom-color: #999999; */
	height: 100%;
	padding: 5px;
	width: 100%;
	z-index: 2;
}

#console p {
	padding: 10;
	margin: 0;
	/* text-align: right; */
}

#console p.sys {
	padding: 10;
	margin: 0;
	text-align: center;
	color: #aaa;
}

#console p.self {
	padding: 10;
	margin: 0;
	text-align: right;
	color: red;
}

/* #aboutMe1{
	height: 80px;
	width: 400px;
} */
</style>
<div id="console-container">
	<div id="console"></div>
</div>
<nav class="navbar navbar-inverse navbar-fixed-top">
	<div class="container-fluid">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#navbar" aria-expanded="false"
				aria-controls="navbar">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="#" data-toggle="popover"
				data-trigger="focus" data-container="body" data-placement="bottom">My CRM</a>
		</div>
		<div id="navbar" class="navbar-collapse collapse">
			<ul class="nav navbar-nav navbar-right">
				<li id="myTask" class="active"><a
					href="${pageContext.request.contextPath}/index">My Task<span
						id="navcount" class="badge"></span></a></li>
				<li id="admin"><%-- <shiro:hasRole name="ADMIN"> --%>
						<a href="${pageContext.request.contextPath}/admin/user/list">Admin</a>
					<%-- </shiro:hasRole> --%></li>
				<li id="forms" class="dropdown"><a href="#"
					class="dropdown-toggle" data-toggle="dropdown" role="button"
					aria-haspopup="true" aria-expanded="false">Forms <span
						class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a
							href="${pageContext.request.contextPath}/cargo2k/customer/list">Cargo2k</a></li>
						<li role="separator" class="divider"></li>
						<li><a
							href="${pageContext.request.contextPath}/leaveBill/listMy">Leave
								Application</a></li>
						<li><a href="#">OT Application</a></li>
						<li><a href="#">Annual Leave</a></li>
						<li role="separator" class="divider"></li>
						<li><a
							href="${pageContext.request.contextPath}/cashAdvance/listMy">Cash
								Advance</a></li>
						<li><a href="#">Payment Voucher</a></li>
					</ul></li>
				<li id="help" class="dropdown"><a style="padding: 0px"
					href="javascript:;" class="dropdown-toggle" data-toggle="dropdown"
					role="button" aria-haspopup="true" aria-expanded="false">
					<img alt="status" src="${pageContext.request.contextPath}/resources/image/online.jpg" style="float:left">
					<img alt="userImg" class="userImg"
						src="#" style="width: 55px;height: 50px"></a>
					<ul class="dropdown-menu" style="width: 280px">
						<li>
							<img alt="status" src="${pageContext.request.contextPath}/resources/image/online.jpg" style="padding-left:15px;float:left">
							<img style="width:50px;height:50px " alt="userImg2" class="userImg"
							src="#" >
							<%-- <span id='principal'><shiro:principal></shiro:principal></span> --%></li>
						<li role="separator" class="divider"></li>
						<li><a id="aboutMe" href="#">About Me</a></li>
						<li role="separator" class="divider"></li>
						<li><a href="${pageContext.request.contextPath}/logout">Logout</a></li>
					</ul></li>
			</ul>
			<!-- <form class="navbar-form navbar-right">
            <input type="text" class="form-control" placeholder="Search...">
          </form> -->
		</div>
	</div>
</nav>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/j-confirm/css/jquery-confirm.css">
<script type="text/javascript"src="${pageContext.request.contextPath}/resources/sockjs-0.3.4.min.js"></script>
<%-- <script type="text/javascript"src="${pageContext.request.contextPath}/resources/js/top.js"></script> --%>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/j-confirm/js/jquery-confirm.js"></script>
<script type="text/javascript">
	
	function out1() {
		$("#console-container").animate({
			width : '600px',
			height : '0px',
			opacity : '0',
		}, 2500);
	}
	
	$(function() {
		var name = '${name}';
		var url = null;
		var socket;
		var firends = new Array();
		var _u = null;
		
		$('[data-toggle=popover]').popover({
			"html" : true,
			"content" : '<div>Text...</div>'
		});
		
		/* socket = getCon('${pageContext.request.contextPath}/sockjs/webSocketIMServer');
		socket.onopen = function(event) {
			console.log("WebSocket:已连接");
			console.log(event);
		}
		socket.onerror = function(event) {
			console.log("WebSocket:发生错误 ");
			console.log(event);
		};
		socket.onclose = function(event) {
			console.log("WebSocket:已关闭");
			console.log(event);
		};

		socket.onmessage = function(event) {
			console.log(event.data);
			var message = JSON.parse(event.data);
			showGreeting(message);
		}; */
		
		/* var principal = $("#principal").text();
		
		console.log(principal);
		$.get("${pageContext.request.contextPath}/admin/user/findByUsername/"+principal,function(data){
			_u = data;
			console.log("email="+_u.e_mail);
			if(_u.imgUrl!=null && _u.imgUrl!=""){
				imgUrl = "/upload_path"+_u.imgUrl;
			}else{
				imgUrl ="${pageContext.request.contextPath}/resources/image/userImg3.jpg"; 
			}
			$(".userImg").attr("src",imgUrl);
		}); */
		
		
		$("#aboutMe").on('click',function(){
			$.confirm({
				title: 'About Me',
			    content:  "<label>Name:</label><br/>"+
			    		  "<label>Email:</label>"+_u.e_mail+
						  "<form id = 'aboutMe1' action='${pageContext.request.contextPath}/admin/user/uploadImg' enctype='multipart/form-data' method='POST'>"+
			      			"<label style='float:left'>Image:</label><input type='file' name='file' style='width:200px'/><br/>"+
			      			"<input type='submit' value='Submit'>"+
			      		  "</form>",
			    //icon: 'glyphicon glyphicon-exclamation-sign',
			    type:'green',
			    buttons: {
			        /* Upload: {
			        	text:'Upload',
			        	btnClass: 'btn',
			            action:function () {
				        	
				        }
			        }, */
			        OK: {
			        	btnClass: 'btn-green',
			        }
			    }
			})
		});
		
		function showGreeting(message) {
			$("#console p").empty();
			var _console = document.getElementById('console');
			var p = document.createElement('p');
			var _navcount=0;
			var count = 0;
			p.style.wordWrap = 'break-word';
			if(undefined==message.count){
				p.innerHTML = decodeURIComponent(message.name) + ": "+ decodeURIComponent(message.chatContent);
			}else{
				if('${user.username}'==(message.username)){
					count = message.count;
					if(count==0){
						count="";
					}
					$("a[href='#pendingTasks'] span").text(count);
				}
				
				_navcount +=count;
				var table = $("#myPendingTasksTable").DataTable();
				table.ajax.reload( null, false );
				
			}
			if(undefined!=message.countGroup){
				var countGroup = message.countGroup;
				if(countGroup==0){
					countGroup="";
				}
				$("a[href='#allGroupTasks'] span").text(countGroup);
				_navcount +=countGroup;
				var groupTable = $("#myGroupPendingTasksTable").DataTable();
				groupTable.ajax.reload( null, false );
			}
			if(Number(_navcount)==0){
				_navcount="";
				$("#navcount").text(_navcount);
			}else if('${user.username}'==(message.username)){
				$("#navcount").text(Number(_navcount));
			}
			if(undefined!=message.kickout){
				window.location.href="${pageContext.request.contextPath}/logout";
			}
			_console.appendChild(p);

			if (message.isSysMsg == "sys") {
				p.className = 'sys';
				$("#console-container").animate({
					height : '50px',
					opacity : '1',
				}, 2500);
				setTimeout("out1()", 10000);
			} else if (decodeURIComponent(message.name) == decodeURIComponent('${name}')) {
				p.className = 'self';
			}
			while (_console.childNodes.length > 25) {
				_console.removeChild(console.firstChild);
			}
			_console.scrollTop = console.scrollHeight;
		}

		
});

</script>