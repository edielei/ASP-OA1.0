<!--#include file="../Inc/Cse.asp"--><%
Dim id,r
id=Easp.Get("id:n:0")
r=Easp.db.RT("Uinfo","id="&id,"zname")
%><!DOCTYPE html>
<html lang="cn">
<head>
<meta name="author" content="EdieLei">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<meta charset="UTF-8">
<title>EditLzZt</title>
<link rel="stylesheet" href="../Css/Add.css">
<style type="text/css">
body{background:none;}
table{border-collapse:collapse;}
td{font-size:12px;padding:3px;border:1px #DDD solid}
</style>
<script src="../Js/jQuery.js"></script>
<script src="../DatePicker/WdatePicker.js"></script>
<script>
$(function(){
	$('#zt').change(function(){
		var a=$(this).val();
		$('td:eq(4)').html(a+'时间：');
	});
	var s=$('#tj');
	s.click(function(){
		var zt=encodeURIComponent($.trim($('#zt').val()));
		if(0==zt.length){alert('请选择要更改的状态！');$('#zt').focus();return false;}
		var sj=encodeURIComponent($.trim($('#sj').val()));
		if(0==sj.length){alert('请输入时间！');$('#sj').select();return false;}
		$.post('EditLzZtC.asp','id=<%=id%>&zt='+zt+'&sj='+sj,function(a){
			alert(a);
			switch(a){
				case 'OK':alert('修改成功！');window.parent["mkj"].location.reload();break;
				case 'Err':alert('操作失败！');location.reload();break;
			}
		})
	});
});
</script>
</head>
<body>
<table width="100%" border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td width="65" align="right">姓名：</td><td><input id="zname" readonly="readonly" value="<%=r%>" class="input" style="width:68px;" /></td>
	</tr>
    <tr>
    	<td width="65" align="right">状态：</td><td><select id="zt" class="input"><option value="">请选择</option><option value="在职">在职</option><option value="退休">退休</option></select> <em title="必填项">*</em></td>
    </tr>
    <tr>
    	<td width="65" align="right">时间：</td><td><input id="sj" class="input" style="width:80px;" onfocus="WdatePicker()" /> <em title="必填项">*</em></td>
    </tr>
    <tr>
      <td width="65" align="right">&nbsp;</td>
      <td><input id="tj" type="submit" value="确定" class="btn" /></td>
    </tr>
</table>
</body>
</html>