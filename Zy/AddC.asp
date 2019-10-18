<!--#include file="../Inc/Cse.asp"-->
<%
Dim bt,bmid,bm,files,ms,uname,jg
bt=Easp.Post("bt:s")
bmid=Easp.Post("bmid:n")
if bmid=0 then
bm="所有部门"
Else
bm=Easp.db.RT("Bm","id="&bmid,"bt")
End if
files=Easp.Post("files:s")
ms=Easp.Post("ms:s")
uname=Easp.Cookie("uinfo>uname:s")
jg=Easp.db.AR("Zy",Array("bt:"&bt,"bmid:"&bmid,"bm:"&bm,"files:"&files,"ms:"&ms,"uname:"&uname,"sj:"&now))
jg = Easp.IIF(jg<>0, "OK", "Err")
Easp.W jg
%>