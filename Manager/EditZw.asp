<!--#include file="../Inc/Cse.asp"--><%Dim id,rs
id=Easp.Get("id:n:0")
rs=Easp.db.RT("Zw","id="&id,"bt,bmid")
%><!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<meta charset="UTF-8">
<title>EditZw</title>
<link rel="stylesheet" href="../Css/Inc.css">
<style type="text/css">body{background:none;}select{width:154px;}</style>
<script src="../Js/jQuery.js"></script>
<script src="../Js/vd.js"></script>
<script>
$(function(){
	$('#bm').val('<%=rs(1)%>');
	$('#bt').focus().select();
	var s=$('#tj');
	s.click(function(){
		var bt=$('#bt').vd('请输入职位名称！',1);if(!bt){return}
		var bmid=$('#bm').val();
		$.post('EditZwC.asp','id=<%=id%>&bmid='+bmid+'&bt='+bt,function(a){
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
职位名称：<input id="bt" class="input" value="<%=rs(0)%>" style="width:150px;" /> <input id="tj" type="submit" value="确定" class="btn" /></div>
</body>
</html> 