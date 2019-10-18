<!--#include file="../Inc/BbsCs.asp"-->
<%
Dim bt,bkid,files,nr,jg
bt=Easp.Post("bt:s")
bkid=Easp.Post("bkid:n")
files=Easp.Post("files:s")
nr=Easp.Post("nr:s")
jg=db.AR("thread:id",Array("bt:"&bt,"uname:"&Easp.Cookie("uinfo>uname"),"bkid:"&bkid,"fj:"&files,"nr:"&nr))
jg=db.UR("thread","id="&jg,"tid="&jg)
jg = Easp.IIF(jg<>0, "OK", "Err")
Easp.W jg
%>