<!--#include file="../Inc/Cse.asp"--><!DOCTYPE html>
<html lang="cn">
<head>
<meta name="author" content="EdieLei">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<meta charset="UTF-8">
<title>AddKh</title>
<link rel="stylesheet" href="../Css/Add.css">
<style type="text/css">
body{background:none;}
.table{margin:0;}
</style>
<script src="../Js/jQuery.js"></script>
<script src="../Js/vd.js"></script>
<script src="../Js/jquery.artDialog.js"></script>
<script src="../Js/artDialog.iframeTools.js"></script>
<script>
$(function(){
	$('input:first').focus();
	$(':button').click(function(){
		art.dialog.open.api.close();
	});
	var s=$('#tj');
	s.click(function(){
		var uname=$('#uname').vd('请输入姓名！',1);if(!uname){return}
		var mc=$('#mc').vd('请输入公司名称！',1);if(!mc){return}
		var dz=$('#dz').vd('请输入地址！',1);if(!dz){return}
		var shouji=encodeURIComponent($.trim($.trim($('#shouji').val())));
		var zj=encodeURIComponent($.trim($.trim($('#zj').val())));
		var email=encodeURIComponent($.trim($.trim($('#email').val())));
		$.post('AddKhC.asp','uname='+uname+'&mc='+mc+'&dz='+dz+'&shouji='+shouji+'&zj='+zj+'&email='+email,function(a){
			switch(a){
				case 'OK':art.dialog.open.api.hide();art.dialog.through({icon:'succeed',content:'添加客户成功',duration:0,lock:true,resize:false,time:3,
				ok:function(){
					window.parent["mkj"].location.reload();
				},
				close:function(){
					window.parent["mkj"].location.reload();
				}});break;
				case 'Err':alert('操作失败！');location.reload();break;
			}
		});
	});
});
</script>
</head>
<body>
<table border="0" cellpadding="0" cellspacing="0" class="table">
	<tr><td width="80" align="right" class="td">姓名：</td><td class="td"><input id="uname" class="input" /> <em title="必填项">*</em></td></tr>
    <tr><td width="80" align="right" class="td">公司名称：</td><td class="td"><input id="mc" class="input" /> <em title="必填项">*</em></td></tr>
    <tr><td width="80" align="right" class="td">地址：</td><td class="td"><input id="dz" class="input" /> <em title="必填项">*</em></td></tr>
    <tr><td width="80" align="right" class="td">手机：</td><td class="td"><input id="shouji" class="input" /></td></tr>
    <tr><td width="80" align="right" class="td">座机：</td><td class="td"><input id="zj" class="input" /></td></tr>
    <tr><td width="80" align="right" class="td">邮箱：</td><td class="td"><input id="email" class="input" /></td></tr>
    <tr><td width="80" align="right">&nbsp;</td><td style="padding:2px;"><input type="submit" value="确定" id="tj" class="btn" /> <input type="button" value="取消" class="btn" /></td></tr>
</table>
</body>
</html>