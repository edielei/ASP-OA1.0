<!--#include file="../Inc/BbsCs.asp"--><%
Dim id
id=Easp.Get("id:n")
if Easp.IsN(id) then Easp.RR "TzGl.asp"
%><!DOCTYPE html>
<html lang="cn">
<head>
<meta name="author" content="EdieLei">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<meta charset="UTF-8">
<title>TzTGl</title>
<link rel="stylesheet" href="../Css/Inc.css">
<script src="../Js/jQuery.js"></script>
<script src="../Js/vd.js"></script>
<script>
$(function(){
	$('a[href^="Del"]').click(function(){if(!confirm("你确定要删除？删除后该帖子的所有回复同时也被删除！"))return!1});
	$('#bkid').val('<%=id%>');
	$('#bkid').change(function(){
		var a=$(this).val();
		location='TzTGl.asp?id='+a;
	});
	
	var s=$('#tj');
	s.click(function(){
		var bkid=$('#bkid').val();
		var bt=$('#bt').vd('请输入标题进行搜索！',1);if(!bt){return}
		location='TzGlS.asp?bkid='+bkid+'&bt='+bt;
	});
});
</script>
</head>
<body>
<div id="sousuo">所属版块：<%Easp.Ext("ed").BkTypes()%> 标题：<input id="bt" class="input" style="width:120px;" /> <input type="submit" id="tj" value="搜索" class="btnss" /></div>
<table border="0" cellpadding="0" cellspacing="0" class="table">
	<tr>
		<th class="th" colspan="7">&nbsp;<a href="TzGl.asp">帖子管理</a></th>
	</tr>
    <tr style="font-weight:700;background:#E9FAEF;">
   	  <td class="td">标题</td>
    	<td width="125" nowrap="nowrap" class="td">所属版块</td>
    	<td width="68" align="center" class="td">姓名</td>
    	<td width="68" align="center" class="td">发布时间</td>
    	<td width="55" align="center" class="td">回复次数</td>
   	  <td width="55" align="center" class="td">查看次数</td>
    	<td width="38" align="center" class="td">操作</td>
    </tr>
    <%
	Dim rs,t,i
	Set rs=db.GPR("0:15",Array("MyTz:id,bt,bk,sj,hfcs,cs,bkid,uname","bkid="&id,"id desc"))
	if Easp.IsN(rs) then
	Easp.W "<tr><td class=""td"" align=""center"" colspan=""6"">暂无发表的帖子！</td></tr></table>"
	Else
	t=rs.GetRows(rs.PageSize)
	db.SetPager "default", "总共{recordcount}条记录  每页{pagesize}条 {pageindex}/{pagecount}页 {first}{prev}{liststart}{list}{listend}{next}{last}转到 {jump} 页",Array("listlong:5")
	db.C(rs)
	For i= 0 to UBound(t,2)
	%>
    <tr>
   	  <td nowrap="nowrap" class="td"><%Easp.WH Easp.CutStr(t(1,i),"22:...")%></td>
        <td width="125" nowrap="nowrap" class="td"><a href="TzTGl.asp?id=<%=t(6,i)%>"><%Easp.WH Easp.CutStr(t(2,i),"20:...")%></a></td>
      <td width="68" align="center" class="td"><%Easp.WH Easp.db.RT("V_U","uname='"&t(7,i)&"'","zname")%></td>
        <td width="68" align="center" class="td"><%=Easp.DateTime(t(3,i),"yyyy-mm-dd")%></td>
        <td width="55" align="center" class="td"><%=t(4,i)%></td>
      <td width="55" align="center" class="td"><%=t(5,i)%></td>
        <td width="38" align="center" class="td"><a href="DelTz.asp?id=<%=t(0,i)%>">删除</a></td>
    </tr>
    <%Next%>
</table>
<div class="page"><%Easp.W db.GetPager("")%></div><%End if%>
</body>
</html>