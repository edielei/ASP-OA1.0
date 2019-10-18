<!--#include file="../Inc/WzCs.asp"-->
<%
Dim bt,typesid,wz,ms,jg
bt=Easp.Post("bt:s")
typesid=Easp.Post("typesid:n")
wz=Easp.Post("wz:s")
ms=Easp.Post("ms:s")
jg=db.Ar("wz:id",Array("bt:"&bt,"typesid:"&typesid,"wz:"&wz,"ms:"&ms,"uname:"&Easp.Cookie("uinfo>uname:s")))
jg = db.UR("wz","id="&jg,"px="&jg)
jg = Easp.IIF(jg<>0, "OK", "Err")
Easp.W jg
%>