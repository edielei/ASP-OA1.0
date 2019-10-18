<!--#include file="../Inc/Cse.asp"-->
<%
Dim id,zt,sj,jg,a
id=Easp.Post("id:n:0")
zt=Easp.Post("zt:s")
sj=Easp.Post("sj:d:"&now)
Select case zt
Case "离职" zt="lzsj:"&sj
Case "退休" zt="txsj:"&sj
End Select
jg=Easp.db.UR("Uinfo","id="&id,Array(zt))
a=Easp.db.RT("Uinfo","id="&id,"uid")
if Easp.Has(a) then
Call Easp.db.UR("Users","id="&a,"xs=False")
End if
jg = Easp.IIF(jg<>0, "OK", "Err")
Easp.Fso.DelFile "../Common/wdgg/"&id&".xml"
Easp.W jg
%>