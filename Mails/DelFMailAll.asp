<!--#include file="../Inc/MailCs.asp"-->
<%
Dim id,jg
id=Easp.Get("id:s")
jg=db.DR("FMail","id in ("&id&")")
jg = Easp.IIF(jg<>0, "OK", "Err")
Easp.W jg
%>