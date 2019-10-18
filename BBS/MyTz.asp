<!--#include file="../Inc/BbsCs.asp"--><!DOCTYPE html>
<html lang="cn">
<head>
<meta name="author" content="EdieLei">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<meta charset="UTF-8">
<title>MyTz</title>
<link rel="stylesheet" href="../Css/Inc.css">
<script src="../Js/jQuery.js"></script>
<script>
$(function(){
	$('a[href^="Del"]').click(function(){if(!confirm("你确定要删除？删除后该帖子的所有回复同时也被删除！"))return!1});
});
</script>
</head>
<body>
<table border="0" cellpadding="0" cellspacing="0" class="table">
	<tr>
		<th class="th" colspan="6">&nbsp;<a href="MyTz.asp">我发表的帖子</a></th>
	</tr>
    <tr style="font-weight:700;background:#E9FAEF;">
    	<td class="td">标题</td>
    	<td width="128" class="td">所属版块</td>
    	<td width="68" align="center" class="td">发布时间</td>
    	<td width="58" align="center" class="td">回复次数</td>
   	  <td width="58" align="center" class="td">查看次数</td>
    	<td width="68" align="center" class="td">操作</td>
    </tr>
    <%
	Dim rs,t,i
	Set rs=db.GPR("0:15",Array("MyTz:id,bt,bk,sj,hfcs,cs,bkid","uname='"&Easp.Cookie("uinfo>uname")&"'","id desc"))
	if Easp.IsN(rs) then
	Easp.W "<tr><td class=""td"" align=""center"" colspan=""6"">暂无发表的帖子！</td></tr></table>"
	Else
	t=rs.GetRows(rs.PageSize)
	db.SetPager "default", "总共{recordcount}条记录  每页{pagesize}条 {pageindex}/{pagecount}页 {first}{prev}{liststart}{list}{listend}{next}{last}转到 {jump} 页",Array("listlong:5")
	db.C(rs)
	For i= 0 to UBound(t,2)
	%>
    <tr>
   	  <td class="td"><a href="TzShow.asp?id=<%=t(0,i)%>"><%Easp.WH Easp.CutStr(t(1,i),"32:...")%></a></td>
        <td width="128" class="td"><a href="BkT.asp?id=<%=t(6,i)%>"><%Easp.WH Easp.CutStr(t(2,i),"20:...")%></a></td>
        <td width="68" align="center" class="td"><%=Easp.DateTime(t(3,i),"yyyy-mm-dd")%></td>
        <td width="58" align="center" class="td"><%=t(4,i)%></td>
      <td width="58" align="center" class="td"><%=t(5,i)%></td>
        <td width="68" align="center" class="td"><a href="EditMyTz.asp?id=<%=t(0,i)%>">修改</a> | <a href="DelMyTz.asp?id=<%=t(0,i)%>">删除</a></td>
    </tr>
    <%Next%>
</table>
<div class="page"><%Easp.W db.GetPager("")%></div><%End if%>
</body>
</html>