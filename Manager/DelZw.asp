<!--#include file="../Inc/Cse.asp"-->
<%
Dim id,jg
id=Easp.Get("id:n:0")
jg=Easp.db.Rt("Uinfo","zwid="&id,"id")
if Easp.Has(jg) then
Easp.Alert "该职位下存在员工信息，不可删除！"
Else
jg=Easp.db.DR("Zw","id="&id)
if jg<>0 then
Easp.AlertUrl "删除成功！", "Zw.asp"
else
Easp.Alert "删除失败！"
End if
End if
%>