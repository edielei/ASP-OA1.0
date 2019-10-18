<!--#include file="../Inc/Cse.asp"-->
<%
Dim bmid,bt,jg
bmid=Easp.Post("bmid:n:0")
bt=Easp.Post("bt:s")
jg=Easp.db.RT("Zw","bt='"&bt&"' and bmid="&bmid,"id")
if Easp.Has(jg) then
Easp.WE "CF"
End if
jg=Easp.db.AR("Zw:id",Array("bt:"&bt,"bmid:"&bmid))
jg=Easp.db.ur("Zw","id="&jg,Array("px:"&jg,"pxa:"&jg))
jg = Easp.IIF(jg<>0, "OK", "Err")
Easp.W jg
%>