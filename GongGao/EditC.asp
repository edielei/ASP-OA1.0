<!--#include file="../Inc/Cse.asp"-->
<%
Dim id,bt,jc,ys,nr,sj,files,jg
id=Easp.Post("id:n:0")
bt=Easp.Post("bt:s")
jc=Easp.Post("jc:s")
ys=Easp.Post("ys:s")
nr=Easp.Post("nr")
sj=Easp.Post("sj:d:"&now)
files=Easp.Post("files:s")
jg=Easp.db.UR("Gg","id="&id,Array("bt:"&bt,"jc:"&jc,"ys:"&ys,"sj:"&sj,"fj:"&files))
Easp.Fso.CreateFile "Nr/"&id&".html", nr
jg = Easp.IIF(jg<>0, "OK", "Err")
Easp.W jg
%>