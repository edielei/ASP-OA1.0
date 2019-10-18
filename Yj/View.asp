<!--#include file="../Inc/Cse.asp"--><%
Dim id,r
id=Easp.Get("id:n:0")
r=Easp.db.RT("Yj","id="&id,"bt,uname,nr")
if Easp.IsN(r) then Easp.RR "Gl.asp"
%><!DOCTYPE html>
<html lang="cn">
<head>
<meta name="author" content="EdieLei">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<meta charset="UTF-8">
<title>View</title>
<link rel="stylesheet" href="../Css/Inc.css">

</head>
<body>
<table border="0" cellpadding="0" cellspacing="0" class="table">
	<tr>
		<th class="th" colspan="2">&nbsp;查看意见信息</th>
	</tr>
    <tr>
    	<td width="58" align="right" class="td">标题：</td>
   	  <td class="td"><%Easp.WH r(0)%></td>
  </tr>
    <tr>
    	<td width="58" align="right" class="td">发表人：</td>
   	  <td class="td"><%Easp.WH Easp.db.RT("V_U","uname='"&r(1)&"'","zname")%></td>
  </tr>
    <tr>
   	  <td width="58" align="right" class="td">内容：</td>
   	  <td class="td"><div style="height:280px;overflow:auto;word-wrap:break-word"><%Easp.W r(2)%></div></td>
  </tr>
    <tr>
    	<td width="58" align="right" class="td">&nbsp;</td><td class="td"><input class="btn" type="button" value="返回" onclick="history.back()" /></td>
  </tr>
</table>
</body>
</html>