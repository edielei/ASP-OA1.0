<!--#include file="../Inc/MailCs.asp"-->
<%
Dim sjr,bt,nr,fj,sj,fjr,isf,jg
sjr=Easp.Post("sjr:s")
bt=Easp.Post("bt:s")
nr=Easp.Post("nr:s")
fj=Easp.Post("files:s")
sj=now()
fjr=Easp.Cookie("uinfo>uname:s")
isf=Easp.Post("isf:n")



'===================================================
'循环发送

'===================================================



jg=db.Ar("SMail",Array("sjr:"&sjr,"bt:"&bt,"nr:"&nr,"fj:"&fj,"sj:"sj,"fjr:"&fjr))
jg = Easp.IIF(jg<>0, "OK", "Err")
Easp.W jg
%>