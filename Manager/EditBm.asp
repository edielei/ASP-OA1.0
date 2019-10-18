<!--#include file="../Inc/Cse.asp"--><%Dim id,rs
id=Easp.Get("id:n:0")
rs=Easp.db.RT("Bm","id="&id,"bt,zx")
%><!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<meta charset="UTF-8">
<title>EditBm</title>
<link rel="stylesheet" href="../Css/Inc.css">
<style type="text/css">html{overflow:hidden;}body{background:none;}.table{margin:0;}</style>
<script src="../Js/jQuery.js"></script>
<script src="../Js/vd.js"></script>
<script>
$(function(){
	$('#bt').focus().select();
	var s=$('#tj');
	s.click(function(){
		var bt=$('#bt').vd('请输入部门名称！',1);if(!bt){return}
		var zx=$('#zx').vd('请输入直线电话！',1);if(!zx){return}
		$.post('EditBmC.asp','id=<%=id%>&bt='+bt+'&zx='+zx,function(a){
			switch(a){
				case 'OK':alert('修改成功！');window.parent.frames["mkj"].location.reload();break;
				case 'Err':alert('操作失败！');location.reload();break;
			}
		})
	});
});
</script>
</head>
<body>
<div style="text-align:center;padding:10px 0;">部门名称：<input id="bt" class="input" value="<%=rs(0)%>" /><br />直线电话：<input id="zx" class="input" value="<%Easp.WH rs(1)%>" /><br /><input id="tj" type="submit" value="确定" class="btn" style="margin:2px 0 0 -46px;" /></div>
</body>
</html> 