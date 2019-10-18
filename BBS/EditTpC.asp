<!--#include file="../Inc/BbsCs.asp"-->
<%
Dim id,bt,xx,sl,lx,jg
id=Easp.Post("id:n:0")
bt=Easp.Post("bt:s")
xx=Easp.Post("xx:s")
sl=Easp.Post("sl:s")
lx=Easp.IIF(Easp.Post("lx:n")=1,true,false)
jg=db.UR("Tp","id="&id,Array("bt:"&bt,"xx:"&xx,"sl:"&sl,"lx:"&lx))
jg = Easp.IIF(jg<>0, "OK", "Err")
Easp.W jg
%>