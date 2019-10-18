<!--#include file="../Inc/BbsCs.asp"--><!DOCTYPE html>
<html lang="cn">
<head>
<meta name="author" content="EdieLei">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<meta charset="UTF-8">
<title>TpList</title>
<link rel="stylesheet" href="../Css/Inc.css">
</head>
<body>
<table border="0" cellpadding="0" cellspacing="0" class="table">
	<tr><th class="th" colspan="4">&nbsp;<a href="Tplist.asp">在线投票</a></th></tr>
<tr style="font-weight:700;background:#E9FAEF;"><td class="td">标题</td><td width="60" align="center" class="td">投票类型</td><td width="80" align="center" class="td">发布时间</td><td width="90" class="td">操作</td></tr><%Dim rs,t,i
Set rs=db.GPR("0:15",Array("Tp:id,bt,lx,sj","","id desc"))
if Easp.IsN(rs) then
Easp.W "<tr><td class=""td"" colspan=""4"" align=""center""></td></tr></table>"
Else
t=rs.GetRows(rs.PageSize)
db.C(rs)
db.SetPager "default", "总共{recordcount}条记录  每页{pagesize}条 {pageindex}/{pagecount}页 {first}{prev}{liststart}{list}{listend}{next}{last}转到 {jump} 页",Array("listlong:5")
For i= 0 to UBound(t,2)
%>
<tr>
	<td class="td"><a href="SeeTp.asp?id=<%=t(0,i)%>"><%Easp.WH t(1,i)%></a></td>
	<td width="60" align="center" class="td"><%Easp.W Easp.IIF(t(2,i),"多选","单选")%></td>
	<td width="80" align="center" class="td"><%=Easp.DateTime(t(3,i),"yyyy-mm-dd")%></td>
	<td width="90" class="td"><a href="SeeTp.asp?id=<%=t(0,i)%>">投票</a> | <a href="ViewTp.asp?id=<%=t(0,i)%>">查看结果</a></td>
</tr>
<%Next%>
</table>
<div class="page"><%Easp.W db.GetPager("")%></div><%End if
%>
</body>
</html>