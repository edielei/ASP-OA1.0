<!--#include file="../Inc/MailCs.asp"-->
<%
Dim sjr,unames,bt,files,nr,fjx,jg,i
sjr=Easp.Post("sjr:s")
unames=Easp.Post("sjr:s")
bt=Easp.Post("bt:s")
files=Easp.Post("files:s")
nr=Easp.Post("nr:s")
fjx=Easp.Post("fjx")
sjr=split(sjr,",")
For i=0 to UBound(sjr)
jg=db.AR("SMail",Array("sjr:"&sjr(i),"bt:"&bt,"fj:"&files,"nr:"&nr,"fjr:"&Easp.Cookie("uinfo>uname:s"),"sj:"&now))
Next
if fjx then
sjr=unames
unames=Easp.Post("unames:s")
jg=db.AR("FMail",Array("sjr:"&sjr,"bt:"&bt,"fj:"&files,"nr:"&nr,"fjr:"&Easp.Cookie("uinfo>uname:s"),"unames:"&unames))
End if
jg = Easp.IIF(jg<>0, "OK", "Err")
Easp.W jg
%>