<!--#include file="../Inc/MailCs.asp"-->
<%
Dim id,jg
id=Easp.Get("id:n:0")
jg=db.UR("SMail","id="&id,"isdel=True")
if jg<>0 then
Easp.Ext("ed").rb
Else
Easp.Alert "删除失败"
End if
%>