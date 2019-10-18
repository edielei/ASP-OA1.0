<!--#include file="../Inc/KqCs.asp"-->
<%
Dim id,kssj,jssj,nr,jg
id=Easp.Post("id:n:0")
kssj=Easp.Post("kssj:d:"&now)
jssj=Easp.Post("jssj:d:"&now)
nr=Easp.Post("nr:s")
jg=db.UR("Cc","id="&id,Array("kssj:"&kssj,"jssj:"&jssj,"nr:"&nr))
jg = Easp.IIF(jg<>0, "OK", "Err")
Easp.W jg
%>