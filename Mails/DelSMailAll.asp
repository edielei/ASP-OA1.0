<!--#include file="../Inc/MailCs.asp"-->
<%
Dim id
id=Easp.Get("id:s")
id=db.UR("SMail","id in ("&id&")","isdel = true")
If id<>0 then
Easp.Ext("ed").rb
Else
Easp.Alert("删除失败！")
End if
%>