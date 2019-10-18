<!--#include file="../Inc/BbsCs.asp"--><!DOCTYPE html>
<html lang="cn">
<head>
<meta name="author" content="EdieLei">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<meta charset="UTF-8">
<title>TpGl</title>
<link rel="stylesheet" href="../Css/Inc.css">
<script src="../Js/jQuery.js"></script>
<script>
$(function(){
	$('a[href^="Del"]').click(function(){if(!confirm("你确定要删除？"))return!1});
	$("#xzall").toggle(function(){$('input[name="xz"]').attr("checked","checked")},function(){$('input[name="xz"]').removeAttr("checked")});
	$('#delxz').click(function(){var a=$('input[name="xz"]:checked');if(0!=a.length){var arr=a.map(function(){return $(this).val();}).get().join(',');if(!confirm("你确定要删除所选？"))return false;$.get('DelTpAll.asp?id='+arr,function(){location.reload()});}});
});
</script>
</head>
<body>
<table border="0" cellpadding="0" cellspacing="0" class="table">
	<tr><th class="th" colspan="5">&nbsp;<a href="TpGl.asp">投票管理</a></th></tr>
    <tr style="font-weight:700;background:#E9FAEF;"><td width="30" align="center" class="td">选择</td><td class="td">标题</td><td width="60" align="center" class="td">投票类型</td><td width="80" align="center" class="td">发布时间</td><td width="68" align="center" class="td">操作</td></tr>
    <%Dim rs,t,i
	Set rs=db.GPR("0:15",Array("Tp:id,bt,lx,sj","","id desc"))
	if Easp.IsN(rs) then
	Easp.W "<tr><td class=""td"" align=""center"" colspan=""5"">暂无投票！</td></tr></table>"
	Else
	t=rs.GetRows(rs.PageSize)
	db.C(rs)
	db.SetPager "default", "总共{recordcount}条记录  每页{pagesize}条 {pageindex}/{pagecount}页 {first}{prev}{liststart}{list}{listend}{next}{last}转到 {jump} 页",Array("listlong:5")
	For i=0 to UBound(t,2)
	%>
    <tr>
    	<td width="30" align="center" class="td"><input type="checkbox" name="xz" value="<%=t(0,i)%>" /></td>
   	  <td class="td"><a href="SeeTp.asp?id=<%=t(0,i)%>"><%Easp.WH t(1,i)%></a></td>
   	  <td width="60" align="center" class="td"><%Easp.W Easp.IIF(t(2,i),"多选","单选")%></td>
   	  <td width="80" align="center" class="td"><%=Easp.DateTime(t(3,i),"yyyy-mm-dd")%></td>
    	<td width="68" align="center" class="td"><a href="EditTp.asp?id=<%=t(0,i)%>">修改</a> | <a href="DelTp.asp?id=<%=t(0,i)%>">删除</a></td>
    </tr><%Next%>
</table>
<div class="page"><span style="float:left;"><input type="image" class="inputimg" id="xzall" src="../Images/xzall.png" alt="全选/取消全选" />&nbsp;<input type="image" class="inputimg" id="delxz" src="../Images/delxz.png" alt="删除所选" /></span><%Easp.W db.GetPager("")%></div><%End if
%>
</body>
</html>