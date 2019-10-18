<!--#include file="../Inc/Cse.asp"-->
<%
Dim bt,jc,ys,nr,sj,files,jg
bt=Easp.Post("bt:s")
jc=Easp.Post("jc:s")
ys=Easp.Post("ys:s")
nr=Easp.Post("nr")
sj=Easp.Post("sj:s")
files=Easp.Post("files:s")
jg=Easp.db.AR("Gg:id",Array("bt:"&bt,"jc:"&jc,"ys:"&ys,"uname:"&Easp.Cookie("uinfo>uname"),"fj:"&files))
if jg<>0 then
Easp.FSO.CreateFile "Nr/"&jg&".html",nr
Dim f,i,path
path="/Common/wdgg/"
f = Easp.Fso.Dir(path)
For i = 0 to UBound(f,2)
	Easp.FSO.UpdateFile path&f(0,i), "</u>", "<gg id="""&jg&""">1</gg></u>"
	Easp.FSO.UpdateFile path&f(0,i), "\s{1,}<gg", "<gg"
Next
jg=Easp.db.UR("Gg","id="&jg,"px="&jg)
Easp.W "OK"
Else
Easp.W "Err"
End If
%>