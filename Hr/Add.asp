<!--#include file="../Inc/Cse.asp"--><!DOCTYPE html>
<html lang="cn">
<head>
<meta name="author" content="EdieLei">
<meta charset="UTF-8">
<title>Add</title>
<link rel="stylesheet" href="../Css/Inc.css">
<link rel="stylesheet" href="../Css/powerFloat.css">
<style type="text/css">
textarea{margin:2px 0;resize:none}
em{color:#F00;}
.zzmm{background:#FFF;height:20px;line-height:20px;border:1px #B7C7BE solid;}
</style>
<script src="../Js/jQuery.js"></script>
<script src="../Js/vd.js"></script>
<script src="../Js/jquery-powerFloat-min.js"></script>
<script src="../DatePicker/WdatePicker.js"></script>
<script>
$(function(){
	$('#zwid').load('jQ-zw.asp');
	$('#zzmm').powerFloat({
		offsets: {
        	x: 2,
			y: -20
		},
		eventType:'focus',
		width:100,
        target: $('.zzmm')
	});
	var s=$('#tj');
	s.click(function(){
		var gh=$('#gh').vd('请输入工号！',1);if(!gh){return}
		var rzsj=encodeURIComponent($('#rzsj').val());
		if(rzsj.length==0){alert('请输入入职时间！');$('#rzsj').select();return false;}
		var zwid=$('#zwid').vd('请选择职位！',1);if(!zwid){return}
		var zname=$('#zname').vd('请输入姓名！',1);if(!zname){return}
		var xb=$('#xb').vd('请选择性别！',1);if(!xb){return}
		var fj=encodeURIComponent($.trim($('#fj').val()));
		var ozname=encodeURIComponent($.trim($('#ozname').val()));
		var csrq=encodeURIComponent($.trim($('#csrq').val()));
		var mz=encodeURIComponent($.trim($('#mz').val()));
		var jg=encodeURIComponent($.trim($('#jg').val()));
		var zzmm=encodeURIComponent($.trim($('#zzmm').val()));
		var rtsj=encodeURIComponent($.trim($('#rtsj').val()));
		var hf=encodeURIComponent($.trim($('#hf').val()));
		var xl=encodeURIComponent($.trim($('#xl').val()));
		var xw=encodeURIComponent($.trim($('#xw').val()));
		var xz=encodeURIComponent($.trim($('#xz').val()));
		var sfzhm=encodeURIComponent($.trim($('#sfzhm').val()));
		var jk=encodeURIComponent($.trim($('#jk').val()));
		var add=encodeURIComponent($.trim($('#add').val()));
		var jtdh=encodeURIComponent($.trim($('#jtdh').val()));
		var shouji=encodeURIComponent($.trim($('#shouji').val()));
		var xxjl=encodeURIComponent($.trim($('#xxjl').val()));
		var gzjy=encodeURIComponent($.trim($('#gzjy').val()));
		var hjqk=encodeURIComponent($.trim($('#hjqk').val()));
		var zycy=encodeURIComponent($.trim($('#zycy').val()));
		var jjlxr=encodeURIComponent($.trim($('#jjlxr').val()));
		var lxdh=encodeURIComponent($.trim($('#lxdh').val()));
		var grzp=$('#grzp').contents().find('span');if(grzp.length==0){grzp=""}else{grzp=encodeURIComponent(grzp.html())}
		$.post('AddC.asp','gh='+gh+'&rzsj='+rzsj+'&zwid='+zwid+'&fj='+fj+'&zname='+zname+'&ozname='+ozname+'&xb='+xb+'&csrq='+csrq+'&mz='+mz+'&jg='+jg+'&zzmm='+zzmm+'&rtsj='+rtsj+'&hf='+hf+'&xl='+xl+'&xw='+xw+'&xz='+xz+'&sfzhm='+sfzhm+'&jk='+jk+'&grzp='+grzp+'&add='+add+'&jtdh='+jtdh+'&shouji='+shouji+'&xxjl='+xxjl+'&gzjy='+gzjy+'&hjqk='+hjqk+'&zycy='+zycy+'&jjlxr='+jjlxr+'&lxdh='+lxdh,function(a){
			switch(a){
				case 'CF':alert('此工号用户档案已添加，请勿重复添加！');break;
				case 'OK':alert('添加成功！');location.replace('Index.asp');break;
				case 'Err':alert('操作失败！');location.reload();break;
			}
		})
	});
});
//政治面貌选择
function Szzzmm(a){$('#zzmm').val(a)}
</script>
</head>
<body>
<table border="0" cellpadding="0" cellspacing="0" class="table">
	<tr><th class="th" colspan="6">&nbsp;新增员工</th></tr>
    <tr>
    	<td width="65" align="right" nowrap="nowrap" class="td">工号:</td><td class="td"><input id="gh" class="input" style="width:68px;" /> <em title="必填项">*</em></td>
<td align="right" nowrap="nowrap" class="td">入职时间:</td><td class="td"><input id="rzsj" class="input" style="width:68px;" onfocus="WdatePicker({doubleCalendar:true,minDate:'{%y-20}-%M-%d',maxDate:'%y-{%M+1}-%d'})" /> <em title="必填项">*</em></td>
<td align="right" nowrap="nowrap" class="td">职位:</td><td class="td"><select class="input" id="zwid"><option value="">请选择</option></select> <em title="必填项">*</em></td>
  </tr> 
   <tr>
   	<td width="65" align="right" nowrap="nowrap" class="td">姓名:</td>
   	<td class="td"><input id="zname" class="input" style="width:60px;" /> <em title="必填项">*</em></td>
   	<td align="right" nowrap="nowrap" class="td">曾用名:</td>
   	<td class="td"><input id="ozname" class="input" style="width:60px;" /></td>
   	<td align="right" nowrap="nowrap" class="td">性别:</td>
   	<td class="td"><select id="xb" class="input"><option value="">请选择</option><option value="男">男</option><option value="女">女</option></select> <em title="必填项">*</em></td>
  </tr>
   <tr>
     <td width="65" align="right" nowrap="nowrap" class="td">出生日期:</td>
     <td class="td"><input id="csrq" class="input" style="width:68px;" onfocus="WdatePicker({doubleCalendar:true,maxDate:'{%y-16}-%M-%d'})" /></td>
     <td align="right" nowrap="nowrap" class="td">民族:</td>
     <td class="td"><select id="mz" class="input"><option value="汉族">汉族</option><option value="回族">回族</option><option value="畲族">畲族</option><option value="塔塔尔族">塔塔尔族</option><option value="阿昌族">阿昌族</option><option value="哈萨克族">哈萨克族</option><option value="土家族">土家族</option><option value="景颇族">景颇族</option><option value="哈尼族">哈尼族</option><option value="土族">土族</option><option value="白族">白族</option><option value="维吾尔族">维吾尔族</option><option value="保安族">保安族</option><option value="赫哲族">赫哲族</option><option value="乌孜别克族">乌孜别克族</option><option value="基诺族">基诺族</option><option value="布依族">布依族</option><option value="拉祜族">拉祜族</option><option value="锡伯族">锡伯族</option><option value="黎族">黎族</option><option value="东乡族">东乡族</option><option value="蒙古族">蒙古族</option><option value="仫佬族">仫佬族</option><option value="达斡尔族">达斡尔族</option><option value="藏族">藏族</option><option value="毛南族">毛南族</option><option value="裕固族">裕固族</option><option value="俄罗斯族">俄罗斯族</option><option value="德昂族">德昂族</option><option value="僳僳族">僳僳族</option><option value="瑶族">瑶族</option><option value="朝鲜族">朝鲜族</option><option value="布朗族">布朗族</option><option value="满族">满族</option><option value="彝族">彝族</option><option value="门巴族">门巴族</option><option value="侗族">侗族</option><option value="苗族">苗族</option><option value="佤族">佤族</option><option value="羌族">羌族</option><option value="独龙族">独龙族</option><option value="怒族">怒族</option><option value="珞巴族">珞巴族</option><option value="普米族">普米族</option><option value="傣族">傣族</option><option value="纳西族">纳西族</option><option value="高山族">高山族</option><option value="壮族">壮族</option><option value="额伦春族">额伦春族</option><option value="塔吉克族">塔吉克族</option><option value="京族">京族</option><option value="仡佬族">仡佬族</option><option value="鄂温克族">鄂温克族</option><option value="撒拉族">撒拉族</option><option value="柯尔克孜族">柯尔克孜族</option><option value="水族">水族</option></select></td>
     <td align="right" nowrap="nowrap" class="td">籍贯:</td>
     <td class="td"><input id="jg" class="input" style="width:110px;" /></td>
  </tr>
   <tr>
   	<td width="65" align="right" nowrap="nowrap" class="td">政治面貌:</td><td class="td"><input id="zzmm" class="input" style="width:60px;" readonly="readonly" /></td>
   	<td align="right" nowrap="nowrap" class="td">入党/团时间:</td>
   	<td class="td"><input id="rtsj" class="input" style="width:68px;" onfocus="WdatePicker({doubleCalendar:true})" /></td>
   	<td align="right" nowrap="nowrap" class="td">婚否:</td><td class="td"><input id="hf" class="input" style="width:50px;" /></td>
  </tr>
   <tr>
   	<td width="65" align="right" nowrap="nowrap" class="td">学历:</td><td class="td"><select id="xl" class="input"><option value="">请选择</option><option value="小学">小学</option> <option value="初中">初中</option><option value="高中">高中</option><option value="中专">中专</option> <option value="大专">大专</option> <option value="本科">本科</option> <option value="硕士">硕士</option> <option value="博士">博士</option> <option value="博士后">博士后</option></select></td>
   	<td align="right" nowrap="nowrap" class="td">学位:</td><td class="td"><input id="xw" class="input" style="width:60px;" /></td>
   	<td align="right" nowrap="nowrap" class="td">学制:</td><td class="td"><input id="xz" class="input" style="width:50px;" /></td>
  </tr>
   <tr>
     <td width="65" align="right" nowrap="nowrap" class="td">身份证号码:</td>
     <td class="td"><input id="sfzhm" class="input" style="width:138px;" /></td><td align="right" class="td">分机:</td><td class="td"><input id="fj" class="input" style="width:68px;" /></td>
     <td align="right" nowrap="nowrap" class="td">健康情况:</td>
     <td class="td"><input id="jk" class="input" style="width:50px;" /></td>
  </tr>
   <tr>
     <td align="right" nowrap="nowrap" class="td">个人照片:</td>
     <td colspan="5" class="td"><iframe id="grzp" src="../C/UpT.asp" frameborder="0" height="24" width="400"></iframe></td>
   </tr>
   <tr>
     <td width="65" align="right" nowrap="nowrap" class="td">家庭住址:</td>
     <td colspan="5" class="td"><input id="add" class="input" style="width:100%;" /></td>
  </tr>
   <tr>
     <td width="65" align="right" nowrap="nowrap" class="td">家庭电话:</td>
     <td colspan="3" class="td"><input id="jtdh" class="input" style="width:100%;" /></td>
     <td align="right" nowrap="nowrap" class="td">手机:</td>
     <td class="td"><input id="shouji" class="input" style="width:100%;" /></td>
  </tr>
   <tr>
     <td width="65" align="right" nowrap="nowrap" class="td">学习经历:</td>
     <td colspan="5" class="td"><textarea id="xxjl" class="input" style="width:100%;height:50px;"></textarea></td>
  </tr>
   <tr>
     <td width="65" align="right" nowrap="nowrap" class="td">工作经验:</td>
     <td colspan="5" class="td"><textarea class="input" id="gzjy" style="width:100%;height:50px;"></textarea></td>
  </tr>
   <tr>
     <td width="65" align="right" nowrap="nowrap" class="td">获奖情况:</td>
     <td colspan="5" class="td"><textarea class="input" id="hjqk" style="width:100%;height:50px;"></textarea></td>
  </tr>
   <tr>
     <td width="65" align="right" nowrap="nowrap" class="td">家庭&nbsp;&nbsp;&nbsp;&nbsp;<br />主要成员:</td>
     <td colspan="5" class="td"><textarea class="input" id="zycy" style="width:100%;height:50px;"></textarea></td>
  </tr>
   <tr>
     <td width="65" align="right" nowrap="nowrap" class="td"> 紧急联系人:</td>
     <td colspan="3" class="td"><input id="jjlxr" class="input" style="width:100%;" /></td>
     <td align="right" nowrap="nowrap" class="td">&nbsp;联系电话:</td>
     <td class="td"><input id="lxdh" class="input" style="width:100%;" /></td>
  </tr>
   <tr>
     <td height="30" align="right" valign="top">&nbsp;</td>
     <td height="30" colspan="5" valign="top" style="padding:2px"><input id="tj" type="submit" value="确定" class="btn" /> <input type="button" value="取消" class="btn" onclick="history.back()" /></td>
   </tr>   
</table>
<div class="zzmm" style="display:none;"><a href="javascript:Szzzmm('群众');">群众</a>&nbsp;&nbsp;<a href="javascript:Szzzmm('团员');">团员</a>&nbsp;&nbsp;<a href="javascript:Szzzmm('党员');">党员</a></div>
</body>
</html>