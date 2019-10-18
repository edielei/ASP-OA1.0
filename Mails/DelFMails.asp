<!--#include file="../Inc/MailCs.asp"-->
<%
Dim id,jg
id=Easp.Get("id:n:0")
jg=db.DR("FMail","id="&id)
if jg<>0 then
Easp.Ext("ed").Rb
Else
Easp.Alert "删除失败！"
End if
%>