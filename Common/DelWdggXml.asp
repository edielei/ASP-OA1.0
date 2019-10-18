<!--#include file="../Inc/Cse.asp"-->
<%
Dim id
id=Easp.Post("id:n:0")
Easp.Fso.DelFile "wdgg/"&id&".xml"
Easp.W id
%>