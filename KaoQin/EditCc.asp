<!--#include file="../Inc/KqCs.asp"--><%Dim id,r
id=Easp.Get("id:n:0")
r=db.RT("Cc","id="&id,"uname,kssj,jssj,nr")
%><!DOCTYPE html>
<html lang="cn">
<head>
<meta name="author" content="EdieLei">
<meta charset="UTF-8">
<title>Kq</title>
<link rel="stylesheet" href="../Css/Add.css">
<style type="text/css">#kssj,#jssj{width:105px;}</style>
<script src="../Js/jQuery.js"></script>
<script src="../Js/vd.js"></script>
<script src="../DatePicker/WdatePicker.js"></script>
<script>
$(function(){
	var s=$(':submit'),kssj=$('#kssj'),jssj=$('#jssj');
	s.click(function(){
		if(0==kssj.val().length){alert('请输入开始时间！');kssj.select();return false;}
		if(0==jssj.val().length){alert('请输入结束时间！');jssj.select();	return false;}
		var nr=$('#nr').vd('请输入内容！',1);if(!nr){return}
		$.post('EditCcC.asp','id=<%=id%>&kssj='+encodeURIComponent(kssj.val())+'&jssj='+encodeURIComponent(jssj.val())+'&nr='+nr,function(a){
			switch(a){
				case 'OK':alert('修改成功！');location.replace('<%=Request.ServerVariables("HTTP_REFERER")%>');break;
				case 'Err':alert('操作失败！');location.reload();break;
			}
		});
	});
});
</script>
</head>
<body>
<table border="0" cellpadding="0" cellspacing="0" class="table">
<tr>
	<th class="th" colspan="2">&nbsp;修改出差登记</th>
</tr>
	<tr>
	  <td align="right" nowrap="nowrap" class="td">姓名：</td>
	  <td class="td"><input class="input" value="<%Easp.WH Easp.db.RT("V_U","uname='"&r(0)&"'","zname")%>" readonly="readonly" style="width:68px;" /></td>
  </tr>
	<tr>
		<td width="68" align="right" nowrap="nowrap" class="td">开始时间：</td><td class="td"><input id="kssj" class="input" onfocus="WdatePicker({dateFmt:'%y-MM-dd HH:mm',maxDate:'#F{$dp.$D(\'jssj\',{m:-1})}'})" value="<%=Easp.DateTime(r(1),"yyyy-mm-dd hh:ii")%>" /></td>
	</tr>
    <tr>
   	  <td width="68" align="right" class="td">结束时间：</td><td class="td"><input id="jssj" class="input" onfocus="WdatePicker({dateFmt:'%y-MM-dd HH:mm',minDate:'#F{$dp.$D(\'kssj\',{m:+1})}'})" value="<%=Easp.DateTime(r(2),"yyyy-mm-dd hh:ii")%>" /></td>
  </tr>
	<tr><td width="68" align="right" nowrap="nowrap" class="td">出差原因：</td><td class="td"><textarea id="nr" class="input" style="width:100%;height:130px;"><%=r(3)%></textarea></td></tr>
    <tr><td width="68" align="right">&nbsp;</td><td style="padding:0 2px"><input type="submit" value="确定" class="btn" /> <input type="button" value="取消" class="btn" onclick="history.back()" /></td></tr>
</table>
</body>
</html>