<!--#include file="../Inc/Cse.asp"-->
<%
Dim id,jg,aa
id=Easp.Post("id:n:0")
jg=Easp.db.UR("uinfo","id="&id,Array("lzsj:0","txsj:0"))
jg = Easp.IIF(jg<>0, "OK", "Err")
aa = Easp.db.RT("Users","zid="&id,"id")
if Easp.IsN(aa) then
Easp.WE jg
End if
aa = Easp.db.RT("uinfo","id="&id,"uid")
if aa<>0 then
Easp.W "QR"
Else
Easp.W jg
End if
%>