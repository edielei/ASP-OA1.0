<!--#include file="../Inc/Cse.asp"--><!DOCTYPE html>
<html lang="cn">
<head>
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<meta charset="UTF-8">
<title>Zw</title>
<link rel="stylesheet" href="../Css/Inc.css">
<script src="../Js/jQuery.js"></script>
<script src="../Js/jquery.artDialog.js"></script>
<script src="../Js/artDialog.iframeTools.js"></script>
<script>
function Add(){
	art.dialog.open('Manager/AddZw.asp',{id:'addzw',title:'添加职位',height:65,width:280,resize:false})
}
function edit(num){
	art.dialog.open('Manager/EditZw.asp?id='+num,{id:'editzw',title:'修改职位名称',height:65,width:280,resize:false});
}
//上移下移
function UpOne(num){$.get('../C/UpOne.asp?t=Zw&id='+num,function(){location.reload()});}
function DownOne(num){$.get('../C/DownOne.asp?t=Zw&id='+num,function(){location.reload()});}
</script>
</head>
<body>
<div id="sousuo" style="text-align:left;"><input type="button" value="添加" class="btn" onclick="Add()" /></div>
<table border="0" cellpadding="0" cellspacing="0" class="table">
  <tr><th class="th" colspan="4">&nbsp;职位管理</th></tr><tr style="font-weight:700;background:#E9FAEF;">
<td class="td">职位名称</td>
<td class="td">所属部门</td>
<td width="50" align="center" class="td">排序</td>
<td width="68" align="center" class="td">操作</td>
</tr><%Dim rs,t,i
Set rs=Easp.db.GR("V_Zw:id,zw,bm,bmid","","px desc")
if Easp.isN(rs) then
Easp.W "<tr><td colspan=""4"">暂无职位！</td></tr>"
else
t=rs.GetRows()
Easp.db.C(rs)	
For i=0 to UBound(t,2)
%>
<tr><td class="td"><%Easp.WH t(1,i)%></td>
<td class="td"><a href="ZhiWei.asp?id=<%=t(3,i)%>"><%Easp.WH t(2,i)%></a></td>
<td width="50" align="center" class="td"><img src="../Images/arrow_up.png" alt="上移一位" onclick="UpOne(<%=t(0,i)%>)" /><img class="down" src="../Images/arrow_down.png" alt="下移一位" onclick="DownOne(<%=t(0,i)%>)" /></td>
<td width="68" align="center" class="td"><a class="edit" href="javascript:edit('<%=t(0,i)%>');">修改</a> | <a href="DelZw.asp?id=<%=t(0,i)%>">删除</a></td></tr><%
Next
End if
%></table>
</body>
</html>