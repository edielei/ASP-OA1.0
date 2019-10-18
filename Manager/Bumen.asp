<!--#include file="../Inc/Cse.asp"--><!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<meta charset="UTF-8">
<title>Bumen</title>
<link rel="stylesheet" href="../Css/Inc.css">
<link rel="stylesheet" href="../Js/skins/aero.css">
<script src="../Js/jQuery.js"></script>
<script src="../Js/vd.js"></script>
<script src="../Js/jquery.artDialog.js"></script>
<script src="../Js/artDialog.iframeTools.js"></script>
<script>
$(function(){
	$('a[href^="Del"]').click(function(){if(!confirm("你确定要删除？"))return!1});
	var s=$('#tj');
	s.click(function(){
		var bt=$('#bt').vd('请输入部门名称！',1);if(!bt){return}
		var dhzx=$('#zx').vd('请输入直线电话！',1);if(!dhzx){return}
		$.post('AddBmC.asp','bt='+bt+'&zxdh='+dhzx,function(a){
			switch(a){
				case 'CF':alert('该部门已存在，无需重复添加！');$('#bt').focus().select();break;
				case 'OK':alert('添加成功！');location.reload();break;
				case 'Err':alert('操作失败！');location.reload();break;
			}
		});
	});
});
function edit(num){
	art.dialog.open('Manager/EditBm.asp?id='+num,{id:'editbm',title:'修改部门名称',width:250,height:90,resize:false});
}
//上移下移
function UpOne(num){$.get('../C/UpOne.asp?t=Bm&id='+num,function(){location.reload()});}
function DownOne(num){$.get('../C/DownOne.asp?t=Bm&id='+num,function(){location.reload()});}
</script>
</head>
<body>
<div id="sousuo" style="text-align:left;">部门名称：<input id="bt" style="width:80px;" />　直线电话：<input id="zx" class="input" style="width:80px;" /> <input id="tj" type="submit" value="添加" class="btnss" style="padding-bottom:0;" /></div>
<table border="0" cellpadding="0" cellspacing="0" class="table">
<tr><th class="th" colspan="4">&nbsp;<a href="Bumen.asp">部门管理</a></th></tr>
<tr style="font-weight:700;background:#E9FAEF;">
<td class="td">部门名称</td>
<td class="td">直线电话</td>
<td width="50" align="center" class="td">排序</td>
<td width="68" align="center" class="td">操作</td>
</tr><%Dim rs,t,i
Set rs=Easp.db.GR("Bm:id,bt,zx","","px desc")
if Easp.isN(rs) then
Easp.W "<tr><td colspan=""4"" align=""center"">暂无部门！</td></tr>"
else
t=rs.GetRows()
Easp.db.C(rs)	
For i=0 to UBound(t,2)
%>
<tr><td class="td"><a href="ZhiWei.asp?id=<%=t(0,i)%>"><%Easp.WH t(1,i)%></a></td>
<td class="td"><%Easp.WH Easp.IIF(Easp.IsN(t(2,i)),"-",t(2,i))%></td>
<td width="50" align="center" class="td"><img src="../Images/arrow_up.png" alt="上移一位" onclick="UpOne(<%=t(0,i)%>)" /><img class="down" src="../Images/arrow_down.png" alt="下移一位" onclick="DownOne(<%=t(0,i)%>)" /></td>
<td width="68" align="center" class="td"><a class="edit" href="javascript:edit(<%=t(0,i)%>);">修改</a> | <a href="DelBm.asp?id=<%=t(0,i)%>">删除</a></td></tr><%
Next
End if
%></table></body>
</html>