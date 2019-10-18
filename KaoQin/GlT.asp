<!--#include file="../Inc/KqCs.asp"--><%Dim id
id=Easp.Get("id:s")
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
	$("#xzall").toggle(function(){$('input[name="xz"]').attr("checked","checked")},function(){$('input[name="xz"]').removeAttr("checked")});
	$('#delxz').click(function(){var a=$('input[name="xz"]:checked');if(0!=a.length){var arr=a.map(function(){return $(this).val();}).get().join(',');if(!confirm("你确定要删除所选？"))return false;location.href='DelAll.asp?types=<%=Server.URLEncode(id)%>&id='+arr;}});
	$('.btn').click(function(){
		art.dialog.open('KaoQin/NewKq.asp',{id:'xjkqdj',title:'新建考勤登记',duration:0,lock:true});
	});
});
</script>
</head>
<body>
<div id="sousuo" style="text-align:left;"><input class="btn" type="button" value="新建" /></div>
<table border="0" cellpadding="0" cellspacing="0" class="table">
	<tr><th class="th" colspan="6">&nbsp;<a href="Gl.asp">考勤登记管理</a><%Easp.W " - "&id%></th></tr>
<tr style="font-weight:700;background:#E9FAEF;"><td width="28" align="center" class="td">选择</td><td class="td">原因</td><td width="65" align="center" class="td">姓名</td><td width="55" align="center" class="td">类别</td><td width="140" class="td">时间</td><td width="65" align="center" class="td">操作</td></tr>
    <%
	Dim rs,t,i
	Set rs=db.GPR("0:10",Array("V_all:id,nr,kssj,jssj,types,links,editlinks,dellinks,uname","types='"&id&"'","sj desc"))
	if Easp.IsN(rs) then
	Easp.W "<tr><td class=""td"" align=""center"" colspan=""6"">暂无"&id&"信息！</td></tr></table>"
	Else
	t=rs.GetRows(rs.PageSize)
	db.C(rs)
	For i=0 to UBound(t,2)
	db.SetPager "default", "总共{recordcount}条记录  每页{pagesize}条 {pageindex}/{pagecount}页 {first}{prev}{liststart}{list}{listend}{next}{last}转到 {jump} 页",Array("listlong:5","link:GlT.asp?id="&server.URLEncode(id)&"&page=*")
	%>
<tr><td width="28" align="center" class="td"><input type="checkbox" name="xz" value="<%=t(0,i)%>" /></td><td class="td">&nbsp;<a href="<%=t(5,i)%>"><%Easp.WH Easp.CutStr(t(1,i),"32:...")%></a></td><td width="65" align="center" class="td"><a href="GlU.asp?uname=<%=t(8,i)%>"><%Easp.WH Easp.db.RT("V_U","uname='"&t(8,i)&"'","zname")%></a></td><td width="55" align="center" class="td"><%=t(4,i)%></td><td width="140" class="td">开始：<%=Easp.DateTime(t(2,i),"yyyy-mm-dd hh:ii")%><br />结束：<%=Easp.DateTime(t(3,i),"yyyy-mm-dd hh:ii")%></td><td width="65" align="center" class="td"><a href="<%=t(6,i)%>">修改</a> | <a href="<%=t(7,i)%>">删除</a></td></tr>
    <%Next%>
</table>
<div class="page"><span style="float:left;"><input type="image" class="inputimg" id="xzall" src="../Images/xzall.png" alt="全选/取消全选" />&nbsp;<input type="image" class="inputimg" id="delxz" src="../Images/delxz.png" alt="删除所选" /></span><%Easp.W db.GetPager("")%></div><%End if
%>
</body>
</html>