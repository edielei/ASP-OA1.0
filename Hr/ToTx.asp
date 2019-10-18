<!--#include file="../Inc/Cse.asp"--><%Dim id,r
id=Easp.Get("id:n:0")
r=Easp.db.RT("Uinfo","id="&id,"zname")
%>
<!DOCTYPE html>
<html lang="cn">
<head>
<meta name="author" content="EdieLei">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<meta charset="UTF-8">
<title>Tx</title>
<link rel="stylesheet" href="../Css/Add.css">
<style type="text/css">
html{overflow:hidden;}
body{margin:0;background:none;}
</style>
<link rel="stylesheet" href="../Js/skins/aero.css">
<script src="../Js/jQuery.js"></script>
<script src="../DatePicker/WdatePicker.js"></script>
<script src="../Js/jquery.artDialog.js"></script>
<script src="../Js/artDialog.iframeTools.js"></script>
<script>
$(function(){
	var s=$('#tj');
	s.click(function(){
		var sj=$.trim($('#sj').val());
		if(0==sj.length){alert('请选择时间！');$('#sj').select();return false;}
		$.post('ToTxC.asp',{'id':<%=id%>,'txsj':sj},function(a){
			switch(a){
				case 'OK':alert('修改成功');window.parent["mkj"].location.reload();break;
				case 'Err':alert('操作失败！');location.reload();break;
			}
		})
	});
});
</script>
</head>
<body>
<table border="0" cellpadding="0" cellspacing="0" class="table" style="margin:0;">
	<tr><td align="right" class="td">姓名：</td><td class="td"><%=r%></td></tr>
    <tr><td align="right" class="td">退休时间：</td><td class="td"><input id="sj" class="input" style="width:68px;" onfocus="WdatePicker()" /> <em title="必填项">*</em></td></tr>
    <tr><td align="right">&nbsp;</td><td style="padding:2px;"><input id="tj" type="submit" value="确定" class="btn" /></td></tr>
</table>
</body>
</html>