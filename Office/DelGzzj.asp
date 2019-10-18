<!--#include file="../Inc/Cse.asp"-->
<%
Dim id
id=Easp.Get("id:n:0")
Easp.Fso.DelFile "GzzjNr/"&id&".html"
Easp.Ext("ed").PtDel("Gzzj")
%>