<!--#include file="../Inc/WzCs.asp"-->
<%
Dim types,jg
types=Easp.Post("types:s")
jg=db.Ar("Types:id",Array("types:"&types,"uname:"&Easp.Cookie("uinfo>uname:s")))
jg=db.UR("Types","id="&jg,"px="&jg)
jg = Easp.IIF(jg<>0, "OK", "Err")
Easp.W jg
%>