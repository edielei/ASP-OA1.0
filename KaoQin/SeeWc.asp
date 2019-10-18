<!--#include file="../Inc/KqCs.asp"--><!DOCTYPE html>
<html lang="cn">
<head>
<meta name="author" content="EdieLei">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<meta charset="UTF-8">
<title>Wc</title>
<link rel="stylesheet" href="../Css/Inc.css">
<style type="text/css">td{line-height:20px;}</style>
</head>
<body>
<table border="0" cellpadding="0" cellspacing="0" class="table">
	<tr>
		<th class="th" colspan="2">&nbsp;外出登记</th>
	</tr>
<tr style="font-weight:700;background:#E9FAEF;">
    	<td class="td">&nbsp;外出原因</td>
    	<td width="140" class="td">外出时间</td>
    </tr>
    <%
	Dim rs,t,i
	Set rs=db.GPR("0:10",Array("Wc:id,nr,kssj,jssj","uname='"&Easp.Cookie("uinfo>uname")&"'","id desc"))
	if Easp.IsN(rs) then
	Easp.W "<tr><td class=""td"" align=""center"" colspan=""3"">暂无信息</td></tr>"
	Else
	t=rs.GetRows(rs.PageSize)
	db.C(rs)
	For i=0 to UBound(t,2)
	db.SetPager "default", "总共{recordcount}条记录  每页{pagesize}条 {pageindex}/{pagecount}页 {first}{prev}{liststart}{list}{listend}{next}{last}转到 {jump} 页",Array("listlong:5")
	%>
    <tr><td class="td">&nbsp;<a href="SeeWcx.asp?id=<%=t(0,i)%>"><%Easp.WH Easp.CutStr(t(1,i),"76:...")%></a></td><td width="140" class="td">开始：<%=Easp.DateTime(t(2,i),"yyyy-mm-dd hh:ii")%><br />结束：<%=Easp.DateTime(t(3,i),"yyyy-mm-dd hh:ii")%></td></tr>
    <%Next%>
</table>
<div class="page"><%Easp.W db.GetPager("")%></div><%End if%>
</body>
</html>