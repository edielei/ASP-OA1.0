<!--#include file="../Inc/Cse.asp"-->
<%Dim rs,t,i,r,tt,ii
Set rs=Easp.db.GR("Bm:id,bt","","px desc")
if Easp.IsN(rs) then
Easp.W "<option>请选择</option>"
Else
t=rs.GetRows()
Easp.db.C(rs)
Easp.W "<option value="""">请选择</option>"
For i=0 to UBound(t,2)
%>
<optgroup label="<%Easp.WH t(1,i)%>">
<%
Set r=Easp.db.GR("Zw:id,bt","bmid="&t(0,i),"pxa desc")
if Easp.IsN(r) then
Easp.W ""
Else
tt=r.GetRows()
Easp.db.C(r)
For ii=0 to UBound(tt,2)
%>
<option value="<%=tt(0,ii)%>"><%Easp.WH tt(1,ii)%></option>        
<%
Next
End if
%>
</optgroup>
<%
Next
End if
%>