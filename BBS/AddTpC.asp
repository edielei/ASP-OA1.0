<!--#include file="../Inc/BbsCs.asp"-->
<%
Dim bt,xx,sl,lx,jg
bt=Easp.Post("bt:s")
xx=Easp.Post("xx:s")
sl=Easp.Post("sl:s")
lx=Easp.IIF(Easp.Post("lx:n")=1,true,false)
jg=db.Ar("Tp",Array("bt:"&bt,"xx:"&xx,"sl:"&sl,"lx:"&lx,"sj:"&now))
jg = Easp.IIF(jg<>0, "OK", "Err")
Easp.W jg
%>