<!--#include file="../Inc/BbsCs.asp"--><%Dim id,bk
id=Easp.Get("id:n:0")
bk=db.RT("bk","id="&id,"bt")
%><!DOCTYPE html>
<html lang="cn">
<head>
<meta name="author" content="EdieLei">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<meta charset="UTF-8">
<title>Bkt</title>
<link rel="stylesheet" href="../Css/BkT.css" />
</head>
<body>
<div class="dh"><img src="../Images/home.png" alt="" />&nbsp;<a href="Index.asp">社区首页</a>&nbsp;&gt;&nbsp;<%Easp.WH bk%></div>
<table border="0" align="center" cellpadding="0" cellspacing="0" class="table">
    <tr><th width="20" align="center">&nbsp;</th><th align="left"><a href="<%=Easp.GetUrl("id")%>">版块主题</a></th><th width="70" align="left">作者</th><th width="65" align="left">回复/查看</th><th width="120" align="left">最后回复</th></tr>
    <%
	Dim rs,t,i
	Set rs=db.GPR("0:10",Array("list:id,bt,uname,sj,hfcs,cs,hfuname,hfsj","bkid="&id,"id desc"))
	if Easp.IsN(rs) then
	Easp.W "<tr><td colspan=""5"" align=""center"">暂无帖子信息！</td></tr></table>"
	Else
	t=rs.GetRows(rs.PageSize)
	db.C(rs)
	db.SetPager "default", "总共{recordcount}条记录  每页{pagesize}条 {pageindex}/{pagecount}页 {first}{prev}{liststart}{list}{listend}{next}{last}转到 {jump} 页",Array("listlong:5")
	For i=0 to Ubound(t,2)
	%>
    <tr>
        <td width="20" align="center"><img src="../Images/folder_<%Easp.W Easp.IIF(Easp.DateTime(t(7,i),"yyyy-mm-dd")=Easp.DateTime(now,"yyyy-mm-dd"),"new.gif"" title=""今日有新回复"" ","common.gif")%>" alt="" width="17" height="17" /></td>
      <td><a href="TzShow.asp?id=<%=t(0,i)%>" target="mkj"><%Easp.WH Easp.CutStr(t(1,i),"50:...")%></a></td>
        <td width="70"><%Easp.WH Easp.db.RT("V_U","uname='"&t(2,i)&"'","zname")%><br /><%=Easp.DateTime(t(3,i),"yyyy-mm-dd")%></td>
        <td width="65"><%=t(4,i)%><br /><%=t(5,i)%></td>
        <td width="120"><%if Easp.IsN(t(6,i)) and Easp.IsN(t(7,i)) then
		Easp.W "暂无回复"
		Else
		Easp.WH Easp.db.RT("V_U","uname='"&t(6,i)&"'","zname")
		Easp.W "<br />"
		Easp.W Easp.DateTime(CDate(t(7,i)),now)
		End if
		%></td>
    </tr>
    <%Next%>
</table>
<div class="page"><%Easp.W db.GetPager("")%></div><%End if%>
<%
Call db.UR("bk","id="&id,"cs=cs+1")
%>
</body>
</html>