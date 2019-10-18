/* 
 * 验证不能为空的
 * $('object').vd('It's Empty!');  //$('object').val();
 * $('object').vd('It's Empty!',1); //encodeURIComponent → $('object').val();
 */
(function(a){
    if(a.vd)return!1;
	a.fn.vd=function(b,c){
		var d=!0;
		a(this).each(function(){
			if(1==c)
			    var f=encodeURIComponent(a.trim(a(this).val()));
			else
			    var f=a.trim(a(this).val());
			if(0==f.length){
				alert(b),a(this).focus(),d=!1;return!1
			}
			d=f
		});
		return d
	}
})(jQuery)