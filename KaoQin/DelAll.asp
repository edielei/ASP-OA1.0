<!--#include file="../Inc/KqCs.asp"--><%
Dim id,types,t
id=Easp.Get("id:s")
types=Easp.Get("types:s")
Select case types
Case "出差登记" t="Cc"
Case "外出登记" t="Wc"
Case "请假登记" t="Qj"
End Select
id=db.DR(t,"id in ("&id&")")
If id<>0 then
Easp.Ext("ed").rb
Else
Easp.Alert("删除失败！")
End if
%>