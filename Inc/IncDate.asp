<% 
Sub Calendar() 

Dim y, m, d, aa
Dim i, j, n, c, w 
Dim iEnd

' y, m, d 年 月 日 
y = Year(Date()) 
m = Month(Date()) 
d = Day(Date()) 

' n 一年的天数 
If y Mod 400 = 0 Or (y Mod 4 = 0 And y Mod 100 <> 0) Then 
n = 366 
Else 
n = 365 
End If 

' c 当前月的天数 
Select Case m 
Case 1, 3, 5, 7, 8, 10, 12 
c = 31 
Case 2 
If n = 366 Then 
c = 29 
Else 
c = 28 
End If 
Case Else 
c = 30 
End Select 

' w 当前月第一天是星期几 
w = CInt(Weekday(DateSerial(y, m, 1))) 
iEnd = ((w+c-1)\7-CInt((w+c-1)\7<>(w+c-1)/7))*7 

Response.Write "<table id=""calendar"" width=""100%"">"
Response.Write "<tr height=""21""><th colspan=""7"" align=""center"">"&y&"年"&m&"月</th></tr>"
Response.Write "<tr style=""background:#B9EDCE;height:18px""><td class=""sunday"" align=""center"">日</td><td align=""center"">一</td><td align=""center"">二</td><td align=""center"">三</td><td align=""center"">四</td><td align=""center"">五</td><td align=""center"">六</td></tr>" 
For i = 1 To iEnd 
If i = 1 Then Response.Write "<tr height=""20"">" 
If i > w-1 And i < w+c Then
aa=Easp.DateTime(y&"-"&m&"-"&i-w+1,"yyyy-mm-dd")	'纯粹格式化时间
If i Mod 7 = 1 Then
Response.Write "<td class=""sunday"" align=""center""><a href=""javascript:gzjh('"&aa&"');"">" 
Else
Response.Write "<td align=""center""><a href=""javascript:gzjh('"&aa&"');"">" 
End If
If i-w+1 = d Then 
Response.Write "<span id=""today"" style=""font-weight:700;display:block;background:#B9EDCE"" title=""今天"">" & i-w+1 & "</span>" 
Else 
Response.Write i-w+1 
End If 
Response.Write "</a></td>" 
Else 
Response.Write "<td></td>" 
End If 
If i Mod 7 = 0 And i <> iEnd Then Response.Write "</tr><tr height=""20"">" 
If i = iEnd Then Response.Write "</tr>" 
Next 
Response.Write "</table>" 
End Sub 
Call Calendar
%>