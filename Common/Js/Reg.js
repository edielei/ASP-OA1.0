$(function(){
	$('#gh').focus();
	var s=$('#tj');
	s.click(function(){
		var gh=$('#gh').vd('请输入工号！');if(!gh){return}
		var uname=$('#uname').vd('请输入用户名！');if(!uname){return}
		var upwd=$('#upwd').vd('请输入密码！');if(!upwd){return}
		var upwd2=$('#upwd2').vd('请输入确认密码！');if(!upwd2){return}
		var zname=$('#zname').vd('请输入真实姓名！');if(!zname){return}
		var wt=$('#wt').vd('请输入密码问题！');if(!wt){return}
		var da=$('#da').vd('请输入密码答案！');if(!da){return}
		var email=$('#email').vd('请输入电子邮件！',1);if(!email){return}
		if(upwd!=upwd2){alert('两次输入密码不正确，请重新输入密码！');$('#upwd,#upwd2').val('').end().add('#upwd').focus();return false;}
		$.post('../C/RegC.asp', {'gh':gh,'uname':uname,'upwd':upwd,'zname':zname,'wt':wt,'da':da,'email':email},function(a){
			switch(a){
				case 'OK':alert('注册成功，请等待审核通过！');$('input:last').click();break;
				case 'Err':alert('操作失败！');location.reload();break;
				case 'ErrM':alert('电子邮件格式输入错误，请重新输入！');$('#email').select();break;
				case 'CF':alert('该用户已被注册，请勿重复注册！');$('#gh,#uname').val('');$('#gh').focus();break;
			}
		});
	});
});