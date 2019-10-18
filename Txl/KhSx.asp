<!--#include file="../Inc/TxlCse.asp"--><%
Dim mc,zname
mc=Easp.Get("mc:s")
zname=Easp.Get("zname:s")
if Easp.IsN(mc) or Easp.IsN(zname) then Easp.RR "Kh.asp"
%><!DOCTYPE html>
<html lang="cn">
<head>
<meta name="author" content="EdieLei">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<meta charset="UTF-8">
<title>Kh</title>
<link rel="stylesheet" href="../Css/Inc.css">
<script src="../Js/jQuery.js"></script>
<script src="../Js/vd.js"></script>
<script>
$(function(){
	$('#mc').val('<%=mc%>');
	$('#mc').change(function(){
		var a=encodeURIComponent($.trim($(this).val()));
		location.href='khT.asp?mc='+a;
	});
	var s=$('#tj');
	s.click(function(){
		var mc=$('#mc').vd('请选择公司名称！',1);if(!mc){return}
		var zname=$('#zname').vd('请输入姓名进行搜索！',1);if(!zname){return}
		location.href='KhSx.asp?mc='+mc+'&zname='+zname;
	});
});
</script>
</head>
<body>
<div id="sousuo">公司名称：<select id="mc"><option value="">请选择</option><%Dim ars,at,ai
Set ars=db.GR("V_KhGs:mc","","")
if Easp.IsN(ars) then
Easp.W ""
Else
at=ars.GetRows()
db.C(ars)
For ai=0 to Ubound(at,2)
Easp.W "<option value="""&at(0,ai)&""">"&at(0,ai)&"</option>"
Next
End if%></select>　姓名：<input id="zname" class="input" style="width:68px;" maxlength="12" value="<%=Replace(zname,"''","'")%>" />&nbsp;<input id="tj" type="submit" value="搜索" class="btnss" /></div>
<table border="0" cellpadding="0" cellspacing="0" class="table">
<tr><th class="th" colspan="6">&nbsp;<a href="Kh.asp">客户通讯录</a></th></tr>
<tr  style="font-weight:700;background:#E9FAEF;"><td class="td">姓名</td><td class="td">公司名称</td><td class="td">地址</td><td class="td">手机</td><td class="td">座机</td><td class="td">邮箱</td></tr>
<%Dim rs,t,i
Set rs=db.GPR("0:15",Array("Kh:id,zname,mc,dz,shouji,zj,email","mc='"&mc&"' and zname like '%"&zname&"%'","id desc"))
if Easp.IsN(rs) then
Easp.W "<tr><td class=""td"" align=""center"" colspan=""6"">暂时找不到你要查找的记录！</td></tr></table>"
Else
t=rs.GetRows(rs.PageSize)
db.C(rs)
db.SetPager "default", "总共{recordcount}条记录  每页{pagesize}条 {pageindex}/{pagecount}页 {first}{prev}{liststart}{list}{listend}{next}{last}转到 {jump} 页",Array("listlong:5","link:KhSx.asp?page=*&mc="&Server.URLEncode(mc)&"&zname="&Server.URLEncode(zname))
For i=0 to UBound(t,2)
%>
<tr>
	<td class="td"><%Easp.WH t(1,i)%></td>
	<td class="td"><a href="KhT.asp?mc=<%=Server.URLEncode(t(2,i))%>"><%Easp.WH t(2,i)%></a></td>
	<td class="td"><%Easp.WH t(3,i)%></td>
	<td class="td"><%Easp.WH t(4,i)%></td>
	<td class="td"><%Easp.WH t(5,i)%></td>
	<td class="td"><a href="mailto:<%Easp.WH t(6,i)%>" target="_blank"><%Easp.WH t(6,i)%></a></td>
</tr><%Next%>
</table>
<div class="page"><%Easp.W db.GetPager("")%></div><%End if%>
</body>
</html>