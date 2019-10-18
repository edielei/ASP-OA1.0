<!--#include file="../Inc/Cse.asp"-->
<%
Dim bt,nr,sj,files,uname,jg
bt=Easp.Post("bt:s")
nr=Easp.Post("nr")
sj=Easp.Post("sj:d:"&now)
files=Easp.Post("files:s")
uname=Easp.Cookie("uinfo>uname:s")
jg=Easp.db.AR("Fg:id",Array("bt:"&bt,"sj:"&sj,"fj:"&files,"uname:"&uname))
Easp.Fso.CreateFile "Nr/"&jg&".html",nr
jg=Easp.db.UR("Fg","id="&jg,"px="&jg)
jg = Easp.IIF(jg<>0, "OK", "Err")
Easp.W jg
%>