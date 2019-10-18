<!--#include file="../Inc/MailCs.asp"--><!DOCTYPE html>
<html lang="cn">
<head>
<meta name="author" content="EdieLei">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<meta charset="UTF-8">
<title>SMail</title>
<link rel="stylesheet" href="../Css/Inc.css">
<script src="../Js/jQuery.js"></script>
<script src="../DatePicker/WdatePicker.js"></script>
<script>
$(function(){
	$('a[href^="Del"]').click(function(){if(!confirm("你确定要删除？"))return!1});
	$("#xzall").toggle(function(){$('input[name="xz"]').attr("checked","checked")},function(){$('input[name="xz"]').removeAttr("checked")});
	$('#delxz').click(function(){var a=$('input[name="xz"]:checked');if(0!=a.length){var arr=a.map(function(){return $(this).val();}).get().join(',');if(!confirm("你确定要删除所选？"))return false;$.get('DelSMailAll.asp?id='+arr,function(){location.reload()});}});
	var s=$('#tj');
	s.click(function(){
		var bt=encodeURIComponent($.trim($('#bt').val()));;
		var sj=encodeURIComponent($.trim($('#sj').val()));;
		if(bt.length+sj.length==0){
			alert('请输入标题或时间进行搜索！');
			$('#bt').focus();
			return false;
		}
		location='SMailS.asp?bt='+bt+'&sj='+sj;
	});
});
</script>
</head>
<body>
<div id="sousuo">标题：<input id="bt" class="input" style="width:120px;" /> 或 时间：<input id="sj" name="sj" class="input" style="width:70px;" onfocus="WdatePicker()" /> <input id="tj" type="submit" value="搜索" class="btnss" /></div>
<table border="0" cellpadding="0" cellspacing="0" class="table">
<tr><th class="th" colspan="6">&nbsp;<a href="SMail.asp">收件箱</a></th></tr>
<tr style="font-weight:700;background:#E9FAEF;"><td width="28" align="center" class="td">选择</td><td width="22" align="center" class="td"><img src="../Images/mail.png" alt="" /></td><td class="td">标题</td><td width="62" align="center" class="td">发件人</td><td width="70" align="center" class="td">时间</td><td width="68" align="center" class="td">操作</td></tr>
<%Dim rs,t,i
Set rs=db.GPR("0:15",Array("SMail:id,bt,fjr,isread,sj","isdel = false and sjr='"&Easp.Cookie("uinfo>uname:s")&"'","id desc"))
if Easp.IsN(rs) then
Easp.W "<tr><td class=""td"" align=""center"" colspan=""6"">暂无邮件</td></tr></table>"
Else
t=rs.GetRows(rs.PageSize)
db.C(rs)
db.SetPager "default", "总共{recordcount}条记录  每页{pagesize}条 {pageindex}/{pagecount}页 {first}{prev}{liststart}{list}{listend}{next}{last}转到 {jump} 页",Array("listlong:5")
For i=0 to UBound(t,2)
%>
<tr>
	<td width="28" align="center" class="td"><input type="checkbox" name="xz" value="<%=t(0,i)%>" /></td>
	<td width="22" align="center" class="td"><img src="../Images/<%Easp.W Easp.IIF(t(3,i),"","n")%>mail.png" alt="<%Easp.W Easp.IIF(t(3,i),"已读","未读")%>" /></td>
	<td class="td" <%Easp.W Easp.IIF(t(3,i),"","style=""font-weight:700""")%>><a href="See.asp?id=<%=t(0,i)%>"><%Easp.WH t(1,i)%></a></td>
	<td width="62" align="center" class="td"><%Easp.WH Easp.db.RT("V_U","uname='"&t(2,i)&"'","zname")%></td>
	<td width="70" align="center" class="td"><%=Easp.DateTime(t(4,i),"yyyy-mm-dd")%></td>
	<td width="68" align="center" class="td"><a href="See.asp?id=<%=t(0,i)%>">查看</a> | <a href="DelSMail.asp?id=<%=t(0,i)%>">删除</a></td>
</tr>
<%Next%>
</table>
<div class="page"><span style="float:left;"><input type="image" class="inputimg" id="xzall" src="../Images/xzall.png" alt="全选/取消全选" />&nbsp;<input type="image" class="inputimg" id="delxz" src="../Images/delxz.png" alt="删除所选" /></span><%Easp.W db.GetPager("")%></div><%End if%>
</body>
</html>