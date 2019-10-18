<!--#include file="../Inc/TxlCse.asp" -->
<%
Dim id,zname,mc,dz,shouji,zj,email,jg
id=Easp.Post("id:n:0")
zname=Easp.Post("uname:s")
mc=Easp.Post("mc:s")
dz=Easp.Post("dz:s")
shouji=Easp.Post("shouji:s")
zj=Easp.Post("zj:s")
email=Easp.Post("email:s")
jg=db.UR("Bsc","id="&id,Array("zname:"&zname,"mc:"&mc,"dz:"&dz,"shouji:"&shouji,"zj:"&zj,"email:"&email))
jg = Easp.IIF(jg<>0, "OK", "Err")
Easp.W jg
%>