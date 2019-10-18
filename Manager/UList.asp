<!--#include file="../Inc/Cse.asp"--><!DOCTYPE html>
<html lang="cn">
<head>
<meta name="author" content="EdieLei">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<meta charset="UTF-8">
<title>Ulist</title>
<link rel="stylesheet" href="../Css/Inc.css">
<link rel="stylesheet" href="../Js/skins/aero.css">
<script src="../Js/jQuery.js"></script>
<script src="../Js/jquery.artDialog.js"></script>
<script src="../Js/artDialog.iframeTools.js"></script>
<script>
$(function(){
	$('.xs').click(function(){
		var zhi=$(this).attr('src'),id=$(this).attr('alt'),t=$(this),zid=$(this).attr('zid');
		$.post('../C/Xs.asp','zhi='+zhi+'&id='+id+'&table=Users',function(a){
			switch(a){
				case 'Error':location.reload();break;
				case '0':
					$.post('../Common/DelWdggXml.asp','id='+zid,function(a){
						if(a!=0){t.attr('src','../Images/no.gif');}
					});
					break;
				case '1':
					$.post('../Hr/hfdl.asp','id='+zid,function(){
						t.attr('src','../Images/yes.gif');
					});
					break;
			}
		});
	});
});

function editqx(num){
	art.dialog.open('Manager/QxEdit.asp?id='+num,{
		id:'editqx',
		title:'分配用户权限',
		top:'38.2%',
		width:220,
		height:110,
		lock:true,
		resize:true,
		duration:0
	});
}

</script>
</head>
<body>
<table border="0" cellpadding="0" cellspacing="0" class="table">
<tr><th class="th" colspan="8">&nbsp;<a href="UList.asp">用户登录管理</a></th></tr>
	<tr style="font-weight:700;background:#E9FAEF;">
		<td width="58" class="td">员工编号</td>
		<td class="td">姓名</td>
		<td class="td">用户名</td>
		<td width="120" align="center" class="td">上次登录时间</td>
		<td width="70" align="center" class="td">上次登录IP</td>
		<td width="56" align="center" class="td">登录次数</td>
      <td width="52" align="center" class="td">可否登录</td>
      <td width="52" align="center" class="td">操作</td>
	</tr>
	<%Dim rs,t,i
	Set rs=Easp.db.GPR("0:15",Array("V_U:uid,uname,ltime,uip,ucs,xs,zid,zname,gh","zid is not null","xs,gh asc"))
	if Easp.IsN(rs) then
	Easp.W "<tr><td class=""td"" colspan=""8"" align=""center"">暂无可用用户，请添加！</td></tr>"
	Else
	t=rs.GetRows(rs.PageSize)
	Easp.db.C(rs)
	Easp.db.SetPager "default", "总共{recordcount}条记录  每页{pagesize}条 {pageindex}/{pagecount}页 {first}{prev}{liststart}{list}{listend}{next}{last}转到 {jump} 页",Array("listlong:5")
	For i=0 to Ubound(t,2)
	%>
    <tr>
   	  <td width="58" class="td"><%=t(8,i)%></td>
   	  <td class="td"><a href="../Hr/See.asp?id=<%=t(6,i)%>"><%Easp.WH t(7,i)%></a></td>
   	  <td class="td"><%Easp.WH t(1,i)%></td>
   	  <td width="120" align="center" class="td"><%Easp.WH Easp.IIF(Easp.IsN(t(2,i)),"未登录",Easp.DateTime(t(2,i),"yyyy-mm-dd hh:ii"))%></td>
   	  <td width="70" align="center" class="td"><%Easp.WH Easp.IIF(Easp.IsN(t(3,i)),"未登录",t(3,i))%></td>
   	  <td width="56" align="center" class="td"><%Easp.WH Easp.IIF(Easp.IsN(t(4,i)),"未登录",t(4,i))%></td>
      <td width="52" align="center" class="td"><img class="xs" zid="<%=t(6,i)%>" src="../Images/<%=Easp.IIF(t(5,i),"yes","no")%>.gif" alt="<%=t(0,i)%>" /></td>
      <td width="52" align="center" class="td"><a href="javascript:editqx(<%=t(0,i)%>);">修改权限</a></td>
   	</tr>
    <%Next%>
</table>
<div class="page"><%Easp.W Easp.db.GetPager("")%></div><%End if%>
</body>
</html>