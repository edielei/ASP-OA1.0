<!--#include file="../Inc/GzjhCs.asp"--><!DOCTYPE html>
<html lang="cn">
<head>
<meta name="author" content="EdieLei">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<meta charset="UTF-8">
<title>GzjhTypes</title>
<link rel="stylesheet" href="../Css/Inc.css">
<script src="../Js/jQuery.js"></script>
<script src="../Js/jquery.artDialog.js"></script>
<script src="../Js/artDialog.iframeTools.js"></script>
<script>
$(function(){
	$('a[href^="Del"]').click(function(){if(!confirm("你确定要删除？"))return!1});
});
function addnew(){
	art.dialog.open('Office/AddTypes.asp',{
		id:'addgzjhtypes',
		title:'新建类别',
		lock:true,
		duration:0,
		height:60,
		resize:false
	});
}
function edit(num){
	art.dialog.open('Office/EditTypes.asp?id='+num,{
		id:'editgzjhtypes',
		title:'修改类别',
		lock:true,
		duration:0,
		height:60,
		resize:false
	});
}
</script>
</head>
<body>
<div id="sousuo" style="text-align:left;"><input type="button" value="新建" class="btnss" onclick="addnew()" /></div>
<table border="0" cellpadding="0" cellspacing="0" class="table">
	<tr>
		<th class="th" colspan="2">&nbsp;<a href="gzjhTypes.asp">工作计划类别管理</a></th>
	</tr>
    <tr style="font-weight:700;background:#E9FAEF;">
    	<td class="td">类别名称</td>
    	<td width="68" align="center" class="td">操作</td>
    </tr>
    <%Dim rs,t,i
	Set rs=db.GPR("0:15",Array("Types:id,types","uname='"&Easp.Cookie("uinfo>uname:s")&"'","id desc"))
	if Easp.IsN(rs) then
	Easp.W "<tr><td class=""td"" align=""center"" colspan=""2"">暂无类别！</td></tr></table>"
	Else
	t=rs.GetRows(rs.PageSize)
	db.C(rs)
	db.SetPager "default", "总共{recordcount}条记录  每页{pagesize}条 {pageindex}/{pagecount}页 {first}{prev}{liststart}{list}{listend}{next}{last}转到 {jump} 页",Array("listlong:5")
	For i=0 to UBOund(t,2)
	%>
    <tr>
   	  <td class="td"><%Easp.WH t(1,i)%></td>
    	<td width="68" align="center" class="td"><a href="javascript:edit(<%=t(0,i)%>);">修改</a> | <a href="DelTypes.asp?id=<%=t(0,i)%>">删除</a></td>
    </tr>
    <%Next%>
</table>
<div class="page"><%Easp.W db.GetPager("")%></div><%End IF%>
</body>
</html>