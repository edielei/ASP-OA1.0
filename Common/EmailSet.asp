<!--#include file="../Inc/Cse.asp"--><!DOCTYPE html>
<html lang="cn">
<head>
<meta name="author" content="EdieLei">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<meta charset="UTF-8">
<title>EmailSet</title>
<link rel="stylesheet" href="../Css/Add.css">
<style type="text/css">
html{overflow:hidden;}
body{margin:0;background:none;}
td{line-height:25px;}
.table{margin:0;}
#fwq,#uname,#pwd{width:150px;}
</style>
<script src="../Js/jQuery.js"></script>
<script src="../Js/vd.js"></script>
<script src="../Js/jquery.artDialog.js"></script>
<script src="../Js/artDialog.iframeTools.js"></script>
<script>
$(function(){
	$('#fwq').select();
	$('input:last').click(function(){
		art.dialog.open.api.close();
	});
	var s=$('#tj');
	s.click(function(){
		var fwq=$('#fwq').vd('请输入(smtp)服务器地址！',1);if(!fwq){return}
		var uname=$('#uname').vd('请输入用户名！',1);if(!uname){return}
		var pwd=$('#pwd').vd('请输入密码！',1);if(!pwd){return}
		$.post('EmailSetC.asp','fwq='+fwq+'&uname='+uname+'&pwd='+pwd,function(){
			art.dialog.open.api.hide();
			art.dialog.through({id:'ok',icon:'succeed',content:'邮件设置修改成功！',resize:false,duration:0,time:3,ok:function(){
				art.dialog.open.api.close();
			},
			close:function(){art.dialog.open.api.close();}
			});
		});
	});
});
</script>
</head>
<body>
<table border="0" cellpadding="0" cellspacing="0" class="table"><%Dim xml
xml=Easp.XML.Open("EmailSet.xml")
%>
<tr><td align="right">(SMTP)服务器：</td><td><input id="fwq" class="input" value="<%Easp.WH Easp.XML("host").Value%>" /> <em title="必填项">*</em></td></tr>
<tr><td align="right">登录用户名：</td><td><input id="uname" class="input" value="<%Easp.WH Easp.XMl("user").Value%>" /> <em title="必填项">*</em></td></tr>
<tr><td align="right">登录密码：</td><td><input type="password" class="input" id="pwd" value="<%Easp.WH Easp.XML("pwd").Value%>" /> <em title="必填项">*</em></td></tr>
<tr><td align="right">&nbsp;</td><td><input id="tj" type="submit" class="btn" value="确定" /> <input type="button" class="btn" value="取消" /></td></tr>
</table>
<%
Easp.XML.Close()
%>
</body>
</html>