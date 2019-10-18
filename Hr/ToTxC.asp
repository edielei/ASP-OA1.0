<!--#include file="../Inc/Cse.asp"-->
<%
Dim id,sj,jg
id=Easp.Post("id:n:0")
sj=Easp.Post("txsj:d:"&now)
jg=Easp.db.UR("Uinfo","id="&id,Array("txsj:"&sj,"lzsj:0"))
jg = Easp.IIF(jg<>0, "OK", "Err")
Easp.W jg
%>