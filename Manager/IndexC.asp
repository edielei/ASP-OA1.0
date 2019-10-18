<!--#include file="../Inc/Cse.asp"-->
<%
Dim mc,dh,cz,wz,yb,dz,nr
mc=Easp.Post("mc")
dh=Easp.Post("dh")
cz=Easp.Post("cz")
wz=Easp.Post("wz")
yb=Easp.Post("yb")
dz=Easp.Post("dz")
nr=Easp.Post("nr")
Easp.XML.Open("Index.xml")
Easp.XML("info>mc").Text = mc
Easp.XML("info>dh").Text = dh
Easp.XML("info>cz").Text = cz
Easp.XML("info>wz").Text = wz
Easp.XML("info>yb").Text = yb
Easp.XML("info>dz").Text = dz
Easp.Xml.Save
Easp.Xml.Close
Easp.Fso.CreateFile "IndexNr.html",nr
Easp.W "OK"
%>