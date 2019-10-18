<!--#include file="../Inc/MailCs.asp"-->
<%
Dim sjr,bt,nr,fj,unames,jg
sjr=Easp.Post("sjr:s")
bt=Easp.Post("bt:s")
fj=Easp.Post("files:s")
nr=Easp.Post("nr:s")
unames=Easp.Post("unames:s")
jg=db.Ar("CMail",Array("sjr:"&sjr,"bt:"&bt,"fj:"&fj,"nr:"&nr,"fjr:"&Easp.Cookie("uinfo>uname"),"unames:"&unames))
jg = Easp.IIF(jg<>0, "OK", "Err")
Easp.W jg
%>