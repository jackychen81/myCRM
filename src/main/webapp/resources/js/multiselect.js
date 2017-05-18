var lastTime;
var leftOrgData;
var rightOrgData;
var leftSearchResult;
var rightSearchResult;
var tempData;
var removeTempData;

//初始化左右侧
function initLeftRight(data){
	$("#from option").remove();
	rightOrgData = data.right;
	leftOrgData = data.left//JSON.parse(data);
	removeTempData = new Array();
	console.log(leftOrgData);
	for(var i=0;i<leftOrgData.length;i++){
		$("#from").append("<option value='"+leftOrgData[i].emp_id+"'>"+leftOrgData[i].username+"</option>");
	}
	for(var i=0;i<rightOrgData.length;i++){
		$("#to").append("<option value='"+rightOrgData[i].emp_id+"'>"+rightOrgData[i].username+"</option>");
	}
	setButtonsStyle();
}
//显示左侧数据
function showLeft(data){
	$("#from option").remove();
	for(var i=0;i<data.length;i++){
		$("#from").append("<option value='"+data[i].emp_id+"'>"+data[i].username+"</option>");
	}
}
//显示右侧数据
function showRight(data){
	$("#to option").remove();
	for(var i=0;i<data.length;i++){
		$("#to").append("<option value='"+data[i].emp_id+"'>"+data[i].username+"</option>");
	}
}
//根据tempData删除左侧数据
function delLeftOrgDataByTempData(tempData){
	var count = tempData.length;
	for(var i=0;i<leftOrgData.length;i++){
		for(var j=0;j<count;j++){
			if(tempData[j].username==leftOrgData[i].username){
				leftOrgData.splice(i,1);
			}
		}
	}
}
//根据tempData删除右侧数据
function delRightOrgDataByTempData(tempData){
	var count = tempData.length;
	for(var i=0;i<rightOrgData.length;i++){
		for(var j=0;j<count;j++){
			if(tempData[j].username==rightOrgData[i].username){
				rightOrgData.splice(i,1);
			}
		}
	}
}
//添加tempData到左侧数据
function addTempData2LeftOrgData(tempData){
	for(var i=0;i<tempData.length;i++){
		leftOrgData.push({username:tempData[i].username,emp_id:tempData[i].emp_id});
	}
}				
//添加tempData到右侧数据
function addTempData2RightOrgData(tempData){
	for(var i=0;i<tempData.length;i++){
		rightOrgData.push({username:tempData[i].username,emp_id:tempData[i].emp_id});
	}
}
//添加左侧选中数据到tempData
function addLeftSelectedData2TempData(){
	tempData = new Array();
	var count = $("#from option").length;
	for(var i=0;i<count;i++){
		if($("#from").get(0).options[i].selected){
			var username = $("#from").get(0).options[i].text;
			var empId = $("#from").get(0).options[i].value;
			tempData.push({username:username,emp_id:empId});	
		}
	}
	//console.log(tempData);
}
//添加右侧选中数据到tempData
function addRightSelectedData2TempData(){
	tempData = new Array();
	var count = $("#to option").length;
	for(var i=0;i<count;i++){
		if($("#to").get(0).options[i].selected){
			var username = $("#to").get(0).options[i].text;
			var empId = $("#to").get(0).options[i].value;
			tempData.push({username:username,emp_id:empId});	
		}
	}
	//console.log(tempData);
}
//添加左侧所有数据到tempData
function addAllLeftData2TempData(){
	tempData = new Array();
	var count = $("#from option").length;
	for(var i=0;i<count;i++){
		var username = $("#from").get(0).options[i].text;
		var empId = $("#from").get(0).options[i].value;
		tempData.push({username:username,emp_id:empId});	
	}
	//console.log(tempData);
}
//添加右侧所有数据到tempData
function addAllRightData2TempData(){
	tempData = new Array();
	var count = $("#to option").length;
	for(var i=0;i<count;i++){
		var username = $("#to").get(0).options[i].text;
		var empId = $("#to").get(0).options[i].value;
		tempData.push({username:username,emp_id:empId});	
	}
	//console.log(tempData);
}
//添加右侧移除的数据到removeTempData
function addRemoveData2RemoveTempData(tempData){
	//removeTempData = new Array();
	for(var i=0;i<tempData.length;i++){
		removeTempData.push({username:tempData[i].username,emp_id:tempData[i].emp_id});
	}
	console.log("removeTempData---------");
	console.log(removeTempData);
	return removeTempData;
}
//左侧搜索框：匹配输入的内容,返回数据并将结果显示在左侧列表中
function leftSearch(data){
	
	leftSearchResult = new Array();
	for(var i=0;i<leftOrgData.length;i++){
		if(leftOrgData[i].username.toLowerCase().indexOf(data.toLowerCase())!=-1){
			leftSearchResult.push({username:leftOrgData[i].username,emp_id:leftOrgData[i].emp_id});
		}
	}
	showLeft(leftSearchResult);
	console.log("leftSearchResult-------------");
	console.log(leftSearchResult);
}

//右侧搜索框：匹配输入的内容,返回数据并将结果显示在左侧列表中
function rightSearch(data){
	rightSearchResult = new Array();
	//var rightOptObj = $("#to option");
	//var rightOptCount = rightOptObj.length;
	for(var i=0;i<rightOrgData.length;i++){
		if(rightOrgData[i].username.toLowerCase().indexOf(data.toLowerCase())!=-1){
			rightSearchResult.push({username:rightOrgData[i].username,emp_id:rightOrgData[i].emp_id});
		}
	}
	showRight(rightSearchResult);
	console.log("rightSearchResult-------------");
	console.log(rightSearchResult);
}

function setButtonsStyle(){
	$("#add").prop("disabled",true);
	$("#addAll").prop("disabled",true);
	$("#remove").prop("disabled",true);
	$("#removeAll").prop("disabled",true);
	if(rightOrgData.length>0){
		$("#removeAll").prop("disabled",false);
		
	}/*else if(checkRemove){
		$("#remove").prop("disabled",false);
	}*/
	else{
		$("#removeAll").prop("disabled",true);
		//$("#add").prop("disabled",true);
		$("#remove").prop("disabled",true);
		//$("#removeAll").prop("disabled",true);
	}
	if(leftOrgData.length>0){
		$("#addAll").prop("disabled",false);
		//$("#add").prop("disabled",false);
	}
	/*if(checkAdd){
		$("#add").prop("disabled",false);
	}*/
	else{
		$("#addAll").prop("disabled",true);
		$("#add").prop("disabled",true);
		//$("#remove").prop("disabled",true);
		//$("#removeAll").prop("disabled",true);
	}
};

function addBtn(){
	$("#from option:selected").clone().appendTo("#to");
	addLeftSelectedData2TempData();
	$("#from option:selected").remove();
	delLeftOrgDataByTempData(tempData);
	addTempData2RightOrgData(tempData);
	$("#left-searcher").val("");
	//$("#add").prop("disabled",true);
	showLeft(leftOrgData);
	setButtonsStyle();
	console.log("leftOrgData------------------");
	console.log(leftOrgData);
	console.log("rightOrgData-----------------");
	console.log(rightOrgData);
	console.log("tempData---------------------");
	console.log(tempData);
	return rightOrgData;
}

function addAll(){
	$("#from option").clone().appendTo("#to");
	addAllLeftData2TempData();
	$("#from option").remove();
	$("#left-searcher").val("");
	delLeftOrgDataByTempData(tempData);
	addTempData2RightOrgData(tempData);
	setButtonsStyle();
	showLeft(leftOrgData);
	console.log("leftOrgData------------------");
	console.log(leftOrgData);
	console.log("rightOrgData-----------------");
	console.log(rightOrgData);
	console.log("tempData---------------------");
	console.log(tempData);
	return rightOrgData;
}
function removeBtn(){
	$("#to option:selected").clone().appendTo("#from");
	addRightSelectedData2TempData();
	$("#to option:selected").remove();
	delRightOrgDataByTempData(tempData);
	addTempData2LeftOrgData(tempData);
	addRemoveData2RemoveTempData(tempData);
	$("#right-searcher").val("");
	setButtonsStyle();
	//$("#remove").prop("disabled",true);
	showRight(rightOrgData);
	console.log("leftOrgData------------------");
	console.log(leftOrgData);
	console.log("rightOrgData-----------------");
	console.log(rightOrgData);
	console.log("tempData---------------------");
	console.log(tempData);
	return removeTempData;
}
function removeAll(){
	$("#to option").clone().appendTo("#from");
	addAllRightData2TempData();
	$("#to option").remove();
	delRightOrgDataByTempData(tempData);
	addTempData2LeftOrgData(tempData);
	addRemoveData2RemoveTempData(tempData)
	$("#right-searcher").val("");
	setButtonsStyle();
	showRight(rightOrgData);
	console.log("leftOrgData------------------");
	console.log(leftOrgData);
	console.log("rightOrgData-----------------");
	console.log(rightOrgData);
	console.log("tempData---------------------");
	console.log(tempData);
	return removeTempData;
}
				