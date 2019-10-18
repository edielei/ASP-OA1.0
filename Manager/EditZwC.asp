<!--#include file="../Inc/Cse.asp"-->
<%
Dim id,bmid,bt,jg
id=Easp.Post("id:n:0")
bmid=Easp.Post("bmid:n:0")
bt=Easp.Post("bt:s")
jg=Easp.db.UR("Zw","id="&id,Array("bt:"&bt,"bmid:"&bmid))
jg = Easp.IIF(jg<>0, "OK", "Err")
Easp.W jg
%>