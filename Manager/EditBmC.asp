<!--#include file="../Inc/Cse.asp"-->
<%
Dim id,bt,zx,jg
id=Easp.Post("id:n:0")
bt=Easp.Post("bt:s")
zx=Easp.Post("zx:s")
jg=Easp.db.UR("Bm","id="&id,Array("bt:"&bt,"zx:"&zx))
jg = Easp.IIF(jg<>0, "OK", "Err")
Easp.W jg
%>