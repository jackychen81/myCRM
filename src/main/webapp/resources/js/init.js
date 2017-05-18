//回显下拉框数据
function setDropDownList(data,obj){
	//console.log(obj.length);
	for(var i=0;i<obj.length;i++){
		if(obj[i].value==data){
			obj[i].selected=true;
			obj[i].checked=true;
		}
	}
}

//ajax查询数据库返回添加company下拉菜单
function getCompanyAndSet(url,company,obj){
	$.get(url,function(data){
		//var data = JSON.parse(data);
		for(var i =0; i<data.length;i++){
			$(".company").append("<option value='"+data[i].com_name+"'>"+data[i].com_name+"</option>");
		}
		setDropDownList(company,obj);
	});
}
//ajax查询数据库返回company下拉菜单
function getCompany(url){
	$.get(url,function(data){
		//var data = JSON.parse(data);
		for(var i =0; i<data.length;i++){
			$(".company").append("<option value='"+data[i].com_name+"'>"+data[i].com_name+"</option>")
		}
	});
}

//ajax getBu
function getBu(url){
	$.get(url,function(data){
		//var data = JSON.parse(data);
		for(var i =0; i<data.length;i++){
			$(".bu").append("<option value='"+data[i].bu_name+"'>"+data[i].bu_name+"</option>")
		}
	});
}
//ajax getBuAndSet
function getBuAndSet(url,bu,obj){
	$.get(url,function(data){
		//var data = JSON.parse(data);
		for(var i =0; i<data.length;i++){
			$(".bu").append("<option value='"+data[i].bu_name+"'>"+data[i].bu_name+"</option>")
		}
		setDropDownList(bu,obj);
	});
}

//ajax getUser
function getUser(url){
	$.get(url,function(data){
		console.log(data);
		//var data = JSON.parse(data);
		for(var i =0; i<data.length;i++){
			if(data[i].emp_stat != "Left"){
				$(".user").append("<option value='"+data[i].id+"'>"+data[i].username+"</option>")
			}
		}
	});
}

//ajax getUserAndSet
function getUserAndSet(url,user,obj){
	$.get(url,function(data){
		//var data = JSON.parse(data);
		for(var i =0; i<data.length;i++){
			if(data[i].status==1){
				$(".user").append("<option value='"+data[i].id+"'>"+data[i].username+"</option>");
			}
		}
		if(obj!=null){
			setDropDownList(cardCategory,obj);	
		}
	});
}

//ajax getUserAndSet
function getAllUserAndSet(url,user,obj){
	$.get(url,function(data){
		//var data = JSON.parse(data);
		for(var i =0; i<data.length;i++){
			$(".allUser").append("<option value='"+data[i].username+"'>"+data[i].username+"</option>")
		}
		setDropDownList(user,obj);
	});
}

//getDept
function getDept(url){
	$.get(url,function(data){
		for(var i =0; i<data.length;i++){
			$(".dept").append("<option value='"+data[i].dept_name+"'>"+data[i].dept_name+"</option>")
		}
	});
}

//getDeptAndSet
function getDeptAndSet(url,dept,obj){
	$.get(url,function(data){
		for(var i =0; i<data.length;i++){
			$(".dept").append("<option value='"+data[i].dept_name+"'>"+data[i].dept_name+"</option>")
		}
		setDropDownList(dept,obj);
	});
}

//getCardCategoryAndSet
function getCardCategoryAndSet(url,cardCategory,obj){
	$.get(url,function(data){
		for(var i =0; i<data.length;i++){
			if(data[i].cardCategoryStatus=="1"){
				$(".cardCategory").append("<option value='"+data[i].cardCategoryId+"'>"+data[i].name+"</option>")
			}
		}
		if(obj!=null){
			setDropDownList(cardCategory,obj);	
		}
	});
}

function getCardOfUser(url){
	$.get(url,function(data){
		console.log(data);
		for(var i =0; i<data.length;i++){
			if(data[i].cardCategory.cardCategoryStatus=="1"){
				$(".cardCategory").append("<option value='"+data[i].cardCategory.cardCategoryId+"'>"+data[i].cardCategory.name+"</option>")
				//$(".remaining").val(data[i].card.remaining);
			}
		}
	});
}

function getAllItem(url){
	$.get(url,function(data){
		for(var i =0; i<data.length;i++){
			$(".item").append("<option value='"+data[i].itemId+"'>"+data[i].name+"</option>")
		}
	});
}

