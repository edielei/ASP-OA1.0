<!--#include file="../Inc/BbsCs.asp"--><%Dim id,rs
id=Easp.Get("id:n:0")
rs=db.RT("bk","id="&id,"bt,jy")
%><!DOCTYPE html>
<html lang="cn">
<head>
<meta name="author" content="EdieLei">
<meta charset="UTF-8">
<title>EditForum</title>
<link rel="stylesheet" href="../Css/Inc.css">
<script src="../Js/jQuery.js"></script>
<script src="../Js/vd.js"></script>
<script src="../Js/jquery.artDialog.js"></script>
<script src="../Js/artDialog.iframeTools.js"></script>
<script>
$(function(){
	$('#bt').select();
	var s=$('#tj');
	s.click(function(){
		var bt=$('#bt').vd('请输入版块名称！',1);if(!bt){return}
		var nr=$('#nr').vd('请输入描述内容！',1);if(!nr){return}
		$.post('EditForumC.asp','id=<%=id%>&bt='+bt+'&nr='+nr,function(a){
			switch(a){
				case 'OK':window.parent.frames["mkj"].location.reload();art.dialog.close();break;
				case 'Err':alert('操作失败！');break;
			}
		});
	});
});
function cls(){art.dialog.close();}
</script>
<style type="text/css">
body{
	margin:0;
	background:none;
	font-size:12px;
}
.table td{padding:3px;}
</style>
</head>
<body>
<table border="0" align="center" cellpadding="0" cellspacing="0" class="table" style="margin:0;">
	<tr><td width="38" align="right" class="td">名称：</td><td class="td"><input id="bt" class="input" style="width:230px;" value="<%Easp.WH rs(0)%>" /> <em title="必填项">*</em></td></tr>
    <tr><td width="38" align="right" class="td">描述：</td><td class="td"><textarea id="nr" class="input" style="width:100%;height:100px;"><%Easp.W Easp.Ext("ed").htmlspecialchars(rs(1))%></textarea></td></tr>
    <tr><td width="38" align="right">&nbsp;</td><td><input id="tj" type="submit" value="确定" class="btn" /> <input type="button" value="取消" class="btn" onClick="cls()" /></td></tr>
</table>
</body>
</html>