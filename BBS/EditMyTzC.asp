<!--#include file="../Inc/BbsCs.asp"-->
<%
Dim id,bt,bkid,fj,nr,jg
id=Easp.Post("id:n:0")
bt=Easp.Post("bt:s")
bkid=Easp.Post("bkid:n")
fj=Easp.Post("files:s")
nr=Easp.Post("nr:s")
jg=db.UR("thread","id="&id,Array("bt:"&bt,"bkid:"&bkid,"fj:"&fj,"nr:"&nr))
jg = Easp.IIF(jg<>0, "OK", "Err")
Easp.W jg
%>