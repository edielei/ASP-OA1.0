<!--#include file="../Inc/Cse.asp"-->
<%
Dim id,gh,rzsj,zwid,bmid,fj,zname,ozname,xb,csrq,mz,jg,zzmm,rtsj,hf,xl,xw,xz,sfzhm,jk,grzp,add,jtdh,shouji,xxjl,gzjy,hjqk,zycy,jjlxr,lxdh,jgjg
id=Easp.Post("id:n:0")
gh=Easp.Post("gh:s")
rzsj=Easp.Post("rzsj:d:"&now)
zwid=Easp.Post("zwid:n")
bmid=Easp.db.RT("Zw","id="&zwid,"bmid")
fj=Easp.Post("fj:s")
zname=Easp.Post("zname:s")
ozname=Easp.Post("ozname:s")
xb=Easp.Post("xb:s")
csrq=Easp.Post("csrq:d")
mz=Easp.Post("mz:s")
jg=Easp.Post("jg:s")
zzmm=Easp.Post("zzmm:s")
rtsj=Easp.Post("rtsj:d")
hf=Easp.Post("hf:s")
xl=Easp.Post("xl:s")
xw=Easp.Post("xw:s")
xz=Easp.Post("xz:s")
sfzhm=Easp.Post("sfzhm:s")
jk=Easp.Post("jk:s")
grzp=Easp.Post("grzp:s")
add=Easp.Post("add:s")
jtdh=Easp.Post("jtdh:s")
shouji=Easp.Post("shouji:s")
xxjl=Easp.Post("xxjl:s")
gzjy=Easp.Post("gzjy:s")
hjqk=Easp.Post("hjqk:s")
zycy=Easp.Post("zycy:s")
jjlxr=Easp.Post("jjlxr:s")
lxdh=Easp.Post("lxdh:s")
jgjg=Easp.db.UR("uinfo","id="&id,Array("gh:"&gh,"rzsj:"&rzsj,"zwid:"&zwid,"zname:"&zname,"bmid:"&bmid,"fj:"&fj,"ozname:"&ozname,"xb:"&xb,"csrq:"&csrq,"mz:"&mz,"jg:"&jg,"zzmm:"&zzmm,"rtsj:"&rtsj,"hf:"& hf,"xl:"&xl,"xw:"&xw,"xz:"&xz,"sfzhm:"&sfzhm,"jk:"&jk,"grzp:"&grzp,"add:"&add,"jtdh:"&jtdh,"shouji:"&shouji,"xxjl:"&xxjl,"gzjy:"&gzjy,"hjqk:"&hjqk,"zycy:"&zycy,"jjlxr:"&jjlxr,"lxdh:"&lxdh))
jgjg = Easp.IIF(jgjg<>0, "OK", "Err")
Easp.W jgjg%>