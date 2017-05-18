	function pinEle(){ 
		$("#pin").pin({
			containerSelector:".container-fluid",
			padding:{top:51}
		});
	}
	//ajax查询数据库返回添加sales下拉菜单
	function getSalesAndSet(url,sales,obj){
		$.get(url,function(data){
			//console.log(data.length);
			//var data = JSON.parse(data);
			for(var i =0; i<data.length;i++){
				$("#sales").append("<option value="+data[i].username+">"+data[i].username+"</option>");
			}
			for(var i=0;i<obj.length;i++){
				if(obj[i].value==sales){
					obj[i].selected=true;
				}
			}
		});
	}
	//ajax查询数据库返回添加sales下拉菜单
	function getSales(url){
		$.get(url,function(data){
			//var data = JSON.parse(data);
			for(var i =0; i<data.length;i++){
				$("#sales").append("<option value="+data[i].username+">"+data[i].username+"</option>")
			}
		});
		
	}
	
	//修改checkbox选中后的值
	function checkboxSet(){
		$("input[type=checkbox]").each(function(index,domEle){
			var checkboxValue = $(domEle).val();
			if(checkboxValue =="T" || checkboxValue=="Y"){
				console.log($(domEle).attr("id"));
				$(domEle).prop("checked",true);
				$(domEle).val($(domEle).attr("id"));
			}
		});
	}
	
	function shortename(shortename){
		var obj = document.getElementById("shortEname");
		for(var i=0;i<obj.length;i++){
			if(obj[i].value==shortename){
				obj[i].selected=true;
			}
		}
		
	}
	
	function customerkind(customerkind){
		var obj = document.getElementById("customerkind");
		for(var i=0;i<obj.length;i++){
			if(obj[i].value==customerkind){
				obj[i].selected=true;
			}
		}
	}
	
	function beforeAfter(beforeAfter){
		var obj = document.getElementById("beforeAfter");
		for(var i=0;i<obj.length;i++){
			if(obj[i].value==beforeAfter){
				obj[i].selected=true;
			}
		}
	}
	
	function datetype(datetype){
		
		var obj = document.getElementById("datetype");
		for(var i=0;i<obj.length;i++){
			if(obj[i].value==datetype){
				obj[i].selected=true;
			}
		}	
	}
	
	
	
	