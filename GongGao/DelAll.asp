<!--#include file="../Inc/Cse.asp"-->
<%
Dim id,a,j,f,i,path
id=Easp.Get("id:s")
a=Split(id,",")
For j=0 to UBound(a)
path="../Common/wdgg/"
Easp.Fso.DelFile "Nr/"&a(j)&".html"
f = Easp.Fso.Dir(path)
	For i = 0 to UBound(f,2)
		Easp.FSO.UpdateFile path&f(0,i), "<gg id="""&a(j)&""">1</gg>", ""
	Next
Next
Easp.Ext("ed").DelAll("Gg")
%>