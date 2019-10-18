<!--#include file="../Inc/BbsCs.asp"--><%Dim id,r,xx,i,list
id=Easp.Get("id:n")
if Easp.IsN(id) then Easp.RR "TpList.asp"
r=db.RT("Tp","id="&id,"bt,xx,lx,unames")
xx=Replace(r(3),","," ")
Set list=Easp.List.New
list.Data=xx
if list.Has(Easp.Cookie("uinfo>uname:s")) then Easp.Alert "你已对此进行过投票，不能重复投票！"
xx=split(r(1),",")
%><!DOCTYPE html>
<html lang="cn">
<head>
<meta name="author" content="EdieLei">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<meta charset="UTF-8">
<title>SeeTp</title>
<link rel="stylesheet" href="../Css/Inc.css">
<script src="../Js/jQuery.js"></script>
<script>
$(function(){
	var s=$('#tj');
	s.click(function(){
		var xxs=$('input[name="xx"]:checked');
		if(0==xxs.length){
			alert('请选择投票项！');
			return false;
		}
		//获取选择的投票项
		var xx=$('input[name="xx"]:checked').map(function(){return encodeURIComponent($(this).val());}).get().join(',');
		$.post('TpC.asp','id=<%=id%>&xx='+xx,function(a){
			switch(a){
				case 'OK':alert('投票成功！');location.replace('<%=Request.ServerVariables("HTTP_REFERER")%>');break;
				case 'Err':alert('操作失败！');location.reload();break;
			}
		});
	});
});
</script>
</head>
<body>
<table border="0" cellpadding="0" class="table">
<tr><th class="th" colspan="2">&nbsp;查看投票 </th></tr>
<tr><td width="58" align="right" class="td">标题：</td><td class="td"><%Easp.WH r(0)%></td></tr><%For i=0 to UBound(xx)%>
<tr>
<td width="58" align="right" class="td">选项 <%=i+1%>：</td>
<td class="td"><%if r(2) then%><input id="xx<%=i%>" type="checkbox" name="xx" value="<%=i%>" /><%Else%><input id="xx<%=i%>" type="radio" name="xx" value="<%=i%>" /><%End if%><label for="xx<%=i%>"><%Easp.WH xx(i)%></label></td>
</tr><%Next%>
<tr>
<td width="58" align="right">&nbsp;</td><td style="padding:2px;"><input id="tj" type="submit" value="投票" class="btn" /> <input type="button" value="取消" class="btn" onclick="history.back()" /></td></tr>
</table>
</body>
</html>