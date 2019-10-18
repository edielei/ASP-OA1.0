<!--#include file="../Inc/MailCs.asp"--><%Dim id,r
id=Easp.Get("id:n:0")
r=db.RT("FMail","id="&id,"bt,unames,fjr,nr,fj")
%>
<!DOCTYPE html>
<html lang="cn">
<head>
<meta name="author" content="EdieLei">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<meta charset="UTF-8">
<title>SeeF</title>
<link rel="stylesheet" href="../Css/Inc.css">
</head>
<body>
<div id="sousuo" style="text-align:left;"><input type="button" value="返回" class="btnss" onclick="history.back()" /></div>
<table border="0" cellpadding="0" cellspacing="0" class="table">
	<tr>
		<th class="th">&nbsp;<a href="javascript:location.reload();">查看邮件</a></th>
	</tr>
    <tr>
    	<td class="td" style="line-height:22px;padding:4px 0;">标　题：<%Easp.WH r(0)%><br />收件人：<%Easp.WH r(1)%><br />发件人：<%Easp.WH Easp.db.RT("V_U","uname='"&r(2)&"'","zname")%><br />附　件：<%Easp.W Easp.IIF(Easp.Has(r(4)),"<a href=""../"&r(4)&""" target=""_blank""><img src=""../Images/attach-icon.png"" alt=""下载附件"" align=""absmiddle"" />下载附件</a>","无附件")%></td>
    </tr>
    <tr>
    	<td valign="top" class="td" style="height:180px;padding:4px 0;line-height:20px;"><%Easp.W r(3)%></td>
  </tr>
  <tr>
  	<td style="padding:4px 0;">&nbsp;<input type="button" value="返回" class="btn" onclick="history.back()" /></td>
  </tr>
</table>
</body>
</html>