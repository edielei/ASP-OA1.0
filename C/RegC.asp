<!--#include file="../Easp/Easp.asp"-->
<%
if Not(Easp.CheckDataFrom()) then Easp.WE "Err"
Dim uname,upwd,gh,zname,wt,da,jg,email
uname=Easp.Post("uname:s")
upwd=Easp.Post("upwd:s")
gh=Easp.Post("gh:s")
zname=Easp.Post("zname:s")
wt=Easp.Post("wt:s")
da=Easp.Post("da:s")
email=Easp.Post("email")
if Easp.Test(email,"email")=false then Easp.WE "ErrM"
jg=Easp.db.RT("V_U","uname='"&uname&"' or gh='"&gh&"'","gh")
if Easp.Has(jg) then
Easp.WE "CF"
Else
jg=Easp.db.AR("Users",Array("uname:"&uname,"upwd:"&Easp.Md5(upwd),"zname:"&zname,"zctime:"&now,"wt:"&wt,"da:"&da,"email:"&email,"zcgh:"&gh))
jg = Easp.IIF(jg<>0, "OK", "Err")
Easp.W jg
End if
%>