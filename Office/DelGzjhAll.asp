<!--#include file="../Inc/GzjhCs.asp"-->
<%
Dim id
id=Easp.Get("id:s")
id=db.DR("Gzjh","id in ("&id&")")
If id<>0 then
Easp.Ext("ed").rb
Else
Easp.Alert("删除失败！")
End if
%>