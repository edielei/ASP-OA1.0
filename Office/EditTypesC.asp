<!--#include file="../Inc/GzjhCs.asp"-->
<%
Dim id,types,jg
id=Easp.Post("id:n:0")
types=Easp.Post("types:s")
jg=db.UR("Types","id="&id,Array("types:"&types))
jg = Easp.IIF(jg<>0, "OK", "Err")
Easp.W jg
%>