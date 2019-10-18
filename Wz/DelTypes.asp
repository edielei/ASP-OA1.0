<!--#include file="../Inc/WzCs.asp"-->
<%
Dim id,jg
id=Easp.Get("id:n:0")
jg=db.RT("Wz","typesid="&id,"id")
if Easp.Has(jg) then
Easp.Alert "该类别下存在内容，请先删除该类别下的内容。"
Else
jg=db.DR("Types","id="&id)
if jg<>0 then
Easp.Ext("ed").Rb
Else
Easp.Alert "删除失败"
End if
End if
%>