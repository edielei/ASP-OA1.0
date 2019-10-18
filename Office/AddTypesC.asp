<!--#include file="../Inc/GzjhCs.asp"-->
<%
Dim types,jg
types=Easp.Post("types:s")
jg=db.Ar("Types",Array("types:"&types,"uname:"&Easp.Cookie("uinfo>uname:s")))
jg = Easp.IIF(jg<>0, "OK", "Err")
Easp.W jg
%>