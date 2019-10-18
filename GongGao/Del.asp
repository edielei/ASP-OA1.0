<!--#include file="../Inc/Cse.asp"-->
<%
Dim id
id=Easp.Get("id:n:0")
Easp.Fso.DelFile "Nr/"&id&".html"
Dim f,i,path
path="../Common/wdgg/"
f = Easp.Fso.Dir(path)
For i = 0 to UBound(f,2)
	Easp.FSO.UpdateFile path&f(0,i), "<gg id="""&id&""">1</gg>", ""
Next
Easp.Ext("ed").PtDel("Gg")
%>