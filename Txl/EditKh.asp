<!--#include file="../Inc/TxlCse.asp"--><%
Dim id,r
id=Easp.Get("id:n:0")
r=db.RT("Kh","id="&id,"zname,mc,dz,shouji,zj,email")
If Easp.IsN(r) Then Easp.RR "BscGl.asp"
%><!DOCTYPE html>
<html lang="cn">
<head>
<meta name="author" content="EdieLei">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<meta charset="UTF-8">
<title>EditKh</title>
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
		$.post('EditKhC.asp','id=<%=id%>&uname='+uname+'&mc='+mc+'&dz='+dz+'&shouji='+shouji+'&zj='+zj+'&email='+email,function(a){
			switch(a){
				case 'OK':art.dialog.open.api.hide();art.dialog.through({icon:'succeed',content:'修改成功',duration:0,lock:true,resize:false,time:3,closeFn:function(){
					window.parent["mkj"].location.href='/Txl/KhGl.asp';
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
	<tr><td width="80" align="right" class="td">姓名：</td><td class="td"><input class="input" id="uname" value="<%Easp.WH r(0)%>" /> <em title="必填项">*</em></td></tr>
    <tr><td width="80" align="right" class="td">公司名称：</td><td class="td"><input class="input" id="mc" value="<%Easp.WH r(1)%>" /> <em title="必填项">*</em></td></tr>
    <tr><td width="80" align="right" class="td">地址：</td><td class="td"><input class="input" id="dz" value="<%Easp.WH r(2)%>" /> <em title="必填项">*</em></td></tr>
    <tr><td width="80" align="right" class="td">手机：</td><td class="td"><input class="input" id="shouji" value="<%Easp.WH r(3)%>" /></td></tr>
    <tr><td width="80" align="right" class="td">座机：</td><td class="td"><input class="input" id="zj" value="<%Easp.WH r(4)%>" /></td></tr>
    <tr><td width="80" align="right" class="td">邮箱：</td><td class="td"><input class="input" id="email" value="<%Easp.WH r(5)%>" /></td></tr>
    <tr><td width="80" align="right">&nbsp;</td><td style="padding:2px;"><input type="submit" value="确定" id="tj" class="btn" /> <input type="button" value="取消" class="btn" /></td></tr>
</table>
</body>
</html>