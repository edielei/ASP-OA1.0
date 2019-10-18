<!--#include file="../Inc/WzCs.asp"-->
<%
Dim id,jg
id=Easp.Get("id:n:0")
jg=db.DR("Wz","uname='"&Easp.Cookie("uinfo>uname:s")&"' and id="&id)
if jg<>0 then
Easp.Ext("ed").Rb
Else
Easp.Alert "操作失败！"
End if
%>