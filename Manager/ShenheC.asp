<!--#include file="../Inc/Cse.asp"-->
<%
Dim id,a,b
id=Easp.Post("id:n:0")
a=Easp.db.RT("Users","id="&id,"zcgh")	'获取注册的工号
b=Easp.db.RT("Uinfo","gh='"&a&"'","id")	'判断注册者是否在档案中存在
If Easp.Has(b) then
Easp.WE "OK"
Else
Easp.WE "Err"
End if
%>