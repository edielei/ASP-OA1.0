<!--#include file="../Inc/TxlCse.asp"-->
<%
Dim uname,mc,dz,shouji,zj,email,jg
uname=Easp.Post("uname:s")
mc=Easp.Post("mc:s")
dz=Easp.Post("dz:s")
shouji=Easp.Post("shouji:s")
zj=Easp.Post("zj:s")
email=Easp.Post("email:s")
jg=db.AR("Bsc",Array("zname:"&uname,"mc:"&mc,"dz:"&dz,"shouji:"&shouji,"zj:"&zj,"email:"&email))
jg = Easp.IIF(jg<>0, "OK", "Err")
Easp.W jg
%>