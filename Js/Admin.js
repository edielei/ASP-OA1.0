$(function(){
	var w=$(window),c=$('#center'),ms=$('#main');
    c.height(w.height()-95);
	ms.height(w.height()-171);
	w.resize(function(){
        c.height(w.height()-95);
		ms.height(w.height()-171);
    });
	loadmails();
	loadbbs();
	window.setInterval(loadmails,15000);
	window.setInterval(loadbbs,20000);
	function loadbbs(){
		$('#bbs').load('../Common/ZxTz.asp?'+$.now());
	}
	function loadmails(){
		$('#mails').load('../Common/ZxMails.asp?'+$.now());
	}
	
	//个人小图标事件
	$('.tcenter img').powerFloat({
		eventType: "click",
    	width: 90,
    	target: [
			{href: "javascript:EditZl();", text:"修改联系方式"},
			{href: "javascript:Editwt();", text:"修改密码问题"}
    	],
    	targetMode: "list"	
	});
	
	/* 菜单效果 */
	$('#menus').delegate('h3','click',function(){
		if($(this).next('span:visible').length){
            $(this).nextAll('span').hide();
		}
		else{
            $(this).siblings('span').hide();
			$(this).nextUntil('h3').css('display','block');
		}
    });
	
	
	/* 左侧菜单显示或隐藏 */
    $('.sq').toggle(function(){
		$('.cc').css('margin-left',7).end().add('.cl').css('margin-left','-161px');
    },function(){
		$('.cc').css('margin-left','168px').end().add('.cl').css('margin-left',0);
	});
	//日期双击
	$('.sj').dblclick(function(){Wnl();});
	var menushtml=$('#menus').html();
	$('a[href="Main.asp"]').click(function(){$('#menus').html(menushtml)});
	$('a[href="Hr"]').click(function(){Menus('Hr.html')});
	$('a[href="BBS"]').click(function(){Menus('BBS.asp')});
	$('a[href="Office"]').click(function(){Menus('Office.asp')});
	$('a[href="Mails"]').click(function(){Menus('Email.asp')});
	$('a[href="Manager"]').click(function(){Menus('Manager.html')});
});

//菜单加载函数
function Menus(a){$('#menus').load('Inc/'+a);}

//修改用户密码问题及答案
function Editwt(){art.dialog.open('Common/EditWt.asp',{id:'editmmwt',title:'修改密码问题',height:80,width:280,lock:true,duration:0,resize:false});}

//退出登录
function Exit(){
	art.dialog({id:'exit',icon:'question',content:'你确定要退出吗？',resize:false,duration:0,lock:true,
		ok:function(){$.post("C/Exit.asp",function(){location.replace('/')});},
		cancel:true
	});
}
//工作日程
function gzjh(date){
	$.post('C/Gzjh.asp','sj='+encodeURIComponent(date),function(a){
		switch(a){
			case 'OK':Menus('Office.asp');$('#mkj').attr('src','Office/GzjhSj.asp?date='+date);break;
			case 'No':art.dialog({id:'gzjh',icon:'question',content:'<span style="color:#F00;font-family:Tahoma;font-weight:700">'+date+' </span>无工作计划，是否填写计划？',lock:true,duration:0,okVal:'是',cancelVal:'否',cancel:true,ok:function(){
				Menus('Office.asp');
				$('#mkj').attr('src','Office/Index.asp');
				art.dialog.open('Office/AddGzjh.asp?date='+date,{id:'addgzjh',title:'新建工作计划',lock:true,duration:0,resize:false});
			}});break;
		}
	});
}
//修改个人资料
function EditZl(){
	art.dialog.open('C/EditLx.asp',{id:'EditLx',title:'修改联系方式',lock:true,resize:false,duration:0});
}
//邮件设置
function emailsz(){art.dialog.open('Common/EmailSet.asp',{id:'emailsz',title:'邮件设置',lock:true,resize:false,duration:0,height:110});}
//万年历
function Wnl(){art.dialog.open('Common/WNL.html',{id:'wnldg',title:'万年历',width:552,height:428,padding:0,resize:false});}
//邮编查询
function ybcx(){art.dialog.open('Common/Yb.html',{id:'ybcx',title:'邮编查询',width:600,height:240,padding:0,resize:false});}
//外出登记
function kqwc(){art.dialog.open('../KaoQin/Wcdj.asp',{id:'kqwc',title:'外出登记',duration:0,lock:true,resize:false});}
//请假登记
function kqqj(){art.dialog.open('../KaoQin/Qjdj.asp',{id:'kqqj',title:'请假登记',duration:0,lock:true,resize:false});}
//出差登记
function kqcc(){art.dialog.open('../KaoQin/Ccdj.asp',{id:'kqcc',title:'出差登记',duration:0,lock:true,resize:false});}