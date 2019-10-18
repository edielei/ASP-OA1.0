<!--#include file="../Inc/Cse.asp"--><!DOCTYPE html>
<html lang="cn">
<head>
<meta name="author" content="EdieLei">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<meta charset="UTF-8">
<title>UserList</title>
<link rel="stylesheet" href="../Css/Inc.css">
<link rel="stylesheet" href="../Js/skins/aero.css">
<script src="../Js/jQuery.js"></script>
<script src="../Js/jquery.artDialog.js"></script>
<script src="../Js/artDialog.iframeTools.js"></script>
<script>
$(function(){
	$('a[href^="Del"]').click(function(){if(!confirm("你确定要删除？"))return!1});
});
function Shenhe(num,zname){
	$.post('ShenheC.asp','id='+num,function(a){
		switch(a){
			case 'OK':
				art.dialog.open('Manager/QxFp.asp?id='+num,{
					id:'shenheok',
					title:'分配用户权限',
					top:'38.2%',
					width:220,
					height:110,
					lock:true,
					resize:true,
					duration:0
				});
				break;
			case 'Err':
				art.dialog.through({
					id:'shenheerr',
					icon:'face-sad',
					content:'<span style="color:#F00;line-height:20px;font-family:Tahoma;"><strong>'+zname+'</strong> 此用户尚未建立档案，请先为其填写一份档案！<br />才能进行下一步审核！</span>',
					lock:true,
					resize:false,
					duration:0,
					cancel:true,
					ok:function(){
						location='/Manager/AddDangAn.asp?id='+num;
						return false;
					}
				});
			break;
		}
	});
}
</script>
</head>
<body>
<div id="sousuo">用户名：<input id="uname" class="input" style="width:68px;" /> 或 姓名：<input id="zname" class="input" style="width:60px;" /> <input id="tj" type="submit" class="btnss" value="搜索" /></div>
<table border="0" cellpadding="0" cellspacing="0" class="table">
<tr><th class="th" colspan="5">&nbsp;<a href="UserList.asp">待审用户管理</a></th></tr>
<tr style="font-weight:700;background:#E9FAEF;"><td class="td">用户名</td><td width="60" class="td">姓名</td><td class="td">注册邮箱</td><td width="68" align="center" class="td">注册时间</td><td width="68" align="center" class="td">操作</td></tr>
<%Dim rs,t,i
Set rs=Easp.db.GPR("0:15",Array("Users:id,uname,zname,email,zctime","zid is null and utime is null","id desc"))
if Easp.IsN(rs) then
Easp.W "<tr><td colspan=""5"" align=""center"" class=""td"">暂无待审用户！</td></tr>"
Else
t=rs.GetRows(rs.PageSize)
Easp.db.SetPager "default", "总共{recordcount}条记录  每页{pagesize}条 {pageindex}/{pagecount}页 {first}{prev}{liststart}{list}{listend}{next}{last}转到 {jump} 页",Array("listlong:5")
For i=0 to Ubound(t,2)
%>
<tr>
	<td class="td"><%Easp.WH t(1,i)%></td>
	<td width="60" class="td"><%Easp.WH t(2,i)%></td>
	<td class="td"><a href="mailto:<%Easp.WH t(3,i)%>"><%Easp.WH t(3,i)%></a></td>
	<td width="68" align="center" class="td"><%=Easp.DateTime(t(4,i),"yyyy-mm-dd")%></td>
	<td width="68" align="center" class="td"><a href="javascript:Shenhe(<%=t(0,i)%>,'<%Easp.WH t(2,i)%>');">审核</a> | <a href="DelUsers.asp?id=<%=t(0,i)%>">删除</a></td>
</tr><%Next%>
</table>
<div class="page"><%Easp.W Easp.db.GetPager("")%></div><%End if%>
</body>
</html>