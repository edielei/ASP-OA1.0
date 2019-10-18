<!--#include file="../Inc/Cse.asp"--><%Dim bt,sj
bt=Easp.Get("bt:s")
sj=Easp.Get("sj:d")
%><!DOCTYPE html>
<html lang="cn">
<head>
<meta name="author" content="EdieLei">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<meta charset="UTF-8">
<title>Search</title>
<link rel="stylesheet" href="../Css/Inc.css">
<script src="../Js/jQuery.js"></script>
<script src="../Js/vd.js"></script>
<script src="../DatePicker/WdatePicker.js"></script>
<script>
$(function(){
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
<div id="sousuo"><form action="Search.asp" method="get">标题：<input id="bt" name="bt" style="width:150px;" value="<%=Replace(bt,"''","'")%>" /> 或 时间：<input id="sj" name="sj" class="srk" style="width:70px;" value="<%=Replace(sj,"''","'")%>" onfocus="WdatePicker()" />&nbsp;<input id="tj" type="submit" value="搜索" class="btnss" /></form></div>
<table border="0" cellpadding="0" cellspacing="0" class="table">
  <tr><th class="th" colspan="2"><img src="../Images/AM_fg.gif" alt="" /><a href="List.asp">政策法规</a></th></tr>
  <%Dim rs,t,i
  if Easp.isN(sj) then
  Set rs=Easp.db.GPR("0:15",Array("Fg:id,bt,sj","xs=True and bt like '%"&bt&"%'","px desc"))
  elseif Easp.isN(bt) then
  Set rs=Easp.db.GPR("0:15",Array("Fg:id,bt,sj","xs=True and format(sj,'yyyy-mm-dd')='"&sj&"'","px desc"))
  Else
  Set rs=Easp.db.GPR("0:15",Array("Fg:id,bt,sj","xs=True and bt like '%"&bt&"%' and format(sj,'yyyy-mm-dd')='"&sj&"'","px desc"))
  End if
if Easp.isN(rs) then
Easp.W "<tr><td class=""td"" colspan=""2"" align=""center"">找不到和您查询相符的相关内容或信息！</td></tr></table>"
else
t=rs.GetRows(rs.pagesize)
Easp.db.C(rs)
Easp.db.SetPager "default", "总共{recordcount}条记录  每页{pagesize}条 {pageindex}/{pagecount}页 {first}{prev}{liststart}{list}{listend}{next}{last}转到 {jump} 页",Array("listlong:5","link:Search.asp?bt="&Server.URLEncode(bt)&"&sj="&sj&"&page=*")
for i=0 to UBound(t,2)
%>
  <tr>
    <td class="td"><img src="../Images/btyj.gif" alt="" />&nbsp;&nbsp;<a href="Show.asp?id=<%=t(0,i)%>"><%Easp.WH t(1,i)%></a></td>
    <td width="70" align="center" class="td"><%=Easp.DateTime(t(2,i),"yyyy-mm-dd")%></td>
  </tr>
  <%Next%>
</table>
<div class="page"><%Easp.W Easp.db.GetPager("")%></div><%End If%>
</body>
</html>