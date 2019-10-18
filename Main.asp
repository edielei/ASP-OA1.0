<!--#include file="Inc/Cse.asp"--><!DOCTYPE html>
<html lang="cn">
<head>
<meta name="author" content="EdieLei">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<meta charset="UTF-8">
<title>Main</title>
<link rel="stylesheet" href="Css/Inc.css" />
<script>
top.location==self.location&&location.replace("Admin.asp");
</script>
</head>
<body>
<table border="0" cellpadding="0" cellspacing="0" class="table">
  <tr><th class="th" colspan="2"><img src="Images/AM_gg.gif" alt="" /><a href="GongGao/List.asp">公司公告</a></th></tr>
  <%Dim rs,t,i,rsa,n,jc,ys
Set rs=Easp.db.GR("Gg:id,bt,jc,ys,sj:5","xs=True","px desc")
if Easp.isN(rs) then
Easp.W "<tr><td class=""td"" colspan=""2"" align=""center"">暂无公司公告！</td></tr>"
else
t=rs.GetRows()
Easp.db.C(rs)
Easp.XML.Open("Common/wdgg/"&Easp.Cookie("uinfo>uid")&".xml")
For i=0 to UBound(t,2)
jc=Easp.IIF(t(2,i),"font-weight:700;","")
ys=Easp.IIF(Easp.Has(t(3,i)),"color:#"&t(3,i)&";","")
%>
  <tr>
    <td class="td"><img src="Images/btyj.gif" alt="" />&nbsp;&nbsp;<a href="GongGao/Show.asp?id=<%=t(0,i)%>" style="<%=jc%><%=ys%>"><%Easp.WH t(1,i)%></a><%Easp.W Easp.IIF(Easp.Has(Easp.XML("u>gg[id="&t(0,i)&"]")),"&nbsp;&nbsp;<strong style=""color:#F00"">[未读]</strong>","")%></td>
    <td width="70" align="center" class="td"><%=Easp.DateTime(t(4,i),"yyyy-mm-dd")%></td>
  </tr>
  <%Next
  Easp.XML.Close
  End IF%>
    <tr><td colspan="2" align="right" class="more"><a href="GongGao/list.asp" title="查看更多">查看更多&gt;&gt;</a></td></tr>
</table>
<table border="0" cellpadding="0" cellspacing="0" class="table">
  <tr><th class="th" colspan="2"><img src="Images/AM_fg.gif" alt="" /><a href="Zcfg/list.asp">政策法规</a></th></tr><%Set rsa=Easp.db.GR("Fg:id,bt,sj:5","xs=True","px desc")
  IF Easp.isN(rsa) Then
  Easp.W "<tr><td class=""td"" colspan=""2"" align=""center"">暂无政策法规内容！</td></tr>"
  else
  n=rsa.GetRows()
  Easp.db.C(rsa)
  For i=0 to UBound(n,2)
  %>
  <tr>
    <td class="td"><img src="Images/btyj.gif" alt="" />&nbsp;&nbsp;<a href="Zcfg/Show.asp?id=<%=n(0,i)%>"><%Easp.WH n(1,i)%></a></td>
    <td width="70" align="center" class="td"><%=Easp.DateTime(n(2,i),"yyyy-mm-dd")%></td>
  </tr>
  <%
  Next
  End If
  %>
  <tr><td colspan="2" align="right" class="more"><a href="Zcfg/list.asp" title="查看更多">查看更多&gt;&gt;</a></td></tr>
</table>
</body>
</html>