<!--#include file="../Inc/Cse.asp"--><!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<meta charset="UTF-8">
<title>AddZw</title>
<link rel="stylesheet" href="../Css/Inc.css">
<style type="text/css">body{background:none;}select{width:154px;}</style>
<script src="../Js/jQuery.js"></script>
<script src="../Js/vd.js"></script>
<script>
$(function(){
	var s=$('#tj');
	s.click(function(){
		var bt=$('#bt').vd('请输入职位名称！',1);if(!bt){return}
		var bmid=$('#bm').val();
		$.post('AddZwC.asp','bmid='+bmid+'&bt='+bt,function(a){
			switch(a){
				case 'CF':alert('该职位已存在，无需重复添加！');$('#bt').focus().select();break;
				case 'OK':alert('添加成功！');window.parent.frames["mkj"].location.reload();break;
				case 'Err':alert('操作失败！');location.reload();break;
			}
		})
	});
});
</script>
</head>
<body>
<div style="height:50px;margin:5px 0 0 6px;line-height:25px;">所属部门：<select id="bm"><option value="">请选择</option>
<%Dim rsa,t,i
Set rsa=Easp.db.GR("Bm:id,bt","","px desc")
if Easp.isN(rsa) then
Easp.W ""
Else
t=rsa.GetRows()
Easp.db.C(rsa)
For i=0 to UBound(t,2)
%>
<option value="<%=t(0,i)%>"><%=t(1,i)%></option>
<%Next
End if
%>
</select><br />
职位名称：<input id="bt" class="input" value="" style="width:150px;" /> <input id="tj" type="submit" value="确定" class="btn" /></div>
</body>
</html> 