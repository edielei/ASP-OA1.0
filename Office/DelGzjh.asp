<!--#include file="../Inc/GzjhCs.asp"-->
<%
Dim id,jg
id=Easp.Get("id:n:0")
jg=db.DR("Gzjh","id="&id)
If jg<>0 then
Easp.Ext("ed").Rb
End if
%>