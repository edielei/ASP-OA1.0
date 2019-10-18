<!--#include file="../Inc/Cse.asp"--><%Dim bt,sj
bt=Easp.Get("bt:s")
sj=Easp.Get("sj:d")
%><!DOCTYPE html>
<html lang="cn">
<head>
<meta name="author" content="EdieLei">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<meta charset="UTF-8">
<title>Gl</title>
<link rel="stylesheet" href="../Css/Inc.css">
<script src="../Js/jQuery.js"></script>
<script src="../Js/vd.js"></script>
<script src="../DatePicker/WdatePicker.js"></script>
<script>
$(function(){
	<%Easp.Ext("ed").jqxs("Gg")%>
	$('a[href^="Del"]').click(function(){if(!confirm("你确定要删除？"))return!1});
	$("#xzall").toggle(function(){$('input[name="xz"]').attr("checked","checked")},function(){$('input[name="xz"]').removeAttr("checked")});
	$('#delxz').click(function(){var a=$('input[name="xz"]:checked');if(0!=a.length){var arr=a.map(function(){return $(this).val();}).get().join(',');if(!confirm("你确定要删除所选？"))return false;$.get('DelAll.asp?id='+arr,function(){location.reload()});}});
	var s=$('#tj');
	s.click(function(){
		var bt=$.trim($('#bt').val());
		var sj=$.trim($('#sj').val());
		if(bt.length+sj.length==0){
			return false;
		}
		$('#sousuo form').submit();
	});
});
</script>
</head>
<body>
<div id="sousuo"><form action="GlS.asp" method="get">标题：<input id="bt" name="bt" style="width:150px;" value="<%=Replace(bt,"''","'")%>" /> 或 时间：<input id="sj" name="sj" class="srk" style="width:70px;" value="<%=Replace(sj,"''","'")%>" onfocus="WdatePicker()" />&nbsp;<input id="tj" type="submit" value="搜索" class="btnss" /></form></div>
<table border="0" cellpadding="0" cellspacing="0" class="table">
	<tr>
		<th colspan="5" class="th"><img src="../Images/AM_gg.gif" alt="" /><a href="Gl.asp">管理公司公告</a></th>
	</tr>
    <tr style="font-weight:700;background:#E9FAEF;">
    <td width="30" align="center" class="td">选择</td>
    	<td class="td">标题</td>
        <td width="55" align="center" class="td">是否显示</td>
    	<td width="75" align="center" class="td">发布时间</td>
    	<td width="65" align="center" class="td">操作</td>
    </tr><%Dim rs,t,i,jc,ys
if Easp.isN(sj) then
Set rs=Easp.db.GPR("0:15",Array("Gg:id,bt,jc,ys,sj,xs","bt like '%"&bt&"%'","px desc"))
elseif Easp.isN(bt) then
Set rs=Easp.db.GPR("0:15",Array("Gg:id,bt,jc,ys,sj,xs","format(sj,'yyyy-mm-dd')='"&sj&"'","px desc"))
Else
Set rs=Easp.db.GPR("0:15",Array("Gg:id,bt,jc,ys,sj,xs","bt like '%"&bt&"%' and format(sj,'yyyy-mm-dd')='"&sj&"'","px desc"))
End if
if Easp.isN(rs) then
Easp.W "<tr><td class=""td"" colspan=""5"" align=""center"">找不到和您查询相符的相关内容或信息！</td></tr></table>"
else
t=rs.GetRows(rs.pagesize)
Easp.db.C(rs)
Easp.db.SetPager "default", "总共{recordcount}条记录  每页{pagesize}条 {pageindex}/{pagecount}页 {first}{prev}{liststart}{list}{listend}{next}{last}转到 {jump} 页",Array("listlong:5","link:GlS.asp?bt="&Server.URLEncode(bt)&"&sj="&sj&"&page=*")
Easp.XML.Open("../Common/wdgg/"&Easp.Cookie("uinfo>uid")&".xml")
for i=0 to UBound(t,2)
jc=Easp.IIF(t(2,i),"font-weight:700;","")
ys=Easp.IIF(Easp.Has(t(3,i)),"color:#"&t(3,i)&";","")
%><tr>
<td width="30" align="center" class="td"><input type="checkbox" name="xz" value="<%=t(0,i)%>" /></td>
    <td class="td"><a href="Show.asp?id=<%=t(0,i)%>" style="<%=jc%><%=ys%>"><%Easp.WH t(1,i)%></a><%Easp.W Easp.IIF(Easp.Has(Easp.XML("u>gg[id="&t(0,i)&"]")),"&nbsp;&nbsp;<strong style=""color:#F00"">[未读]</strong>","")%></td>
    <td width="55" align="center" class="td"><%Call Easp.Ext("ed").IsShow(t(5,i),t(0,i))
'修改字段
%></td>
    <td width="75" align="center" class="td"><%=Easp.DateTime(t(4,i),"yyyy-mm-dd")%></td>
    <td width="65" align="center" class="td"><a href="Edit.asp?id=<%=t(0,i)%>">修改</a> | <a href="Del.asp?id=<%=t(0,i)%>">删除</a></td>
  </tr><%Next%>
</table>
<div class="page"><span style="float:left;"><input type="image" class="inputimg" id="xzall" src="../Images/xzall.png" alt="全选/取消全选" />&nbsp;<input type="image" class="inputimg" id="delxz" src="../Images/delxz.png" alt="删除所选" /></span><%Easp.W Easp.db.GetPager("")%></div><%End If%>
</body>
</html>