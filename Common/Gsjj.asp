<!--#include file="../Inc/Cse.asp"--><!DOCTYPE html>
<html lang="cn">
<head>
<meta name="author" content="EdieLei">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<meta charset="UTF-8">
<title>Gsjj</title>
<link rel="stylesheet" href="../Css/Inc.css">
</head>
<body><%
Dim xml
xml=Easp.XML.Open("../Manager/Index.xml")
%>
<table class="table" border="0" cellspacing="0" cellpadding="0">
<tr>
	<th class="th" colspan="3">&nbsp;公司简介</th>
</tr>
  <tr>
    <td width="68" align="right" nowrap="nowrap" class="td">公司名称：</td>
    <td colspan="2" class="td"><%Easp.WH Easp.XML("mc").Text%></td>
  </tr>
  <tr>
    <td width="68" align="right" nowrap="nowrap" class="td">公司电话：</td>
    <td class="td"><%Easp.WH Easp.XMl("dh").Text%></td>
    <td nowrap="nowrap" class="td">公司传真：
      <%Easp.WH Easp.XMl("cz").Text%></td>
  </tr>
  <tr>
    <td width="68" align="right" nowrap="nowrap" class="td">公司地址：</td>
    <td class="td"><%Easp.WH Easp.XML("dz").Text%></td>
    <td nowrap="nowrap" class="td">邮政编码：
      <%Easp.WH Easp.XML("yb").Text%></td>
  </tr>
  <tr>
    <td width="68" align="right" nowrap="nowrap" class="td">网站地址：</td>
    <td colspan="2" class="td"><a href="<%Easp.WH Easp.XML("wz").Text%>" target="_blank"><%Easp.WH Easp.XML("wz").Text%></a></td>
  </tr>
  <tr>
    <td width="68" align="right" nowrap="nowrap" class="td">公司简介：</td>
    <td colspan="2" class="td" style="line-height:18px;"><!--#include file="../Manager/IndexNr.html"--></td>
  </tr>
</table>
<%
Easp.XML.Close
%>
</body>
</html>