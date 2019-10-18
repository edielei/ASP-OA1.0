<!--#include file="../Inc/BbsCs.asp"-->
<%
Dim bt,nr,jg
bt=Easp.Post("bt:s")
nr=Easp.Post("nr:s")
jg=db.Ar("bk:id",Array("bt:"&bt,"jy:"&nr))
jg=db.UR("bk","id="&jg,"px="&jg)
jg = Easp.IIF(jg<>0, "OK", "Err")
Easp.W jg
%>