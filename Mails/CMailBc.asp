<!--#include file="../Inc/MailCs.asp"-->
<%
Dim id,sjr,bt,nr,fj,unames,jg
id=Easp.Post("id:n:0")
sjr=Easp.Post("sjr:s")
bt=Easp.Post("bt:s")
nr=Easp.Post("nr:s")
fj=Easp.Post("files:s")
unames=Easp.Post("unames:s")
jg=db.UR("CMail","id="&id,Array("sjr:"&sjr,"bt:"&bt,"nr:"&nr,"fj:"&fj,"unames:"&unames))
jg = Easp.IIF(jg<>0, "OK", "Err")
Easp.W jg
%>