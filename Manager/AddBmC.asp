<!--#include file="../Inc/Cse.asp"-->
<%
Dim bt,zxdh,jg
bt=Easp.Post("bt:s")
zxdh=Easp.Post("zxdh:s")
jg=Easp.db.RT("Bm","bt='"&bt&"'","id")
if Easp.Has(jg) then
Easp.W "CF"
Else
jg=Easp.db.Ar("Bm:id",Array("bt:"&bt,"zx:"&zxdh))
jg=Easp.db.UR("Bm","id="&jg,"px="&jg)
jg = Easp.IIF(jg<>0, "OK", "Err")
Easp.W jg
End if
%>