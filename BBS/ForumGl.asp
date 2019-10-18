<!--#include file="../Inc/BbsCs.asp"--><!DOCTYPE html>
<html lang="cn">
<head>
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<meta charset="UTF-8">
<title>ForumGl</title>
<link rel="stylesheet" href="../Css/Inc.css">
<script src="../Js/jQuery.js"></script>
<script src="../Js/jquery.artDialog.js"></script>
<script src="../Js/artDialog.iframeTools.js"></script>
<script>
$(function(){
	$('a[href^="Del"]').click(function(){if(!confirm("你确定要删除？"))return!1});
	<%Easp.Ext("ed").bbsxs("bk")%>
});
//上移下移
function UpOne(num){location.href='../C/BBSUpOne.asp?t=bk&id='+num;}
function DownOne(num){location.href='../C/BBSDownOne.asp?t=bk&id='+num;}
function Add(){
	art.dialog.open('BBS/AddForum.asp',{id:'addbk',title:'添加版块',top:'50%',width:320,height:170,resize:false,duration:0,lock:true});
}
function edit(num){
	art.dialog.open('BBS/EditForum.asp?id='+num,{id:'editbk',title:'修改版块',top:'50%',width:320,height:170,resize:false,duration:0,lock:true})
}
</script>
</head>
<body>
<div id="sousuo" style="text-align:left;"><input type="button" value="添加" class="btn" onclick="Add()" /></div>
<table border="0" align="center" cellpadding="0" cellspacing="0" class="table">
	<tr>
		<th class="th" colspan="5">&nbsp;<a href="ForumGl.asp">讨论区版块管理</a></th>
	</tr>
    <tr style="background:#e9faef;font-weight:700;">
    	<td class="td">版块名称</td>
    	<td width="60" align="center" class="td">帖子总数</td>
    	<td width="55" align="center" class="td">是否显示</td>
    	<td width="50" align="center" class="td">排序</td>
    	<td width="68" align="center" class="td">操作</td>
    </tr>
    <%Dim rs,t,i,q
	Set rs=db.GR("bk:id,bt,zs,xs","","px desc")
	if Easp.IsN(rs) then
	Easp.W "<tr><td class=""td"" colspan=""5"" align=""center"">暂无版块信息！</td></tr></table>"
	Else
	t=rs.GetRows()
	db.C(rs)
	For i=0 to UBound(t,2)
	%>
    <tr>
    	<td class="td"><%Easp.WH t(1,i)%></td>
    	<td width="60" align="center" class="td"><%Set q=db.Exec("select count(0) from thread where bkid="&t(0,i))
	Easp.W q(0)
	db.C(q)
	%></td>
    	<td width="55" align="center" class="td"><%Call Easp.Ext("ed").IsShow(t(3,i),t(0,i))%></td>
    	<td width="50" align="center" class="td"><img src="../Images/arrow_up.png" alt="上移一位" onclick="UpOne(<%=t(0,i)%>)" /><img class="down" src="../Images/arrow_down.png" alt="下移一位" onclick="DownOne(<%=t(0,i)%>)" /></td>
    	<td width="68" align="center" class="td"><a href="javascript:edit(<%=t(0,i)%>);">修改</a> | <a href="DelForum.asp?id=<%=t(0,i)%>">删除</a></td>
    </tr><%Next%>
</table>
<%End if%>
</body>
</html>