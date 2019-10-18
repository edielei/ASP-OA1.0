<!--#include file="../Inc/Cse.asp"--><!DOCTYPE html>
<html lang="cn">
<head>
<meta name="author" content="EdieLei">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<meta charset="UTF-8">
<title>Gzzj</title>
<link rel="stylesheet" href="../Css/Inc.css">
<script src="../Js/jQuery.js"></script>
<script src="../DatePicker/WdatePicker.js"></script>
<script>
$(function(){
	$('a[href^="Del"]').click(function(){if(!confirm("你确定要删除？"))return!1});
	var s=$('#tj');
	s.click(function(){
		var bt=$.trim($('#bt').val());
		var sj=$.trim($('#sj').val());
		if(bt.length+sj.length==0){
			alert('请输入标题或时间进行搜索！');
			$('#bt').focus();
			return false;
		}
		$('#sousuo form').submit();
	});
});
</script>
</head>
<body>
<div id="sousuo"><span style="float:left;"><input type="button" value="新建" class="btnss" onclick="location='AddGzzj.asp'" /></span><form action="SearchGzzj.asp" method="get">标题：<input id="bt" name="bt" style="width:150px;" /> 或 时间：<input id="sj" name="sj" class="input" style="width:70px;" onfocus="WdatePicker()" />&nbsp;<input id="tj" type="submit" value="搜索" class="btnss" /></form></div>
<table border="0" cellpadding="0" cellspacing="0" class="table">
  <tr><th class="th" colspan="3">&nbsp;<a href="Gzzj.asp">工作总结</a></th></tr>
  <tr style="font-weight:700;background:#E9FAEF;">
  	<td class="td">标题</td>
  	<td width="70" align="center" class="td">发表时间</td>
  	<td width="70" align="center" class="td">操作</td>
  </tr>
  <%Dim rs,t,i,rsa,n
Set rs=Easp.db.GPR("0:15",Array("Gzzj:id,bt,sj","uname='"&Easp.Cookie("uinfo>uname:s")&"'","sj desc"))
if Easp.isN(rs) then
Easp.W "<tr><td class=""td"" colspan=""3"" align=""center"">暂无工作总结内容！</td></tr></table>"
else
t=rs.GetRows(rs.pagesize)
Easp.db.C(rs)
Easp.db.SetPager "default", "总共{recordcount}条记录  每页{pagesize}条 {pageindex}/{pagecount}页 {first}{prev}{liststart}{list}{listend}{next}{last}转到 {jump} 页",Array("listlong:5")
for i=0 to UBound(t,2)
%>
  <tr>
    <td class="td"><img src="../Images/btyj.gif" alt="" />&nbsp;&nbsp;<a href="ShowGzzj.asp?id=<%=t(0,i)%>"><%Easp.WH t(1,i)%></a></td>
    <td width="70" align="center" class="td"><%=Easp.DateTime(t(2,i),"yyyy-mm-dd")%></td>
    <td width="70" align="center" class="td"><a href="EditGzzj.asp?id=<%=t(0,i)%>">修改</a> | <a href="DelGzzj.asp?id=<%=t(0,i)%>">删除</a></td>
  </tr>
  <%Next%>
</table>
<div class="page"><%Easp.W Easp.db.GetPager("")%></div><%End If%>
</body>
</html>