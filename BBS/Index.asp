<!--#include file="../Inc/BbsCs.asp"-->
<!DOCTYPE html>
<html lang="cn">
<head>
<meta name="author" content="EdieLei">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<meta charset="UTF-8">
<title>Index</title>
<link rel="stylesheet" href="../Css/Inc.css">
<style type="text/css">
p{margin:0;}
.td{padding:4px 2px;line-height:20px;border-bottom:1px #DDD solid;}
.hei{color:#666;}
</style>
</head>
<body>
<table border="0" cellpadding="0" cellspacing="0" class="table">
<tr><th class="th" colspan="4">&nbsp;<a href="Index.asp">版块列表</a></th></tr>
<%Dim rs,t,i,a,q
Set rs=db.GR("bk:id,bt,jy,cs","xs=True","px desc")
if Easp.IsN(rs) then
Easp.W "<tr><td class=""td"" align=""4"">暂无版块！</td></tr>"
Else
t=rs.GetRows()
db.C(rs)
For i=0 to UBound(t,2)
Set a=db.Exec("select id,bt,sj,uname from thread where bkid="&t(0,i)&" order by id desc")
%>
<tr>
	<td width="35" align="center" class="td"><img src="../Images/<%Easp.W Easp.IIF(Easp.DateTime(a(2),"yyyy-mm-dd")=Easp.DateTime(now(),"yyyy-mm-dd"),"forum_new.gif"" title=""今日有新帖子""","forum.gif")%>" alt="" width="31" height="29" /></td>
    <td nowrap="nowrap" class="td"><strong><a href="BkT.asp?id=<%=t(0,i)%>"><%Easp.WH Easp.CutStr(t(1,i),"50:...")%></a></strong><br /><span title="<%Easp.WH t(2,i)%>"><a href="BkT.asp?id=<%=t(0,i)%>"><%Easp.WH Easp.CutStr(t(2,i),"52:...")%></a></span></td>
    <td width="80" align="center" nowrap="nowrap" class="td" title="帖子数 / 查看次数"><%Set q=db.Exec("select count(0) from thread where bkid="&t(0,i))
	Easp.W q(0)
	db.C(q)
	%> / <span class="hei"><%=t(3,i)%></span></td>
    <td width="152" nowrap="nowrap" class="td"><%
	if Easp.IsN(a) then
	Easp.W "暂无帖子"
	Else
	Easp.W "<a href=""TzShow.asp?id="&a(0)&""">"&Easp.HtmlEncode(Easp.CutStr(a(1),"24:..."))&"</a>"
	%><br /><%=Easp.DateTime(Cdate(a(2)),now())%>&nbsp;<%Easp.WH Easp.db.RT("V_U","uname='"&a(3)&"'","zname")
	db.C(rs)
	End if%></td>
</tr>
<%Next
End if
%>
</table>
</body>
</html>