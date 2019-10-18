<!--#include file="../Inc/Cse.asp"--><!DOCTYPE html>
<html lang="cn">
<head>
<meta name="author" content="EdieLei">
<meta charset="UTF-8">
<title>Kq</title>
<link rel="stylesheet" href="../Js/skins/aero.css">
<style type="text/css">
body{color:#48795B;margin:0;font-size:12px;}
table{border-collapse:collapse;}
td{font-size:12px;border:1px #DDD solid;padding:3px;}
#kssj,#jssj{width:105px;}
#nr{width:320px;height:120px;}
.input{
	border:1px #B7C7Be solid;
}
.btn {
	width:40px;
	height:20px;
	font-size:12px;
	font-family:'宋体';
	background:#84dba8;
	border:1px #55b47a;
	color:#345a40;
	padding:2px 0;
}
</style>
<script src="../Js/jQuery.js"></script>
<script src="../Js/vd.js"></script>
<script src="../Js/jquery.artDialog.js"></script>
<script src="../Js/artDialog.iframeTools.js"></script>
<script src="../DatePicker/WdatePicker.js"></script>
<script>
$(function(){
	$(':button').click(function(){
		art.dialog.open.api.close();
	});
	var s=$(':submit'),kssj=$('#kssj'),jssj=$('#jssj');
	s.click(function(){
		if(0==kssj.val().length){alert('请输入开始时间！');kssj.select();return false;}
		if(0==jssj.val().length){alert('请输入结束时间！');jssj.select();	return false;}
		var nr=$('#nr').vd('请输入内容！',1);if(!nr){return}
		$.post('WcdjC.asp','kssj='+encodeURIComponent(kssj.val())+'&jssj='+encodeURIComponent(jssj.val())+'&nr='+nr,function(a){
			switch(a){
				case 'OK':art.dialog.open.api.hide();
				art.dialog.through({
					title:'消息',
					content:'提交成功！',
					icon:'succeed',
					duration:0,
					time:3,
					close:function(){
						window.parent['mkj'].location='/KaoQin/SeeWc.asp';
						art.dialog.close();
					}
				});
				break;
				case 'Err':alert('操作失败！');location.reload();break;
			}
		});
	});
});
</script>
</head>
<body>
<table>
	<tr>
		<td nowrap="nowrap">开始时间：</td><td><input id="kssj" class="input" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm',maxDate:'#F{$dp.$D(\'jssj\',{m:-1})}'})" />&nbsp;&nbsp;&nbsp;&nbsp;结束时间：<input id="jssj" class="input" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm',minDate:'#F{$dp.$D(\'kssj\',{m:+1})}'})" /></td>
	</tr>
	<tr><td nowrap="nowrap">外出原因：</td><td><textarea id="nr" class="input"></textarea></td></tr>
    <tr><td>&nbsp;</td><td><input type="submit" value="确定" class="btn" /> <input type="button" value="取消" class="btn" /></td></tr>
</table>
</body>
</html>