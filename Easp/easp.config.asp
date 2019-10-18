<%
Easp.BasePath = "/easp/"
Easp.CharSet = "UTF-8"

''打开开发者调试模式：
Easp.Debug = False

''不加密Cookies数据:
Easp.CookieEncode = True

''设置如何处理载入的UTF-8文件的BOM信息(keep/remove/add)：
Easp.FileBOM = "remove"
Easp.db.Conn = Easp.db.OpenConn(1,"/db/db.asp","")
%>