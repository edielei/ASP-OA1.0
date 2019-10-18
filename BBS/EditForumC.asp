<!--#include file="../Inc/BbsCs.asp"-->
<%
Dim id,bt,jy,jg
id=Easp.Post("id:n:0")
bt=Easp.Post("bt:s")
jy=Easp.Post("nr:s")
jg=db.UR("bk","id="&id,Array("bt:"&bt,"jy:"&jy))
jg = Easp.IIF(jg<>0, "OK", "Err")
Easp.W jg
%>