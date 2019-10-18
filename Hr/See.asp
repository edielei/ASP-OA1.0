<!--#include file="../Inc/Cse.asp"--><%Dim id,r
id=Easp.Get("id:n:0")
r=Easp.db.RT("uinfo","id="&id,"gh,zname,rzsj,zwid,zname,ozname,xb,csrq,mz,jg,zzmm,rtsj,hf,xl,xw,xz,sfzhm,fj,jk,grzp,add,jtdh,shouji,xxjl,gzjy,hjqk,zycy,jjlxr,lxdh")
if Easp.IsN(r) then Easp.RR "Index.asp"
%><!DOCTYPE html>
<html lang="cn">
<head>
<meta name="author" content="EdieLei">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<meta charset="UTF-8">
<title>See</title>
<link rel="stylesheet" href="../Css/Inc.css">
<link rel="stylesheet" href="../Css/powerFloat.css">
<style type="text/css">html{overflow-x:hidden;}</style>
<script src="../Js/jQuery.js"></script>
<script src="../Js/jquery-powerFloat-min.js"></script>
<script>
$(function(){
	$("#grzp").powerFloat({
	    target: "<%Easp.W Easp.IIF(Easp.isN(r(19)),"../Images/nogrzp.jpg","../"&r(19))%>",
    	targetMode: "ajax"
	});
});
</script>
</head>
<body>
<table border="0" cellpadding="0" cellspacing="0" class="table">
	<tr><th class="th" colspan="6">&nbsp;查看员工档案</th></tr>
    <tr>
    	<td width="65" align="right" nowrap="nowrap" class="td">工号:</td><td class="td"><%Easp.WH r(0)%></td>
<td align="right" nowrap="nowrap" class="td">入职时间:</td><td class="td"><%=Easp.DateTime(r(2),"yyyy年mm月dd日")%></td>
<td align="right" nowrap="nowrap" class="td">职位:</td><td class="td"><%Easp.WH Easp.db.RT("Zw","id="&r(3),"bt")%></td>
  </tr> 
   <tr>
   	<td width="65" align="right" nowrap="nowrap" class="td">姓名:</td>
   	<td class="td"><%Easp.WH r(4)%></td>
   	<td align="right" nowrap="nowrap" class="td">曾用名:</td>
   	<td class="td"><%Easp.wH r(5)%>&nbsp;</td>
   	<td align="right" nowrap="nowrap" class="td">性别:</td>
   	<td class="td"><%Easp.WH r(6)%></td>
  </tr>
   <tr>
     <td width="65" align="right" nowrap="nowrap" class="td">出生日期:</td>
     <td class="td"><%Easp.W Easp.DateTime(r(7),"yyyy年mm月dd日")%>&nbsp;</td>
     <td align="right" nowrap="nowrap" class="td">民族:</td>
     <td class="td"><%Easp.WH r(8)%></td>
     <td align="right" nowrap="nowrap" class="td">籍贯:</td>
     <td class="td"><%Easp.WH r(9)%>&nbsp;</td>
  </tr>
   <tr>
   	<td width="65" align="right" nowrap="nowrap" class="td">政治面貌:</td><td class="td"><%Easp.WH r(10)%>&nbsp;</td>
   	<td align="right" nowrap="nowrap" class="td">入党/团时间:</td>
   	<td class="td"><%Easp.W Easp.DateTime(r(11),"yyyy年mm月dd日")%>&nbsp;</td>
   	<td align="right" nowrap="nowrap" class="td">婚否:</td><td class="td"><%Easp.WH r(12)%>&nbsp;</td>
  </tr>
   <tr>
   	<td width="65" align="right" nowrap="nowrap" class="td">学历:</td><td class="td"><%Easp.WH r(13)%>&nbsp;</td>
   	<td align="right" nowrap="nowrap" class="td">学位:</td><td class="td"><%Easp.WH r(14)%>&nbsp;</td>
   	<td align="right" nowrap="nowrap" class="td">学制:</td><td class="td"><%Easp.WH r(15)%>&nbsp;</td>
  </tr>
   <tr>
     <td width="65" align="right" nowrap="nowrap" class="td">身份证号码:</td>
     <td class="td"><%Easp.WH r(16)%>&nbsp;</td><td align="right" class="td">分机:</td><td class="td"><%Easp.WH r(17)%>&nbsp;</td>
     <td align="right" nowrap="nowrap" class="td">健康情况:</td>
     <td class="td"><%Easp.WH r(18)%>&nbsp;</td>
  </tr>
   <tr>
     <td align="right" nowrap="nowrap" class="td">个人照片:</td>
     <td colspan="5" class="td"><a id="grzp" href="<%Easp.W Easp.IIF(Easp.isN(r(19)),"../Images/nogrzp.jpg","../"&r(19))%>" target="_blank">查看个人照片</a></td>
   </tr>
   <tr>
     <td width="65" align="right" nowrap="nowrap" class="td">家庭住址:</td>
     <td colspan="5" class="td"><%Easp.WH r(20)%>&nbsp;</td>
  </tr>
   <tr>
     <td width="65" align="right" nowrap="nowrap" class="td">家庭电话:</td>
     <td colspan="3" class="td"><%Easp.WH r(21)%>&nbsp;</td>
     <td align="right" nowrap="nowrap" class="td">手机:</td>
     <td class="td"><%Easp.WH r(22)%>&nbsp;</td>
  </tr>
   <tr>
     <td width="65" align="right" nowrap="nowrap" class="td">学习经历:</td>
     <td colspan="5" class="td"><%Easp.WH r(23)%>&nbsp;</td>
  </tr>
   <tr>
     <td width="65" align="right" nowrap="nowrap" class="td">工作经验:</td>
     <td colspan="5" class="td"><%Easp.WH r(24)%>&nbsp;</td>
  </tr>
   <tr>
     <td width="65" align="right" nowrap="nowrap" class="td">获奖情况:</td>
     <td colspan="5" class="td"><%Easp.WH r(25)%>&nbsp;</td>
  </tr>
   <tr>
     <td width="65" align="right" nowrap="nowrap" class="td">家庭&nbsp;&nbsp;&nbsp;&nbsp;<br />主要成员:</td>
     <td colspan="5" class="td"><%Easp.WH r(26)%>&nbsp;</td>
  </tr>
   <tr>
     <td width="65" align="right" nowrap="nowrap" class="td"> 紧急联系人:</td>
     <td colspan="3" class="td"><%Easp.WH r(27)%>&nbsp;</td>
     <td align="right" nowrap="nowrap" class="td">&nbsp;联系电话:</td>
     <td class="td"><%Easp.WH r(28)%>&nbsp;</td>
  </tr>
   <tr>
     <td height="30" align="right" valign="top">&nbsp;</td>
     <td height="30" colspan="5" style="padding:2px"><input type="button" value="返回" class="btn" onclick="history.back()" /></td>
   </tr>   
</table>
</body>
</html>