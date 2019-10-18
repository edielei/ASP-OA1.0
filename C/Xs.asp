<!--#include file="../Inc/CSe.asp"-->
<%
dim zhi,id,jg,table
table=Easp.Post("table:s")
zhi=Easp.CLeft(Easp.CRight(Easp.Post("zhi"),"../Images/"),".")
zhi=Easp.IIF(zhi="yes",0,1)
id=Easp.Post("id:n")
jg=Easp.db.UR(table,"id="&id,"xs="&zhi)
jg=Easp.IIF(jg<>0,zhi,"Error")
if jg=zhi then
end if
Easp.W jg
%>