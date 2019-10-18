<!--#include file="../Inc/MailCs.asp"--><%Dim bt
bt=Easp.Get("bt:s")
if Easp.IsN(bt) then Easp.RR "CMail.asp"
%><!DOCTYPE html>
<html lang="cn">
<head>
<meta name="author" content="EdieLei">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<meta charset="UTF-8">
<title>CMail</title>
<link rel="stylesheet" href="../Css/Inc.css">
<script src="../Js/jQuery.js"></script>
<script src="../Js/vd.js"></script>
<script>
$(function(){
	$('a[href^="Del"]').click(function(){if(!confirm("删除后将彻底删除不存放在垃圾箱，你确定要删除？"))return!1});
	$("#xzall").toggle(function(){$('input[name="xz"]').attr("checked","checked")},function(){$('input[name="xz"]').removeAttr("checked")});
	$('#delxz').click(function(){var a=$('input[name="xz"]:checked');if(0!=a.length){var arr=a.map(function(){return $(this).val();}).get().join(',');if(!confirm("删除后将彻底删除不存放在垃圾箱，你确定要删除所选？"))return false;location.href='DelCMAll.asp?id='+arr;}});
	var s=$('#tj');
	s.click(function(){
		var bt=$('#bt').vd('请输入标题！',1);if(!bt){return}
		location='CMailS.asp?bt='+bt;
	});
});
</script>
</head>
<body>
<div id="sousuo"><span style="float:left;"><input type="button" value="新建" class="btn" onclick="location.href='NewCMail.asp'" /></span>标题：<input id="bt" class="input" style="width:120px;" value="<%=Replace(bt,"''","'")%>" /> <input id="tj" type="submit" value="搜索" class="btnss" /></div>
<table border="0" cellpadding="0" cellspacing="0" class="table">
	<tr>
		<th class="th" colspan="5">&nbsp;<a href="CMail.asp">草稿箱</a></th>
	</tr>
    <tr style="font-weight:700;background:#E9FAEF;">
    	<td width="30" align="center" class="td">选择</td>
    	<td width="20" align="center" class="td"><img src="../Images/mail.png" alt="" /></td>
    	<td width="120" class="td">收件人</td>
   	  <td class="td">主题</td>
    	<td width="68" align="center" class="td">操作</td>
    </tr>
    <%Dim rs,t,i
	Set rs=db.GPR("0:15",Array("CMail:id,unames,bt","fjr='"&Easp.Cookie("uinfo>uname:s")&"' and bt like '%"&bt&"%'","id desc"))
	if Easp.IsN(rs) then
	Easp.W "<tr><td class=""td"" align=""center"" colspan=""5"">找不到你要查找的邮件。</td></tr></table>"
	Else
	t=rs.GetRows(rs.PageSize)
	db.C(rs)
	db.SetPager "default", "总共{recordcount}条记录  每页{pagesize}条 {pageindex}/{pagecount}页 {first}{prev}{liststart}{list}{listend}{next}{last}转到 {jump} 页",Array("listlong:5","link:CMailS.asp?page=*&bt="&Server.URLEncode(Replace(bt,"''","'")))
	For i=0 to Ubound(t,2)
	%><tr>
    	<td width="30" align="center" class="td"><input type="checkbox" name="xz" value="<%=t(0,i)%>" /></td>
    	<td width="20" align="center" class="td"><img src="../Images/mail.png" alt="" /></td>
    	<td width="120" class="td"><%Easp.WH Easp.CutStr(t(1,i),"20:...")%></td>
    <td class="td"><a href="EditCM.asp?id=<%=t(0,i)%>"><%Easp.WH Easp.IIF(Easp.Has(t(2,i)),Easp.CutStr(t(2,i),"72:..."),"[空主题]")%></a></td>
    	<td width="68" align="center" class="td"><a href="EditCM.asp?id=<%=t(0,i)%>">修改</a> | <a href="DelCM.asp?id=<%=t(0,i)%>">删除</a></td>
    </tr><%Next%>
</table>
<div class="page"><span style="float:left;"><input type="image" class="inputimg" id="xzall" src="../Images/xzall.png" alt="全选/取消全选" />&nbsp;<input type="image" class="inputimg" id="delxz" src="../Images/delxz.png" alt="删除所选" /></span><%Easp.W db.GetPager("")%></div><%End if
%>
</body>
</html>