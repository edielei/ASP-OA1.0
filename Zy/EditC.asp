<!--#include file="../Inc/Cse.asp"-->
<%
Dim id,bt,bmid,bm,files,ms,jg
id=Easp.Post("id:n:0")
bt=Easp.Post("bt:s")
bmid=Easp.Post("bmid:n:0")
bm=Easp.db.RT("Bm","id="&bmid,"bt")
files=Easp.Post("files:s")
ms=Easp.Post("ms:s")
jg=Easp.db.UR("Zy","id="&id,Array("bt:"&bt,"bmid:"&bmid,"bm:"&bm,"files:"&files,"ms:"&ms))
jg = Easp.IIF(jg<>0, "OK", "Err")
Easp.W jg
%>