<!--#include file="../Inc/BbsCs.asp"-->
<%
Dim id,nr,jg
id=Easp.Post("id:n:0")
nr=Easp.Post("nr:s")
jg=db.AR("Hf",Array("nr:"&nr,"uname:"&Easp.Cookie("uinfo>uname"),"sj:"&now,"tid:"&id))
jg = Easp.IIF(jg<>0, "OK", "Err")
Easp.W jg
%>