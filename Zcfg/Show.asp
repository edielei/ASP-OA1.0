<!--#include file="../Inc/Cse.asp"--><%Dim id,rs
id=Easp.Get("id:n:0")
rs=Easp.db.RT("Fg","id="&id,"bt,uname,sj,fj")
if Easp.isN(rs) then Easp.RR "Zcfg/list.asp"
%><!DOCTYPE html>
<html lang="cn">
<head>
<meta name="author" content="EdieLei">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<meta charset="UTF-8">
<link rel="stylesheet" href="../Css/ShowNews.css" />
<title>Show</title>
<script src="../Js/jQuery.js"></script>
<script>
function zt(num){
	$('#nr').css('font-size',num)
}
</script>
</head>
<body>
<div id="top"><label class="gg">政策法规：</label><%Easp.WH rs(0)%></div>
<div class="hx"><div class="back"><a href="javascript:history.back();">&lt;&lt;返回</a></div>发布人：<%=Easp.db.RT("V_U","uname='"&rs(1)&"'","zname")%>　发布时间：<%=Easp.DateTime(rs(2),"yyyy年mm月dd日")%>　<label class="dy"><img src="../Images/print.gif" alt="" width="16" height="16" />&nbsp;<a href="javascript:window.print();">直接打印</a>　字体大小：[<a href="javascript:zt('16px');">大</a> <a href="javascript:zt('14px');">中</a> <a href="javascript:zt('12px');">小</a>]</label></div><div id="nr"><%Easp.W Easp.FSO.Read("Nr/"&id&".html")%><br /><br /><%Easp.W Easp.IIF(Easp.Has(rs(3)),"<img src=""../Images/download.png"" alt="""" /><strong>附件下载</strong>：<a href=""../"&rs(3)&""" target=""_blank"">"&rs(3)&"</a>","")%></div>
<%
Call easp.db.UR("Fg","id="&id,"cs=cs+1")
%>
</body>
</html>