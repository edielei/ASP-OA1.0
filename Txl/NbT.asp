<!--#include file="../Inc/Cse.asp"--><%
Dim bm
bm=Easp.Get("bm:s")
if Easp.IsN(bm) then Easp.RR "Nb.asp"
%><!DOCTYPE html>
<html lang="cn">
<head>
<meta name="author" content="EdieLei">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<meta charset="UTF-8">
<title>Nb</title>
<link rel="stylesheet" href="../Css/Inc.css">
<script src="../Js/jQuery.js"></script>
<script src="../Js/vd.js"></script>
<script>
$(function(){
	$('#bm').val("<%=bm%>");
	$('#bm').change(function(){
		var a=$(this).val();
		location.href="NbT.asp?bm="+encodeURIComponent(a);
	});
	var s=$('#tj');
	s.click(function(){
		var bm=$('#bm').vd('请选择部门！',1);if(!bm){return}
		var zname=$('#zname').vd('请输入姓名进行搜索！',1);if(!zname){return}
		location.href='NbSx.asp?bm='+bm+'&zname='+zname;
	});
});
</script>
</head>
<body>
<div id="sousuo">部门分类：<%Easp.Ext("ed").BmXz()%>　姓名：<input id="zname" class="input" style="width:68px;" maxlength="12" />&nbsp;<input id="tj" type="submit" value="搜索" class="btnss" /></div>
<table border="0" cellpadding="0" cellspacing="0" class="table">
<tr><th class="th" colspan="6">&nbsp;<a href="Nb.asp">内部通讯录</a></th></tr>
<tr style="font-weight:700;background:#E9FAEF;"><td class="td">姓名</td><td class="td">部门</td><td class="td">直线</td><td class="td">分机</td><td class="td">手机</td><td class="td">邮箱</td></tr>
<%
Dim rs,t,i
Set rs=Easp.db.GPR("0:15",Array("V_Txl:zname,bt,zx,fj,shouji,email","bt='"&bm&"'","utime asc"))
if Easp.IsN(rs) then
Easp.W "<tr><td class=""td"" colspan=""6"" align=""center"">暂无记录！</td></tr>"
Else
t=rs.GetRows(rs.PageSize)
Easp.db.C(rs)
Easp.db.SetPager "default", "总共{recordcount}条记录  每页{pagesize}条 {pageindex}/{pagecount}页 {first}{prev}{liststart}{list}{listend}{next}{last}转到 {jump} 页",Array("listlong:5","link:NbT.asp?page=*&bm="&Server.URLEncode(bm))
For i=0 to UBound(t,2)
%>
<tr>
	<td class="td"><%Easp.WH t(0,i)%></td>
	<td class="td"><%Easp.WH t(1,i)%></td>
	<td class="td"><%Easp.WH t(2,i)%></td>
	<td class="td"><%Easp.WH t(3,i)%>&nbsp;</td>
	<td class="td"><%Easp.WH t(4,i)%>&nbsp;</td>
	<td class="td"><a href="mailto:<%Easp.WH t(5,i)%>"><%Easp.WH t(5,i)%></a>&nbsp;</td>
</tr>
<%Next%>
</table>
<div class="page"><%Easp.W Easp.db.GetPager("")%></div>
<%
End if
%>
</body>
</html>