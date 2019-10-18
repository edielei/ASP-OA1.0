<!--#include file="../Inc/GzjhCs.asp"--><!DOCTYPE html>
<html lang="cn">
<head>
<meta name="author" content="EdieLei">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<meta charset="UTF-8">
<title>AddTypes</title>
<link rel="stylesheet" href="../Css/Inc.css">
<style type="text/css">
html{overflow:hidden;}body{background:none;}.table{margin:0;}
</style>
<script src="../Js/jQuery.js"></script>
<script src="../Js/vd.js"></script>
<script src="../Js/jquery.artDialog.js"></script>
<script src="../Js/artDialog.iframeTools.js"></script>
<script>
$(function(){
	var s=$('#tj');
	s.click(function(){
		var bt=$('#types').vd('请输入类别名称！',1);if(!bt){return}
		$.post('AddTypesC.asp','types='+bt,function(a){
			switch(a){
				case 'OK':art.dialog.open.api.hide();art.dialog.through({icon:'succeed',content:'添加成功！',resize:false,ok:function(){art.dialog.open.origin.location='/Office/GzjhTypes.asp'},close:function(){art.dialog.open.origin.location='/Office/GzjhTypes.asp'}});break;
				case 'Err':alert('操作失败！');location.reload();break;
			}
		});
	});
});
</script>
</head>
<body>
<table class="table">
	<tr>
		<td align="right" class="td">类别名称：</td><td class="td"><input id="types" class="input" /> <em title="必填项">*</em></td>
	</tr>
    <tr>
    	<td>&nbsp;</td>
    	<td style="padding:2px;"><input id="tj" type="submit" value="确定" class="btn" /> <input type="button" value="取消" class="btn" onclick="art.dialog.close()" /></td>
    </tr>
</table>
</body>
</html>