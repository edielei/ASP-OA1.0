<!--#include file="../Inc/GzjhCs.asp"-->
<%
Dim bt,typesid,kssj,jssj,nr,jg
bt=Easp.Post("bt:s")
typesid=Easp.Post("typesid:n")
kssj=Easp.Post("kssj:d:"&now)
jssj=Easp.Post("jssj:d:"&now)
nr=Easp.Post("nr:s")
jg=db.AR("Gzjh",Array("bt:"&bt,"nr:"&nr,"kssj:"&kssj,"jssj:"&jssj,"typesid:"&typesid,"uname:"&Easp.Cookie("uinfo>uname:s")))
jg = Easp.IIF(jg<>0, "OK", "Err")
Easp.W jg
%>