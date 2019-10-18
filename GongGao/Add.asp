<!--#include file="../Inc/Cse.asp"--><!DOCTYPE html>
<html lang="cn">
<head>
<meta name="author" content="EdieLei">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<meta charset="UTF-8">
<title>Add</title>
<link rel="stylesheet" href="../Css/Add.css">
<style type="text/css">#bt{color:#48795B;}.jc{font-weight:700;border:1px #B7C7Be solid;}.jca{font-weight:700;}</style>
<script src="../Js/jQuery.js"></script>
<script src="../Editor/kindeditor.js"></script>
<script src="../Js/vd.js"></script>
<script src="../DatePicker/WdatePicker.js"></script>
<script src="../Js/jscolor/jscolor.js"></script>
<script>
KE.show({
	id:'nr',
	allowFileManager:true,
	fileManagerJson : '../../filem/file_manager_json.asp',
	imageUploadJson : '../../filem/upload_json.asp',
	allowPreviewEmoticons:false,
	resizeMode:1,
	minHeight:200,
	urlType:'absolute'
});
$(function(){
	$('#jc').click(function(){
		$(this).toggleClass('jc');
		$('#bt').toggleClass('jca');
	});
	$('#ys').bind('focus blur',function(){
		var a=$(this).val();
		$('#bt').css('color','#'+a);
	});
	var s=$('#tj');
	s.click(function(){
		var bt=$('#bt').vd('请输入标题！');if(!bt){return}
		var nr=$.trim(KE.html('nr'));
		if(KE.isEmpty('nr')){alert('请输入内容！');KE.focus('nr');return !1;}
		var sj=$.trim($('#sj').val());
		if(sj.length==0){alert('请输入时间！');$('#sj').select();return false;}
		var files=$('#files').contents().find('span');
		if(files.length==0){files=""}else{files=files.html()}
		var jc=$('#jc').hasClass('jc');
		var ys=$('#ys').val();
		$.post('AddC.asp', {'bt':bt,'jc':jc,'ys':ys,'nr':nr,'sj':sj,'files':files},function(a){
			switch(a){
				case 'OK':alert('发布成功！');location.replace('Gl.asp');break;
				case 'Err':alert('操作失败！');location.reload();break;
			}
		})
	});
});
</script>
</head>
<body>
<table border="0" cellpadding="0" cellspacing="0" class="table">
	<tr>
		<th class="th" colspan="2">&nbsp;发布公司公告</th>
	</tr>
    <tr><td width="40" class="td">标题：</td><td class="td"><input id="bt" class="input" style="width:260px;" /> <em title="必填项">*</em>&nbsp;&nbsp;<a id="jc" href="javascript:;"><img src="../Images/edit-bold.png" alt="" />加粗</a>&nbsp;&nbsp;<label for="ys">字体颜色：<input id="ys" class="input color" style="width:48px;background:#48795B;" value="48795B" /></label></td></tr>
    <tr>
   	  <td width="40" class="td">内容：</td>
   	  <td class="td"><textarea id="nr" style="width:100%;height:280px;"></textarea></td>
  </tr>
    <tr>
   	  <td width="40" class="td">时间：</td>
   	  <td class="td"><input id="sj" class="input" value="<%=Easp.DateTime(now(),"yyyy-mm-dd")%>" style="width:80px;" onfocus="WdatePicker()" /> <em title="必填项">*</em></td>
  </tr>
  <tr>
  	<td width="40" class="td">附件：</td>
  	<td class="td"><iframe id="files" src="../C/UpF.asp" frameborder="0" height="24" width="400"></iframe></td>
  </tr>
    <tr>
   	  <td width="40">&nbsp;</td>
   	  <td><input id="tj" type="submit" value="确定" class="btn" /> <input type="reset" value="重置" class="btn" onclick="location.reload()" /> <input type="button" value="取消" class="btn" onclick="history.back()" /></td>
  </tr>
</table>
</body>
</html>