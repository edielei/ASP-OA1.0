<!--#include file="../Inc/KqCs.asp"--><%
Dim uname
uname=Easp.Get("uname:s")
%><!DOCTYPE html>
<html lang="cn">
<head>
<meta name="author" content="EdieLei">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<meta charset="UTF-8">
<title>Qj</title>
<link rel="stylesheet" href="../Css/Inc.css">
<link rel="stylesheet" href="../Js/skins/aero.css">
<style type="text/css">td{line-height:20px;}</style>
<script src="../Js/jQuery.js"></script>
<script src="../Js/jquery.artDialog.js"></script>
<script src="../Js/artDialog.iframeTools.js"></script>
<script>
$(function(){
	$('a[href^="Del"]').click(function(){if(!confirm("你确定要删除？"))return!1});
	$('.btn').click(function(){
		art.dialog.open('KaoQin/NewKq.asp',{id:'xjkqdj',title:'新建考勤登记',duration:0,lock:true});
	});
});
</script>
</head>
<body>
<div id="sousuo" style="text-align:left;"><input class="btn" type="button" value="新建" /></div>
<table border="0" cellpadding="0" cellspacing="0" class="table">
	<tr><th class="th" colspan="5">&nbsp;<a href="Gl.asp">考勤登记管理</a><%Easp.W " - "&Easp.db.RT("V_U","uname='"&uname&"'","zname")%></th></tr>
<tr style="font-weight:700;background:#E9FAEF;"><td class="td">&nbsp;原因</td><td width="65" align="center" class="td">姓名</td><td width="55" align="center" class="td">类别</td><td width="140" class="td">时间</td><td width="65" align="center" class="td">操作</td></tr>
    <%
	Dim rs,t,i
	Set rs=db.GPR("0:10",Array("V_all:id,nr,kssj,jssj,types,links,editlinks,dellinks,uname","uname='"&uname&"'","sj desc"))
	if Easp.IsN(rs) then
	Easp.W "<tr><td class=""td"" align=""center"" colspan=""5"">暂无信息</td></tr></table>"
	Else
	t=rs.GetRows(rs.PageSize)
	db.C(rs)
	For i=0 to UBound(t,2)
	db.SetPager "default", "总共{recordcount}条记录  每页{pagesize}条 {pageindex}/{pagecount}页 {first}{prev}{liststart}{list}{listend}{next}{last}转到 {jump} 页",Array("listlong:5")
	%>
    <tr><td class="td">&nbsp;<a href="<%=t(5,i)%>"><%Easp.WH Easp.CutStr(t(1,i),"32:...")%></a></td><td width="65" align="center" class="td"><a href="GlU.asp?uname=<%=t(8,i)%>"><%Easp.WH Easp.db.RT("V_U","uname='"&t(8,i)&"'","zname")%></a></td><td width="55" align="center" class="td"><%=t(4,i)%></td><td width="140" class="td">开始：<%=Easp.DateTime(t(2,i),"yyyy-mm-dd hh:ii")%><br />结束：<%=Easp.DateTime(t(3,i),"yyyy-mm-dd hh:ii")%></td><td width="65" align="center" class="td"><a href="<%=t(6,i)%>">修改</a> | <a href="<%=t(7,i)%>">删除</a></td></tr>
    <%Next%>
</table>
<div class="page"><%Easp.W db.GetPager("")%></div><%End if%>
</body>
</html>