<!--#include file="../Inc/Cse.asp"--><%
Dim id,r
id=Easp.Get("id:n:0")
r=Easp.db.RT("users","id="&id,"uname,zname")
%><!DOCTYPE html>
<html lang="cn">
<head>
<meta name="author" content="EdieLei">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<meta charset="UTF-8">
<title>Qxfp</title>
<link rel="stylesheet" href="../Css/Add.css">
<style type="text/css">
html{overflow:hidden;}
body{background:none;margin:0;}
.table{margin:0;background:none; border-collapse:collapse}
.td input{vertical-align:middle;}
td{font-family:Tahoma, Geneva, sans-serif;padding:4px 2px;border:1px #DDD solid;vertical-align:middle}
</style>
<script src="../Js/jQuery.js"></script>
<script src="../Js/vd.js"></script>
<script src="../Js/jquery.artDialog.js"></script>
<script src="../Js/artDialog.iframeTools.js"></script>
<script>
$(function(){
	var tr3=$('tr:eq(3)');
	$('#qx').change(function(){
		var a=$(this).val();
		switch(a){
			case '1':tr3.hide();art.dialog.open.api.size(220,110).position('50%','38.2%');break;
			case '2':tr3.show();art.dialog.open.api.size(420,200).position('50%','38.2%');
					$('input[id^="is"]').attr('checked','checked');
					$('#my').removeAttr('checked');
					break;
			case '3':tr3.show();art.dialog.open.api.size(420,200).position('50%','38.2%');$(':radio:lt(2)').removeAttr('checked');break;
		}
	});
	$('input[id^="is"]').change(function(){
		var a=$('input[id^="is"]:checked').length;
		if(a==9){$('#qx').val('2');if($('#my').attr('checked')){$('#qx').val('3')}}
		if(a<9){
			$('#qx').val('3');
		}
	});
	$('#bgs,#jl,#my').change(function(){
		var a=$('input[id^="is"]:checked').length;
		if(a==9){$('#qx').val('2');}
		if($('#my').attr('checked')){$('#qx').val('3')}
	});
	var s=$('#tj');
	s.click(function(){
		var qx=$('#qx').vd('请选择权限类型！',1);if(!qx){return}
		if(qx!=1){
			var yj=$('input[name="yj"]:checked');
			if(yj.length==0){
				alert('请选择意见类型！');
				return false;
			}
		}
		//qx获取当前权限类型
		var isgg=$('#isgg').attr('checked');	//公告及政策法规管理权限
		var iszy=$('#iszy').attr('checked');	//获取资源共享管理权限
		var istxl=$('#istxl').attr('checked');	//获取通讯录权限
		var iskq=$('#iskq').attr('checked');	//获取考勤管理权限
		var yjlx=$('input[name="yj"]:checked').val();	//获取意见类型，2表示没有，0表示办公室，1表示经理
		var ishr=$('#ishr').attr('checked');	//获取人力资源管理权限
		var isbbs=$('#isbbs').attr('checked');	//获取讨论区管理权限
		var istp=$('#istp').attr('checked');	//获取投票管理权限
		var issys=$('#issys').attr('checked');	//获取系统管理权限
		var islw=$('#iswl').attr('checked');	//获取网络会议管理权限
		$.post('QxFpC.asp','id=<%=id%>&qx='+qx+'&isgg='+isgg+'&iszy='+iszy+'&istxl='+istxl+'&iskq='+iskq+'&yjlx='+yjlx+'&ishr='+ishr+'&isbbs='+isbbs+'&istp='+istp+'&issys='+issys+'&iswl='+iswl,function(a){
			switch(a){
				case 'OK':
					art.dialog.open.api.hide();
					art.dialog.through({icon:'succeed',content:'权限分配成功，该用户可以正常使用本系统！',resize:false,ok:function(){
						art.dialog.open.origin.location.reload();
					}});
				break;
				case 'Err':location.reload();break;
			}
		});
	});
});
</script>
</head>
<body>
<table border="0" align="center" cellpadding="0" cellspacing="0" class="table">
	<tr><td width="75" align="right">姓名：</td><td><%=r(1)%></td></tr>
    <tr><td width="75" align="right">用户名：</td><td><%=r(0)%></td></tr>
    <tr><td width="75" align="right">权限选择：</td><td><select id="qx"><option value="">请选择</option><option value="1">普通员工</option><option value="2">所有权限</option><option value="3">自定义权限</option></select></td></tr>
    <tr style="display:none;">
      <td width="75" align="right">自定义权限：</td>
      <td><input type="checkbox" id="isgg" /><label for="isgg">公告及法规</label>　<input type="checkbox" id="iszy" /><label for="iszy">网络资源</label>　<input type="checkbox" id="istxl" /><label for="istxl">通讯录</label>　<input type="checkbox" id="iskq" /><label for="iskq">考勤</label><br /><input type="radio" id="bgs" name="yj" value="0" /><label for="bgs">意见（办公室）</label><input id="jl" type="radio" name="yj" value="1" /><label for="jl">意见（经理）</label> <input type="radio" name="yj" id="my" value="2" /><label for="my">没有意见管理权限</label><br /><input type="checkbox" id="ishr" /><label for="ishr">人力资源</label>　<input type="checkbox" id="isbbs" /><label for="isbbs">讨论区</label>　<input type="checkbox" id="istp" /><label for="istp">投票</label>　<input type="checkbox" id="issys" /><label for="issys">系统管理</label><br /><input type="checkbox" id="iswl" /><label for="iswl">网络会议</label></td>
  </tr>
    <tr><td width="75" align="right">&nbsp;</td><td><input type="submit" value="确定" id="tj" class="btn" /> <input type="button" value="取消" class="btn" onclick="art.dialog.open.api.close()" /></td></tr>
</table>
</body>
</html>