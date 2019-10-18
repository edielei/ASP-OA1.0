<!--#include file="../Inc/KqCs.asp"-->
<%
Dim kssj,jssj,nr,jg
kssj=Easp.Post("kssj:d:"&now)
jssj=Easp.Post("jssj:d:"&now)
nr=Easp.Post("nr:s")
jg=db.AR("Cc",Array("uname:"&Easp.Cookie("uinfo>uname"),"kssj:"&kssj,"jssj:"&jssj,"nr:"&nr,"sj:"&now))
jg = Easp.IIF(jg<>0, "OK", "Err")
Easp.W jg
%>