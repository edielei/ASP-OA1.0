<!--#include file="../Inc/Cse.asp"-->
<%
Dim bt,dx,nr,uname,jg
bt=Easp.Post("bt:s")
dx=Easp.Post("dx:n:0")
nr=Easp.Post("nr:s")
uname=Easp.Cookie("uinfo>uname:s")
jg=Easp.db.AR("Yj",Array("bt:"&bt,"dx:"&dx,"nr:"&nr,"sj:"&now,"uname:"&uname))
jg = Easp.IIF(jg<>0, "OK", "Err")
Easp.W jg
%>