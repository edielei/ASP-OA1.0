<!--#include file="../Inc/BbsCs.asp"--><%Dim id,r
id=Easp.Get("id:n:0")
r=db.RT("Tp","id="&id,"bt,xx,sl")
%><!DOCTYPE html>
<html lang="cn">
<head>
<meta name="author" content="EdieLei">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<meta charset="UTF-8">
<title>ViewTp</title>
<link rel="stylesheet" href="../Css/Inc.css">
<script src="../Js/jQuery.js"></script>
<script>
var bar = function (id,title,data){
	//展示的id
	this.id = '';
	//标题
	this.title = '';
	//数据
	this.data = '';
	//宽
	this.width = 500;	
	//背景图片位置
	this.bgimg = '../Images/plan.gif';	
	//动画速度
	this.speed = 500;
	//投票总数
	var num_all = 0;
	this.show = function (){
		//添加一个table对象
		$("#"+this.id).append("<table cellpadding=0 cellspacing=6 border=0 style='font-size:12px;' ></table>");
		$("#"+this.id+" table").append("<tr><td colspan='3' align='center' style='padding:6px 0 8px'><span style='font-size:14px;font-weight:700'>"+this.title+"</span></td></tr>");
		//计算总数
		$(this.data).each(function(i,n){num_all += parseInt(n[1]);});
		var that = this;
		//起始
		var s_img = [0,-34,-68,-102,-136,-170,-204,-238,-272,-306];  //负数，左边+34
		//中间点起始坐标
		var c_img = [-340,-357,-374,-391,-408,-425,-442,-459,-476,-493];    //负数，中间+17
		//结束
		var e_img = [-17,-51,-85,-119,-153,-187,-221,-255,-289,-323];    //负数，右边+34
		var that = this;
		var div;
		$(this.data).each(function(i,n){
			//计算比例
			var bili = (n[1]*100/num_all).toFixed(2);			
			//计算图片长度, *0.96是为了给前后图片留空间
			var img = parseFloat(bili)-2.3;	
			if(img>0){
				div = "<div style='width:3px;height:16px;background:url("+that.bgimg+") 0px "+s_img[i]+"px ;float:left;'></div><div fag='"+img+"' style='width:0%;height:16px;background:url("+that.bgimg+") 0 "+c_img[i]+"px repeat-x ;float:left;'></div><div style='width:3px;height:16px;background:url("+that.bgimg+") 0px "+e_img[i]+"px ;float:left;'></div>";
			}else{
				div='';
			}
			$("#"+that.id+" table").append("<tr><td align='right' >"+n[0]+"：</td><td width='280' bgcolor='#fffae2' >"+div+"</td><td nowrap='nowrap' align='left'>"+n[1]+"("+bili+"%)</td></tr>");
		});
		this.play();
	}
	this.play = function (){
		var that = this;		
		$("#"+this.id+" div").each(function(i,n){
			if($(n).attr('fag'))
			{
				$(n).animate( { width: $(n).attr('fag')+'%'}, that.speed )
			}
		})
	}
}
</script>
</head>
<body>
<table border="0" cellpadding="0" cellspacing="0" class="table">
	<tr>
		<th class="th">&nbsp;查看投票结果</th>
	</tr>
    <tr>
    	<td align="center"><div id="toupiao"></div></td>
    </tr>
    <tr>
    	<td align="center" style="padding:5px 0;"><input type="button" value="返回" onclick="history.back()" class="btn" /></td>
    </tr>
</table>
<script>
var data = [];
<%Dim xx,sl,i
xx=split(r(1),",")	'选项
sl=split(r(2),",")	'投票
For i=0 to UBound(xx)
%>
data[<%=i%>] = ['<%=xx(i)%>','<%=Easp.IIF(Easp.isN(sl(i)),"0",sl(i))%>'];
<%Next%>
var title = '<%Easp.WH r(0)%>';
var bar1 = new bar();
bar1.id = 'toupiao';
bar1.title = title;
bar1.data = data;
bar1.show();
</script>
</body>
</html>