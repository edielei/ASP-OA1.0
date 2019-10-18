<!--#include file="../Inc/Cse.asp"-->
<%
Dim id,sj,jg
id=Easp.Post("id:n:0")
sj=Easp.Post("lzsj:d:"&now)
jg=Easp.db.UR("Uinfo","id="&id,Array("lzsj:"&sj,"txsj:0"))
jg = Easp.IIF(jg<>0, "OK", "Err")
Easp.W jg
%>