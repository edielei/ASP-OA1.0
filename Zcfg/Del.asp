<!--#include file="../Inc/Cse.asp"-->
<%
Dim id
id=Easp.Get("id:n:0")
Easp.Fso.DelFile "Nr/"&id&".html"
Easp.Ext("ed").online
Easp.Ext("ed").PtDel("Fg")
%>