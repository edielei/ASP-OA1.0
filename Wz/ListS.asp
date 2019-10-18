<!--#include file="../Inc/WzCs.asp"--><%
Dim id,bt
id=Easp.Get("typesid:n")
bt=Easp.Get("bt:s")
if Easp.IsN(id) and Easp.IsN(bt) then Easp.RR "List.asp"
%><!DOCTYPE html>
<html lang="cn">
<head>
<meta name="author" content="EdieLei">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<meta charset="UTF-8">
<title>ListS</title>
<link rel="stylesheet" href="../Css/Inc.css">
<script src="../Js/jQuery.js"></script>
<script src="../Js/vd.js"></script>
<script src="../Js/jquery.artDialog.js"></script>
<script src="../Js/artDialog.iframeTools.js"></script>
<script>
$(function(){
	$('#typesid').val('<%=id%>');
	$("#xzall").toggle(function(){$('input[name="xz"]').attr("checked","checked")},function(){$('input[name="xz"]').removeAttr("checked")});
	$('#delxz').click(function(){var a=$('input[name="xz"]:checked');if(0!=a.length){var arr=a.map(function(){return $(this).val();}).get().join(',');if(!confirm("你确定要删除所选？"))return false;$.get('DelAll.asp?id='+arr,function(){location.reload()});}});
	$('a[href^="Del"]').click(function(){if(!confirm("你确定要删除？"))return!1});
	$('#typesid').change(function(){
		var a=$(this).val();
		location='ListT.asp?id='+a
	});
	var s=$('#tj');
	s.click(function(){
		var typesid=$('#typesid').val();
		var bt=encodeURIComponent($.trim($.trim($('#bt').val())));;
		if(typesid.length+bt.length==0){
			alert('请选择类别或输入标题进行搜索!');
			$('#typesid').focus();
			return false;
		}
		location='/Wz/ListS.asp?typesid='+typesid+'&bt='+bt;
	});
});
function newwz(){
	art.dialog.open('Wz/AddNew.asp',{id:'newwz',title:'新建网址',resize:false,lock:true,duration:0});
}
function edit(num){
	art.dialog.open('Wz/EditWz.asp?id='+num,{id:'edit',title:'修改网址',reisze:false,lock:true,duration:0});
}
</script>
</head>
<body>
<div id="sousuo"><span style="float:left;"><input type="button" value="新建" class="btnss" onclick="newwz()" /> <input type="button" value="类别管理" class="btnss" style="width:60px;" onclick="location='Types.asp'" /></span>类别：<%Easp.Ext("Ed").WzTypes()%>　标题：<input class="input" id="bt" style="width:120px;" value="<%=Replace(bt,"''","'")%>" /> <input id="tj" type="submit" value="搜索" class="btnss" /></div>
<table border="0" cellpadding="0" cellspacing="0" class="table">
<tr><th class="th" colspan="5">&nbsp;<a href="list.asp">网址列表</a></th></tr>
<tr style="font-weight:700;background:#E9FAEF;"><td width="30" class="td">选择</td><td class="td">标题</td><td class="td">类别</td><td class="td">网址</td><td width="68" align="center" class="td">操作</td></tr>
<%
Dim rs,t,i
if Easp.IsN(id) then
Set rs=db.GPR("0:15",Array("V_Wz:id,bt,ms,types,typesid,wz","uname='"&Easp.Cookie("uinfo>uname:s")&"' and bt like '%"&bt&"%'","px desc"))
Else
Set rs=db.GPR("0:15",Array("V_Wz:id,bt,ms,types,typesid,wz","uname='"&Easp.Cookie("uinfo>uname:s")&"' and bt like '%"&bt&"%' and typesid="&id,"px desc"))
End if
if Easp.IsN(rs) then
Easp.W "<tr><td class=""td"" colspan=""5"" align=""center"">找不到你要查找的记录！</td></tr>"
Else
t=rs.GetRows(rs.PageSize)
db.C(rs)
db.SetPager "default", "总共{recordcount}条记录  每页{pagesize}条 {pageindex}/{pagecount}页 {first}{prev}{liststart}{list}{listend}{next}{last}转到 {jump} 页",Array("listlong:5","link:ListS.asp?page=*&typesid="&id&"&bt="&Server.URLEncode(bt))
For i=0 to Ubound(t,2)
%>
<tr>
	<td width="30" class="td"><input name="xz" type="checkbox" value="<%=t(0,i)%>" /></td>
    <td title="<%Easp.WH t(2,i)%>" class="td"><a href="<%Easp.WH t(5,i)%>" target="_blank"><%Easp.WH t(1,i)%></a></td>
    <td class="td"><a href="ListT.asp?id=<%=t(4,i)%>"><%Easp.WH t(3,i)%></a></td>
    <td class="td"><a href="<%Easp.WH t(5,i)%>" target="_blank"><%Easp.WH t(5,i)%></a></td>
    <td width="68" align="center" class="td"><a href="javascript:edit(<%=t(0,i)%>)">修改</a> | <a href="Del.asp?id=<%=t(0,i)%>">删除</a></td>
</tr>
<%Next%>
</table>
<div class="page"><span style="float:left;"><input type="image" class="inputimg" id="xzall" src="../Images/xzall.png" alt="全选/取消全选" />&nbsp;<input type="image" class="inputimg" id="delxz" src="../Images/delxz.png" alt="删除所选" /></span><%Easp.W db.GetPager("")%></div><%End if
%>
</body>
</html>