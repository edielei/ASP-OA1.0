<!--#include file="../Inc/Cse.asp"--><%Dim id,bm
id=Easp.Get("id:n")
if Easp.IsN(id) then Easp.RR "Index.asp"
bm=Easp.db.RT("bm","id="&id,"bt")
%><!DOCTYPE html>
<html lang="cn">
<head>
<meta name="author" content="EdieLei">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<meta charset="UTF-8">
<title>ZzBm</title>
<link rel="stylesheet" href="../Css/Inc.css">
<style type="text/css">span img{vertical-align:middle}</style>
<link rel="stylesheet" href="../Js/skins/aero.css">
<script src="../Js/jQuery.js"></script>
<script src="../Js/jquery.artDialog.js"></script>
<script src="../Js/artDialog.iframeTools.js"></script>
<script>
$(function(){
	$('span').dblclick(function(){
		var a=$(this).attr('data');
		art.dialog.open('Hr/EditZt.asp?id='+a,{id:'EditZt',title:'修改状态',height:118});
	});
});
</script>
</head>
<body>
<table border="0" cellpadding="0" cellspacing="0" class="table">
<tr>
<th class="th" colspan="7">&nbsp;<a href="Index.asp">员工一览 - 在职</a>（<%Easp.WH bm%>）</th>
</tr>
	<tr style="font-weight:700;background:#E9FAEF;"><td width="60" class="td">工号</td><td width="68" class="td">姓名</td><td width="35" align="center" class="td">性别</td><td class="td">部门</td><td class="td">职位</td><td width="60" align="center" class="td">状态</td><td width="68" align="center" class="td">操作</td></tr>
    <%Dim rs,t,i
	Set rs=Easp.db.GPR("0:15",Array("uinfo:id,gh,zname,xb,bmid,zwid","lzsj = '0' and txsj = '0' and bmid="&id,"gh asc"))
	if Easp.IsN(rs) then
	Easp.W "<tr><td class=""td"" align=""center"" colspan=""7"">暂无在职人员</td></tr>"
	Else
	t=rs.GetRows(rs.PageSize)
	Easp.db.C(rs)
	For i=0 to Ubound(t,2)
	Easp.db.SetPager "default", "总共{recordcount}条记录  每页{pagesize}条 {pageindex}/{pagecount}页 {first}{prev}{liststart}{list}{listend}{next}{last}转到 {jump} 页",Array("listlong:5")
	%>
    <tr><td width="60" class="td"><%Easp.WH t(1,i)%></td><td width="68" class="td"><%Easp.WH t(2,i)%></td><td width="35" align="center" class="td"><%Easp.WH t(3,i)%></td><td class="td"><%Easp.WH Easp.db.RT("bm","id="&t(4,i),"bt")%></td><td class="td"><%Easp.WH Easp.db.RT("zw","id="&t(5,i),"bt")%></td><td width="60" align="center" class="td"><span data="<%=t(0,i)%>"><img src="../Images/zaizhi.png" alt="" /> 在职</span></td><td width="68" align="center" class="td"><a href="See.asp?id=<%=t(0,i)%>">查看</a> | <a href="Edit.asp?id=<%=t(0,i)%>">修改</a></td></tr>
    <%Next%>
</table>
<div class="page"><%Easp.W Easp.db.GetPager("")%></div><%End if%>
</body>
</html>