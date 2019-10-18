<!--#include file="../Inc/MailCs.asp"--><%Dim id,r,fh
id=Easp.Get("id:n:0")
r=db.RT("SMail","id="&id,"bt,fjr,sj,sjr,isread,nr,fj")
fh=Request.ServerVariables("HTTP_REFERER")
fh=Right(fh,9)
fh=Easp.IIF(fh="Admin.asp","location='SMail.asp'","history.back()")
%>
<!DOCTYPE html>
<html lang="cn">
<head>
<meta name="author" content="EdieLei">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<meta charset="UTF-8">
<title>See</title>
<link rel="stylesheet" href="../Css/Inc.css">
</head>
<body>
<div id="sousuo" style="text-align:left;"><input type="button" value="返回" class="btnss" onclick="<%=fh%>" /></div>
<table border="0" cellpadding="0" cellspacing="0" class="table">
	<tr>
		<th class="th">&nbsp;<a href="javascript:location.reload();">查看邮件</a></th>
	</tr>
    <tr>
    	<td class="td" style="line-height:22px;padding:4px 0;">标　题：<%Easp.WH r(0)%><br />发件人：<%Easp.WH Easp.db.RT("V_U","uname='"&r(1)&"'","zname")%><br />时　间：<%=Easp.DateTime(r(2),"yyyy年mm月dd日 hh:ii:ss")%><br />收件人：<%Easp.WH Easp.db.RT("V_U","uname='"&r(3)&"'","zname")%><br />附　件：<%Easp.W Easp.IIF(Easp.Has(r(6)),"<a href=""../"&r(6)&""" target=""_blank""><img src=""../Images/attach-icon.png"" alt=""下载附件"" align=""absmiddle"" />下载附件</a>","无附件")%></td>
    </tr>
    <tr>
    	<td valign="top" class="td" style="height:180px;padding:4px 0;line-height:20px;"><%Easp.W r(5)%></td>
  </tr>
  <tr>
  	<td style="padding:4px 0;">&nbsp;<input type="button" value="返回" class="btn" onclick="<%=fh%>" /></td>
  </tr>
</table>
</body><%
if Not(r(4)) then
Call db.UR("SMail","id="&id,"isread = true")
End if
%>
</html>
