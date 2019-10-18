<!--#include file="../Inc/Cse.asp"-->
<%
Dim bt,nr,sj,uname,zname,jg
bt=Easp.Post("bt:s")
nr=Easp.Post("nr")
sj=Easp.Post("sj:d:"&now)
uname=Easp.Cookie("uinfo>uname:s")
zname=Easp.Cookie("uinfo>zname:s")
jg=Easp.db.AR("Gzzj:id",Array("bt:"&bt,"sj:"&sj,"uname:"&uname,"zname:"&zname))
Easp.Fso.CreateFile "GzzjNr/"&jg&".html",nr
jg = Easp.IIF(jg<>0, "OK", "Err")
Easp.W jg
%>