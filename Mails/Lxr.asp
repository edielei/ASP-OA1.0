<!--#include file="../Inc/Cse.asp"--><%
Dim unames,i
unames=Easp.Get("unames:s")
%><!DOCTYPE html>
<html lang="cn">
<head>
<meta name="author" content="EdieLei">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<meta charset="UTF-8">
<title>Lxr</title>
<style type="text/css">
body{margin:0;color:#48795B;font-size:12px;font-family:'\5B8B\4F53';}
div{line-height:20px;vertical-align:middle;}
div input{vertical-align:middle;}
.bm{background:#E9FAEF;padding:2px 0;border:1px #DDD solid;font-weight:700;}
.un{padding:3px 0;}
</style>
<script src="../Js/jQuery.js"></script>
<script src="../Js/jquery.artDialog.js"></script>
<script src="../Js/artDialog.iframeTools.js"></script>
<script>
$(function(){
	<%
	if Easp.Has(unames) then
	unames=split(unames,",")
	For i=0 to UBound(unames)
	Easp.WC "$('.un input[value="""&Easp.HtmlEncode(unames(i))&"""]').attr('checked','checked');"
	Next
	End if
	%>
	shuju();
	$('input[name="bm"]').change(function(){
		var a=$(this).attr('checked');
		var b=$(this).attr('d');
		$('.un input[bm="'+b+'"]').attr('checked',a);
	});
	$('input').bind('click change',function(){
		shuju();
	});
	function shuju(){
		var unames=$('.un input:checked').map(function(){return $(this).val();}).get().join(',');
		var znames=$('.un input:checked').map(function(){return $(this).attr('zname');}).get().join(',');		
		if(unames==''){art.dialog.removeData('unames');}else{art.dialog.data('unames',unames);}
		if(znames==''){art.dialog.removeData('znames');}else{art.dialog.data('znames',znames);}
	}
});
</script>
</head>
<body>
<%
Dim rs,t,rsa,tt,ii,a
Set rs=Easp.db.GR("Bm:id,bt","","px desc")
if Easp.IsN(rs) then
Easp.W "暂无部门，请先添加！"
Else
t=rs.GetRows()
Easp.db.C(rs)
For i=0 to UBound(t,2)
Easp.W "<div class=""bm""><input id=""bm"&t(0,i)&""" type=""checkbox"" name=""bm"" d="""&t(0,i)&""" /><label for=""bm"&t(0,i)&""">"&Easp.HtmlEncode(t(1,i))&"</label></div><div class=""un"" style=""margin-left:20px;"">"
Set rsa=Easp.db.GR("V_U:uname,zname","bmid="&t(0,i),"")
if Easp.IsN(rsa) then
Easp.W "此部门暂无人员！"
Else
tt=rsa.GetRows()
Easp.db.C(rsa)
For ii=0 to UBound(tt,2)
a=ii+1
%><label for="un<%Easp.WH tt(1,ii)%>"><input type="checkbox" name="un" id="un<%Easp.WH tt(1,ii)%>" bm="<%=t(0,i)%>" value="<%Easp.WH tt(0,ii)%>" zname="<%Easp.WH tt(1,ii)%>" /><%Easp.WH tt(1,ii)%></label><%
if a mod 15 = 0 then
Easp.W "<br />"
Else
Easp.W "　　"
End if
Next
End if
Easp.W "</div>"
Next
End if
%>
</body>
</html>