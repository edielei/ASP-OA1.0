<!--#include file="../Inc/Cse.asp"--><%
Dim sj
sj=Easp.Get("sj:d:"&Easp.DateTime(Date(),"yyyy-mm-dd"))
%><!DOCTYPE html>
<html lang="cn">
<head>
<meta name="author" content="EdieLei">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<meta charset="UTF-8">
<title>Gl</title>
<link rel="stylesheet" href="../Css/Inc.css">
<script src="../Js/jQuery.js"></script>
<script src="../DatePicker/WdatePicker.js"></script>
<script src="../Js/vd.js"></script>
<script>
$(function(){
	$('a[href^="Del"]').click(function(){if(!confirm("你确定要删除？"))return!1});
	$("#xzall").toggle(function(){$('input[name="xz"]').attr("checked","checked")},function(){$('input[name="xz"]').removeAttr("checked")});
	$('#delxz').click(function(){var a=$('input[name="xz"]:checked');if(0!=a.length){var arr=a.map(function(){return $(this).val();}).get().join(',');if(!confirm("你确定要删除所选？"))return false;$.get('DelAll.asp?id='+arr,function(){location.reload()});}});
	var s=$('#tj');
	s.click(function(){
		var sj=$.trim($('#sj').val());
		if(sj.length==0){
			alert('请输入时间进行搜索！');
			$('#sj').select();
			return false;
		}
		location.href='GlS.asp?sj='+encodeURIComponent(sj);
	});
});
</script>
</head>
<body>
<div id="sousuo">时间：<input id="sj" name="sj" class="srk" style="width:70px;" onfocus="WdatePicker()" value="<%=sj%>" />&nbsp;<input id="tj" type="submit" value="搜索" class="btnss" /></div>
<table border="0" cellpadding="0" cellspacing="0" class="table">
<tr>
	<th class="th" colspan="5">&nbsp;<a href="Gl.asp">意见管理</a></th>
</tr>
	<tr style="font-weight:700;background:#E9FAEF;">
		<td class="td" width="30">选择</td>
		<td class="td">标题</td>
		<td width="65" align="center" class="td">发表人</td>
		<td width="110" align="center" class="td">发表时间</td>
		<td width="65" align="center" class="td">操作</td>
	</tr><%
	Dim rs,t,i,dx
	dx=Easp.db.RT("Users","uname='"&Easp.Cookie("uinfo>uname")&"'","yjlx")
	Set rs=Easp.db.GPR("0:15",Array("Yj:id,bt,uname,sj","format(sj,'yyyy-mm-dd')='"&sj&"' and dx="&dx,"id desc"))
	if Easp.IsN(rs) then
	Easp.W "<tr><td colspan=""5"" align=""center"" class=""td"">找不到和您查询相符的相关内容或信息！</td></tr>"
	Else
	t=rs.GetRows(rs.PageSize)
	Easp.db.C(rs)
	Easp.db.SetPager "default", "总共{recordcount}条记录  每页{pagesize}条 {pageindex}/{pagecount}页 {first}{prev}{liststart}{list}{listend}{next}{last}转到 {jump} 页",Array("listlong:5")
	For i=0 to Ubound(t,2)
	%>
    <tr>
    	<td width="30" align="center" class="td"><input type="checkbox" name="xz" value="<%=t(0,i)%>" /></td>
        <td class="td"><%Easp.WH t(1,i)%></td>
        <td width="65" align="center" class="td"><%Easp.WH Easp.db.RT("V_U","uname='"&t(2,i)&"'","zname")%></td>
      <td width="110" align="center" class="td"><%=Easp.DateTime(t(3,i),"yyyy-mm-dd hh:ii")%></td>
        <td width="65" align="center" class="td"><a href="View.asp?id=<%=t(0,i)%>">查看</a> | <a href="Del.asp?id=<%=t(0,i)%>">删除</a></td>
    </tr>
    <%Next%>
</table>
<div class="page"><span style="float:left;"><input type="image" class="inputimg" id="xzall" src="../Images/xzall.png" alt="全选/取消全选" />&nbsp;<input type="image" class="inputimg" id="delxz" src="../Images/delxz.png" alt="删除所选" /></span><%Easp.W Easp.db.GetPager("")%></div><%End if
%>
</body>
</html>