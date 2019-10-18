<!--#include file="../Inc/Cse.asp"-->
<%
Dim id,bt,nr,sj,jg
id=Easp.Post("id:n:0")
bt=Easp.Post("bt:s")
nr=Easp.Post("nr")
sj=Easp.Post("sj:d:"&now)
jg=Easp.db.UR("Gzzj","id="&id,Array("bt:"&bt,"sj:"&sj))
Easp.Fso.CreateFile "GzzjNr/"&id&".html", nr
jg = Easp.IIF(jg<>0, "OK", "Err")
Easp.W jg
%>