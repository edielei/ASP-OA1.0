<!--#include file="../Inc/Cse.asp"-->
<%
Dim id,a,j
id=Easp.Get("id:s")
id=Easp.Get("id:s")
a=Split(id,",")
For j=0 to UBound(a)
Easp.Fso.DelFile "Nr/"&a(j)&".html"
Next
Easp.Ext("ed").online
Easp.Ext("ed").DelAll("Fg")
%>