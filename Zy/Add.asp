<!--#include file="../Inc/Cse.asp"--><!DOCTYPE html>
<html lang="cn">
<head>
<meta name="author" content="EdieLei">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<meta charset="UTF-8">
<title>Add</title>
<link rel="stylesheet" href="../Css/Add.css">
<script src="../Js/jQuery.js"></script>
<script src="../Js/vd.js"></script>
<script>
$(function(){
	var s=$('#tj');
	s.click(function(){
		var bt=$('#bt').vd('请输入标题！');if(!bt){return}
		var files=$('#files').contents().find('span');
		if(files.length==0){alert('请上传文件！');return !1;}
		var ms=$('#ms').vd('请输入描述信息！');if(!ms){return}
		var bmid=$('#bm').val();
		$.post('AddC.asp','bt='+bt+'&bmid='+bmid+'&files='+files.html()+'&ms='+ms,function(a){
			switch(a){
				case 'OK':alert('添加成功！');location.replace('List.asp');break;
				case 'Err':alert('操作失败！');location.reload();break;
			}
		});
	});
});
</script>
</head>
<body>
<table border="0" cellpadding="0" cellspacing="0" class="table">
<tr><th class="th" colspan="2">&nbsp;发布资源文件</th></tr>
<tr><td width="40" class="td">标题：</td><td class="td"><input id="bt" class="input" /> <em title="必填项">*</em></td></tr>
<tr><td width="40" class="td">部门：</td><td class="td"><select id="bm" class="input"><option value="0">所有部门</option><option value="<%Easp.W Easp.Cookie("uinfo>bmid")%>"><%Easp.W Easp.db.RT("Bm","id="&Easp.Cookie("uinfo>bmid"),"bt")%></option></select> <em title="必填项">*</em></td></tr>
<tr><td width="40" class="td">文件：</td><td class="td"><iframe id="files" src="../C/UpF.asp" frameborder="0" height="24" width="400"></iframe></td></tr>
<tr><td width="40" class="td">描述：</td><td class="td"><textarea id="ms" class="input" style="width:350px;height:130px;"></textarea> <em title="必填项">*</em></td></tr>
<tr><td width="40">&nbsp;</td><td><input id="tj" type="submit" value="确定" class="btn" /> <input type="reset" value="重置" class="btn" onclick="location.reload()" /> <input type="button" value="取消" class="btn" onclick="history.back()" /></td></tr>
</table>
</body>
</html>