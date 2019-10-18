<!--#include file="../Inc/Cse.asp"--><!DOCTYPE html>
<html lang="cn">
<head>
<meta name="author" content="EdieLei">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<meta charset="UTF-8">
<title>List</title>
<link rel="stylesheet" href="../Css/Inc.css">
<script src="../Js/jQuery.js"></script>
<script src="../DatePicker/WdatePicker.js"></script>
<script>
$(function(){
	var s=$('#tj');
	s.click(function(){
		var bt=$.trim($('#bt').val());
		var sj=$.trim($('#sj').val());
		if(bt.length==0&&sj.length==0){
			alert('请输入标题或时间进行搜索！');
			$('#bt').focus();
			return false;
		}
		$('form').submit();
	});
});
</script>
</head>
<body>
<div id="sousuo"><form action="Search.asp" method="get">标题：<input id="bt" name="bt" class="input" style="width:130px;" />&nbsp;或&nbsp;时间：<input id="sj" name="sj" class="srk" style="width:80px;" onfocus="WdatePicker()" /> <input id="tj" type="submit" class="btn" value="搜索" /></form></div>
<table border="0" cellpadding="0" cellspacing="0" class="table">
<tr>
    <th class="th" colspan="4">&nbsp;<a href="List.asp">查看资源文件</a></th>
</tr>
<tr style="font-weight:700;background:#E9FAEF;">
    <td width="30" align="center" class="td">类型</td>
    <td class="td">名称</td>
    <td width="100" align="center" class="td">上传时间</td>
    <td width="60" align="center" class="td">上传者</td>
</tr>
<%
Dim rs,t,i
Set rs=Easp.db.GPR("0:15",Array("Zy:files,bt,sj,uname,ms","bmid="&Easp.Cookie("uinfo>bmid")&" or bmid=0","id desc"))
if Easp.IsN(rs) then
Easp.W "<tr><td class=""td"" colspan=""4"" align=""center"">暂无资源文件！</td></tr></table>"
Else
t=rs.GetRows(rs.PageSize)
Easp.db.C(rs)
Easp.db.SetPager "default", "总共{recordcount}条记录  每页{pagesize}条 {pageindex}/{pagecount}页 {first}{prev}{liststart}{list}{listend}{next}{last}转到 {jump} 页",Array("listlong:5")
For i=0 to UBound(t,2)
%>
<tr>
	<td width="30" align="center" class="td"><img src="../Images/<%Easp.W Easp.CRight(t(0,i),".")%>.png" alt=".<%Easp.W Easp.CRight(t(0,i),".")%> 文件" width="16" height="16" align="absmiddle" /></td>
	<td class="td"><span title="<%Easp.WH t(4,i)%>"><%Easp.WH t(1,i)%></span>　(<a href="../<%=t(0,i)%>" target="_blank" title="点击下载"><img src="../Images/download.png" alt="" align="absmiddle" />下载</a>)</td>
	<td width="100" align="center" class="td"><%Easp.W Easp.DateTime(t(2,i),"yyyy年mm月dd日")%></td>
	<td width="60" align="center" class="td"><%Easp.WH Easp.db.RT("V_U","uname='"&t(3,i)&"'","zname")%></td>
</tr>
<%Next%>
</table>
<div class="page"><%Easp.W Easp.db.GetPager("")%></div><%End if%>
</body>
</html>