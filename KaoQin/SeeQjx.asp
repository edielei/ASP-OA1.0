<!--#include file="../Inc/KqCs.asp"--><%Dim id,r
id=Easp.Get("id:n:0")
r=db.RT("Qj","id="&id,"kssj,jssj,nr,uname")
%><!DOCTYPE html>
<html lang="cn">
<head>
<meta name="author" content="EdieLei">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<meta charset="UTF-8">
<title>See</title>
<link rel="stylesheet" href="../Css/Inc.css">
</head>
<body>
<table border="0" cellpadding="0" cellspacing="0" class="table">
	<tr>
		<th class="th" colspan="2">&nbsp;请假登记 - 查看</th>
	</tr>
    <tr>
      <td align="right" nowrap="nowrap" class="td">姓名：</td>
      <td class="td"><%Easp.WH Easp.db.RT("V_U","uname='"&r(3)&"'","zname")%></td>
    </tr>
    <tr>
    	<td width="65" align="right" nowrap="nowrap" class="td">开始时间：</td>
   	  <td class="td"><%=Easp.DateTime(r(0),"yyyy年mm月dd日 hh:ii")%></td>
  </tr>
    <tr>
      <td width="65" align="right" nowrap="nowrap" class="td">结束时间：</td>
      <td class="td"><%=Easp.DateTime(r(1),"yyyy年mm月dd日 hh:ii")%></td>
  </tr>
    <tr>
    	<td width="65" align="right" nowrap="nowrap" class="td">内容：</td><td class="td"><textarea style="width:530px;height:180px;" class="input"><%Easp.WH r(2)%></textarea></td>
  </tr>
    <tr>
    	<td width="65" align="right" nowrap="nowrap">&nbsp;</td>
   	  <td style="padding:2px"><input type="button" value="返回" class="btn" onclick="history.back()" /></td>
  </tr>
</table>
</body>
</html>