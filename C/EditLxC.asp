<!--#include file="../Inc/Cse.asp"-->
<%
Dim shouji,email,tel,add,jg
shouji=Easp.Post("shouji:s")
email=Easp.Post("email:s")
tel=Easp.Post("tel:s")
add=Easp.Post("add:s")
jg=Easp.db.UR("uinfo","id="&Easp.Cookie("uinfo>uid"),Array("shouji:"&shouji,"jtdh:"&tel,"add:"&add))
jg=Easp.db.UR("Users","uname='"&Easp.Cookie("uinfo>uname:s")&"'",Array("email:"&email))
jg = Easp.IIF(jg<>0, "OK", "Err")
Easp.W jg
%>