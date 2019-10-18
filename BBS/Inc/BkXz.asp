<!--#include file="../../Inc/BbsCs.asp"-->
<select id="bkid">
<option value="">请选择所属版块</option>
<%
Dim rs,t,i,a
Set rs=db.GR("bk:id,bt","xs=True","id desc")
if Easp.Has(rs) then
t=rs.GetRows()
db.C(rs)
For i=0 to Ubound(t,2)
Easp.W "<option value="""&t(0,i)&""">"&Server.HTMLEncode(t(1,i))&"</option>"
Next
End if
%>
</select>