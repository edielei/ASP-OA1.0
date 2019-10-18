<!--#include file="../Inc/Cse.asp"-->
<%
Dim id,zt,sj,jg,a
id=Easp.Post("id:n:0")
zt=Easp.Post("zt:s")
sj=Easp.Post("sj:d:"&now)
Select case zt
Case "在职" zt=Array("lzsj:0,txsj:0")
Case "退休" zt=Array("lzsj:0,txsj:"&sj)
End Select
jg=Easp.db.UR("Uinfo","id="&id,zt)
a=Easp.db.RT("Uinfo","id="&id,"uid")
if Easp.Has(a) then
if zt=Array("lzsj:0,txsj:0") then
Call Easp.db.UR("Users","id="&a,"xs=True")
Else
Call Easp.db.UR("Users","id="&a,"xs=False")
End if
End if
jg = Easp.IIF(jg<>0, "OK", "Err")
Easp.W jg
%>