<!--#include file="../Inc/Cse.asp"--><!DOCTYPE html>
<html lang="cn">
<head>
<meta name="author" content="EdieLei">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<meta charset="UTF-8">
<title>EditLx</title>
<link rel="stylesheet" href="../Css/Inc.css">
<style type="text/css">html{overflow:hidden;}body{background:none;}.table{margin:0;}.input{height:20px;line-height:20px;width:190px;}</style>
<script src="../Js/jQuery.js"></script>
<script src="../Js/vd.js"></script>
<script src="../Js/jquery.artDialog.js"></script>
<script src="../Js/artDialog.iframeTools.js"></script>
<script>
$(function(){
	var s=$('#tj');
	s.click(function(){
		var shouji=$('#shouji').vd('请输入手机号码！',1);if(!shouji){return}
		var email=$('#email').vd('请输入电子邮箱！',1);if(!email){return}
		var tel=encodeURIComponent($.trim($('#tel').val()));
		var add=encodeURIComponent($.trim($('#add').val()));
		$.post('EditLxC.asp','shouji='+shouji+'&email='+email+'&tel='+tel+'&add='+add,function(a){
			switch(a){
				case 'OK':art.dialog.open.api.hide();
				art.dialog.through({
					content:'修改联系方式成功！',
					icon:'succeed',
					ok:function(){
						art.dialog.open.api.close();
					},
					close:function(){
						art.dialog.open.api.close();
					}
				});break;
				case 'Err':alert('操作失败！');location.reload();break;
			}
		})
	});
});
</script>
</head>
<body><%Dim r:r=Easp.db.RT("V_Lx","uname='"&Easp.Cookie("uinfo>uname:s")&"'","shouji,email,jtdh,add")%>
<table class="table">
<tr><td width="65" align="right" nowrap="nowrap" class="td">手机号码：</td><td class="td"><input id="shouji" class="input" value="<%Easp.WH r(0)%>" autofocus /> <em title="必填项">*</em></td></tr>
<tr><td width="65" align="right" nowrap="nowrap" class="td">电子邮箱：</td><td class="td"><input id="email" class="input" value="<%Easp.WH r(1)%>" /> <em title="必填项">*</em></td></tr>
<tr><td width="65" align="right" nowrap="nowrap" class="td">家庭电话：</td><td class="td"><input id="tel" class="input" value="<%Easp.WH r(2)%>" /></td></tr>
<tr><td width="65" align="right" nowrap="nowrap" class="td">家庭住址：</td><td class="td"><input id="add" class="input" value="<%Easp.WH r(3)%>" /></td></tr>
<tr>
	<td>&nbsp;</td><td style="padding:2px;"><input id="tj" type="submit" class="btn" value="确定" /> <input type="button" value="取消" class="btn" onclick="art.dialog.open.api.close()" /></td>
</tr>
</table>
</body>
</html>