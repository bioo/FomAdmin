$.jgrid.defaults.width = 1000;
$.jgrid.defaults.responsive = true;
$.jgrid.defaults.styleUI = 'Bootstrap';


//单选
function getOneRow() {
    var grid = $("#jqGrid");
    var rowKey = grid.jqGrid('getGridParam',"selrow");

    if (rowKey)
        return rowKey;
    else
        alert("请选择一条记录");
}

//选择记录
function getSelectedRow() {
    var grid = $("#jqGrid");
    var rowKey = grid.jqGrid('getGridParam',"selrow");

    if (!rowKey){
        alert("请选择一条记录");
        return;
	} 
	var selectedIDs = grid.jqGrid('getGridParam',"selarrrow");
//    var result = "";
//    for (var i = 0; i < selectedIDs.length; i++) {
//        result += selectedIDs[i] + ",";
//    }
//    alert(result);
	if (selectedIDs.length>1) {
		alert("只能选择一条记录");
        return;
	} 
	
	return selectedIDs[0];
}
//多选提示
function getSelectedRows() {
	var grid = $("#jqGrid");
	var rowKey = grid.jqGrid('getGridParam',"selrow");
	if (!rowKey) {
		alert("至少选择一条记录");
		return;
	}
	return grid.jqGrid('getGridParam',"selarrrow");
}
