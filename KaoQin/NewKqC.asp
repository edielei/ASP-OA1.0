<!--#include file="../Inc/KqCs.asp"-->
<%
Dim uname,zname,types,kssj,jssj,nr,jg
uname=Easp.Post("uname:s")
types=Easp.Post("types:s")
kssj=Easp.Post("kssj:d:"&now)
jssj=Easp.Post("jssj:d:"&now)
nr=Easp.Post("nr:s")
Select case types
Case 1 types="Wc"
Case 2 types="Qj"
Case 3 types="Cc"
End Select
jg=db.AR(types,Array("uname:"&uname,"kssj:"&kssj,"jssj:"&jssj,"nr:"&nr,"sj:"&now))
jg = Easp.IIF(jg<>0, "OK", "Err")
Easp.W jg
%>