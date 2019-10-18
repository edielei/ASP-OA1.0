<!--#include file="../Inc/GzjhCs.asp"-->
<%
Dim id,bt,typesid,kssj,jssj,nr,jg
id=Easp.Post("id:n:0")
bt=Easp.Post("bt:s")
typesid=Easp.Post("typesid:n")
kssj=Easp.Post("kssj:d:"&now)
jssj=Easp.Post("jssj:d:"&now)
nr=Easp.Post("nr:s")
jg=db.UR("Gzjh","id="&id,Array("bt:"&bt,"typesid:"&typesid,"kssj:"&kssj,"jssj:"&jssj,"nr:"&nr))
jg = Easp.IIF(jg<>0, "OK", "Err")
Easp.W jg
%>