<!--#include file="../Inc/WzCs.asp"-->
<%
Dim id,bt,typesid,wz,ms,jg
id=Easp.Post("id:n")
bt=Easp.Post("bt:s")
typesid=Easp.Post("typesid:n")
wz=Easp.Post("wz:s")
ms=Easp.Post("ms:s")
jg=db.UR("Wz","id="&id,Array("bt:"&bt,"typesid:"&typesid,"wz:"&wz,"ms:"&ms))
jg = Easp.IIF(jg<>0, "OK", "Err")
Easp.W jg
%>