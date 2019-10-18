<!--#include file="../Inc/BbsCs.asp"--><%Dim id,i
id=Easp.Get("id:n:2")%><!DOCTYPE html>
<html lang="cn">
<head>
<meta name="author" content="EdieLei">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<meta charset="UTF-8">
<title>AddTp</title>
<link rel="stylesheet" href="../Css/Inc.css">
<style type="text/css">.x{width:250px;}</style>
<script src="../Js/jQuery.js"></script>
<script src="../Js/vd.js"></script>
<script>
$(function(){
	var sl=$('#sl'),s=$('#tj');
	sl.val('<%=id%>');
	sl.change(function(){
		var a=$(this).val();
		location='AddTp.asp?id='+a;
	});
	s.click(function(){
		var bt=$('#bt').vd('请输入标题！',1);if(!bt){return}
		if($('input[name="lx"]:checked').length==0){alert('请选择类型！');return false;}
		var xx=$('input[name="xx"]').vd('请把选项填写完整！',1);if(!xx){return}
		xx=$('input[name="xx"]').map(function(){return encodeURIComponent($(this).val());}).get().join(',');
		var sl=$('input[name="xx"]').map(function(){return encodeURIComponent($(this).attr('data'));}).get().join(',');
		var lx=$('input[name="lx"]:checked').val();
		$.post('AddTpC.asp','bt='+bt+'&xx='+xx+'&sl='+sl+'&lx='+lx,function(a){
			switch(a){
				case 'OK':alert('发布成功！');location.replace('TpGl.asp');break;
				case 'Err':alert('操作失败！');location.reload();break;
			}
		});
	});
});
</script>
</head>
<body>
<table border="0" cellpadding="0" cellspacing="0" class="table">
	<tr><th class="th" colspan="2">&nbsp;发布投票</th></tr>
<tr>
    	<td width="60" align="right" class="td">标题：</td><td class="td"><input id="bt" class="input" style="width:250px;" /> <em title="必填项">*</em></td>
    </tr>
    <tr>
    	<td width="60" align="right" class="td">类型：</td><td class="td"><label><input name="lx" type="radio" value="0" />单选</label>&nbsp;<label><input type="radio" name="lx" value="1" />多选</label></td>
    </tr>
    <tr>
      <td align="right" class="td">选项数：</td>
      <td class="td"><select id="sl"><option value="2">2</option><option value="3">3</option><option value="4">4</option><option value="5">5</option><option value="6">6</option><option value="7">7</option><option value="8">8</option><option value="9">9</option><option value="10">10</option></select></td>
    </tr><%For i = 1 to id%>
    <tr>
    	<td width="60" align="right" class="td">选项 <%=i%>：</td><td class="td"><input name="xx" class="input x" data="0" /> <em title="必填项">*</em></td>
    </tr>
    <%NExt%>
    <tr>
    	<td>&nbsp;</td><td style="padding:2px;"><input id="tj" type="submit" value="确定" class="btn" /> <input type="button" class="btn" value="重置" onclick="location.reload()" /></td>
    </tr>
</table>
</body>
</html>