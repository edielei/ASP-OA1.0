<!--#include file="../Inc/WzCs.asp"--><!DOCTYPE html>
<html lang="cn">
<head>
<meta name="author" content="EdieLei">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<meta charset="UTF-8">
<title>Addwz</title>
<link rel="stylesheet" href="../Css/Inc.css">
<link rel="stylesheet" href="../Js/skins/aero.css">
<style type="text/css">
html{overflow:hidden;}
body{background:none;}
.table{margin:0;}
</style>
<script src="../Js/jQuery.js"></script>
<script src="../Js/vd.js"></script>
<script src="../Js/jquery.artDialog.js"></script>
<script src="../Js/artDialog.iframeTools.js"></script>
<script>
$(function(){
	var s=$('#tj');
	s.click(function(){
		var bt=$('#bt').vd('请输入标题！',1);if(!bt){return}
		var typesid=$('#typesid').vd('请选择类别！',1);if(!typesid){return}
		var wz=$('#wz').vd('请输入网址！',1);if(!wz){return}
		var ms=encodeURIComponent($.trim($.trim($('#ms').val())));
		$.post('AddNewC.asp','bt='+bt+'&typesid='+typesid+'&wz='+wz+'&ms='+ms,function(a){
			switch(a){
				case 'OK':art.dialog.open.api.hide();art.dialog.through({content:'添加成功！',icon:'succeed',resize:false,ok:function(){
					window.parent["mkj"].location.reload();					
				}});break;
				case 'Err':alert('操作失败！');location.reload();break;
			}
		})
	});
});
</script>
</head>
<body>
<table class="table">
<tr><td width="40" align="right" nowrap="nowrap" class="td">标题：</td><td class="td"><input id="bt" class="input" /> <em title="必填项">*</em></td></tr>
<tr><td width="40" align="right" nowrap="nowrap" class="td">类别：</td><td class="td"><select id="typesid"><option value="">请选择</option><%Dim rs,t,i
Set rs=db.GR("Types:id,types","uname='"&Easp.Cookie("uinfo>uname:s")&"'","px desc")
if Easp.IsN(rs) then
Easp.W ""
Else
t=rs.GetRows()
db.C(rs)
For i=0 to Ubound(t,2)
Easp.W "<option value="""&t(0,i)&""">"&t(1,i)&"</option>"
Next
End if
%></select> <em title="必填项">*</em></td></tr>
<tr><td width="40" align="right" nowrap="nowrap" class="td">网址：</td><td class="td"><input id="wz" class="input" style="width:180px;" /> <em title="必填项">*</em> (“http://”)开头</td></tr>
<tr><td width="40" align="right" nowrap="nowrap" class="td">描述：</td><td class="td"><textarea id="ms" style="width:280px;height:80px;" class="input"></textarea></td></tr>
<tr>
  <td width="40" align="right" nowrap="nowrap">&nbsp;</td>
  <td style="padding:2px;"><input id="tj" class="btn" type="submit" value="确定" /> <input type="button" value="取消" class="btn" onclick="art.dialog.open.api.close();" /></td>
</tr>
</table>
</body>
</html>