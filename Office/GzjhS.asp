<!--#include file="../Inc/GzjhCs.asp"--><%
Dim id,bt
id=Easp.Get("typesid:n")
bt=Easp.Get("bt:s")
if Easp.IsN(id) and Easp.IsN(bt) then Easp.RR "Index.asp"
%><!DOCTYPE html>
<html lang="cn">
<head>
<meta name="author" content="EdieLei">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<meta charset="UTF-8">
<title>GzjhS</title>
<link rel="stylesheet" href="../Css/Inc.css">
<script src="../Js/jQuery.js"></script>
<script src="../Js/vd.js"></script>
<script src="../Js/jquery.artDialog.js"></script>
<script src="../Js/artDialog.iframeTools.js"></script>
<script>
$(function(){
	$('#typesid').val('<%=id%>');
	$('a[href^="Del"]').click(function(){if(!confirm("你确定要删除？"))return!1});
	$("#xzall").toggle(function(){$('input[name="xz"]').attr("checked","checked")},function(){$('input[name="xz"]').removeAttr("checked")});
	$('#delxz').click(function(){var a=$('input[name="xz"]:checked');if(0!=a.length){var arr=a.map(function(){return $(this).val();}).get().join(',');if(!confirm("你确定要删除所选？"))return false;$.get('DelGzjhAll.asp?id='+arr,function(){location.reload()});}});
	$('#typesid').change(function(){
		var a=$(this).val();
		location='GzjhT.asp?id='+a;
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
		location='/Office/GzjhS.asp?typesid='+typesid+'&bt='+bt;
	});
});
function add(){
	art.dialog.open('Office/AddGzjh.asp',{id:'addgzjh',title:'新建工作计划',lock:true,duration:0,resize:false});
}
function edit(num){
	art.dialog.open('Office/EditGzjh.asp?id='+num,{id:'editgzjh',title:'修改工作计划',lock:true,duration:0,resize:false});
}
</script>
</head>
<body>
<div id="sousuo"><span style="float:left;"><input class="btnss" type="button" value="新建" onClick="add()" /></span>类别：<%Easp.Ext("ed").JhTypes()%>　标题：<input id="bt" class="input" style="width:120px;" value="<%=Replace(bt,"''","'")%>" /> <input id="tj" type="submit" value="搜索" class="btnss" /></div>
<table border="0" cellpadding="0" cellspacing="0" class="table">
    <tr>
        <th class="th" colspan="6">&nbsp;<a href="Index.asp">工作计划</a></th>
    </tr>
    <tr style="font-weight:700;background:#E9FAEF;">
    	<td width="28" align="center" class="td">选择</td>
    	<td class="td">标题</td>
    	<td class="td">类别</td>
    	<td width="105" class="td">开始时间</td>
    	<td width="105" class="td">结束时间</td>
    	<td width="68" align="center" class="td">操作</td>
    </tr><%
	Dim rs,t,i
	if Easp.IsN(id) then
	Set rs=db.GPR("0:15",Array("V_Gzjh:id,bt,kssj,jssj,types,typesid","uname='"&Easp.Cookie("uinfo>uname:s")&"' and bt like '%"&bt&"%'","id desc"))
	Else
	Set rs=db.GPR("0:15",Array("V_Gzjh:id,bt,kssj,jssj,types,typesid","uname='"&Easp.Cookie("uinfo>uname:s")&"' and bt like '%"&bt&"%' and typesid="&id,"id desc"))
	End if
	if Easp.IsN(rs) then
	Easp.W "<tr><td class=""td"" align=""center"" colspan=""6"">找不到你要查找的记录！</td></tr></table>"
	Else
	t=rs.GetRows(rs.PageSize)
	db.C(rs)
	db.SetPager "default", "总共{recordcount}条记录  每页{pagesize}条 {pageindex}/{pagecount}页 {first}{prev}{liststart}{list}{listend}{next}{last}转到 {jump} 页",Array("listlong:5","link:GzjhS.asp?page=*&typesid="&id&"&bt="&Server.URLEncode(bt))
	For i=0 to UBound(t,2)
	%>
    <tr>
   	  <td width="28" align="center" class="td"><input type="checkbox" name="xz" value="<%=t(0,i)%>" /></td>
    	<td class="td"><a href="ShowGzjh.asp?id=<%=t(0,i)%>"><%Easp.WH t(1,i)%></a></td>
    	<td class="td"><%Easp.WH t(4,i)%></td>
    	<td width="105" class="td"><%Easp.W Easp.DateTime(t(2,i),"yyyy-mm-dd hh:ii")%></td>
   	  <td width="105" class="td"><%Easp.W Easp.DateTime(t(3,i),"yyyy-mm-dd hh:ii")%></td>
    	<td width="68" align="center" class="td"><a href="javascript:edit(<%=t(0,i)%>);">修改</a> | <a href="DelGzjh.asp?id=<%=t(0,i)%>">删除</a></td>
    </tr><%Next%>
</table>
<div class="page"><span style="float:left;"><input type="image" class="inputimg" id="xzall" src="../Images/xzall.png" alt="全选/取消全选" />&nbsp;<input type="image" class="inputimg" id="delxz" src="../Images/delxz.png" alt="删除所选" /></span><%Easp.W db.GetPager("")%></div><%End If%>
</body>
</html>