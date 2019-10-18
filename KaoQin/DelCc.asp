<!--#include file="../Inc/KqCs.asp"-->
<%
Dim id,jg
id=Easp.Get("id:n")
jg=db.DR("Cc","id="&id)
If jg<>0 then
Easp.Ext("ed").rb
End if
%>