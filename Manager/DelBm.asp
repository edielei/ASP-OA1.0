<!--#include file="../Inc/Cse.asp"-->
<%
Dim id,jg
id=Easp.Get("id:n:0")
jg=Easp.db.Rt("zw","bmid="&id,"id")
if Easp.Has(jg) then
Easp.Alert "该部门下存在职位信息，请先删除该部门下的职位信息！"
Else
jg=Easp.db.DR("Bm","id="&id)
if jg<>0 then
Easp.AlertUrl "删除成功！", "Bumen.asp"
else
Easp.Alert "删除失败！"
End if
End if
%>