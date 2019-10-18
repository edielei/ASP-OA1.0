<!--#include file="../Inc/Cse.asp"-->
<%
Dim id,bt,nr,sj,files,jg
id=Easp.Post("id:n:0")
bt=Easp.Post("bt:s")
nr=Easp.Post("nr")
sj=Easp.Post("sj:d:"&now)
files=Easp.Post("files:s")
jg=Easp.db.UR("Fg","id="&id,Array("bt:"&bt,"sj:"&sj,"fj:"&files))
Easp.Fso.CreateFile "Nr/"&id&".html", nr
jg = Easp.IIF(jg<>0, "OK", "Err")
Easp.W jg
%>