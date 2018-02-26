require 'ruble'
=begin 
 HBuilder可使用ruby脚本来扩展代码块和增强操作命令。这是极客的神奇玩具。
  本文档用于用户自定义JQUERY扩展命令，并非HBuilder预置命令的文档，预置的代码块不可改。查阅预置代码块，请在弹出预置代码块界面时点右下角的编辑按钮，比如$.ajax代码块。
  本文档修改完毕，保存即可生效。
  玩的愉快，别玩坏！
  
  脚本开源地址 https://github.com/dcloudio/HBuilderRubyBundle
  可以把你的配置共享到这里，也可以在这里获取其他网友的版本
  
  注：如果1.9版本之前的用户修改过代码块，请点右键打开本文档所在目录，找之前的snippets.rb.bak文件，把修改过的内容放置进来。 
=end


with_defaults :scope => 'source.js' do

snippet '$.each' do |s|                                       #$.each是显示名称，代码助手提示列表显示时可见                                
  s.trigger = '$.each'                                        #$.each是激活字符，即按下$.each后会触发该代码块                                                      
  s.expansion = '\$.each(${1:array/object}, function($2) {
	$0
});'                                                          
                                                              #expansion是代码块的输出内容，其中$0、$1是光标的停留和切换位置。$1是第一个停留光标，$0是最后回车时停留的光标。                                                 
                                                              #如果输出涉及到换行和tab，也需严格在这里使用换行和tab。                                                                                                                           
                                                              #输出双引号在前面加\来转义，输出$使用\$(单引号中)或\\$(双引号中)转义
end

snippet '$.extend' do |s|
  s.trigger = '$.extend'
  s.expansion = '\$.extend(${1:true, }${2:target object}, ${3:object1});'
end

snippet '$.map' do |s|
  s.trigger = '$.map'
  s.expansion = '\$.map(${1:array}, function($2) {
	$0
});'
end

snippet t(:plugin_animation) do |s|
  s.trigger = '$.plugin'
  s.expansion = 'jQuery.fn.${1:myeffect} = function(speed, easing, callback) {
	return this.animate({${2:param1}: ${3:\'value\'}}, speed, easing, callback);
};'
end

snippet t(:plugin_selector) do |s|
  s.trigger = 'plugin'
  s.expansion = '(function(\$) {
	\$.extend(\$.expr[\':\'], {
		${1:selectorName}: function(element, index, matches, set) {
			$0
			return something;
		}
	});
})(jQuery);
'
end

snippet t(:plugin_method) do |s|
  s.trigger = 'plugin'
  s.expansion = ';(function(\$) {
${2:// ${3:What does the $1 plugin do?}}
\$.fn.${1:pluginName} = function(options) {
	var opts = \$.extend({}, \$.fn.$1.defaults, options);

	return this.each(function() {
		var \$this = \$(this);

	${5:  ${6:// Support for the Metadata Plugin.}
		var o = \$.meta ? \$.extend({\}, opts, \$this.data()) : opts;
	}

	});

	// private function for debugging
	function debug(\$obj) {
		if (window.console && window.console.log) {
			window.console.log(\$obj);
		}
	}
};

// default options
\$.fn.$1.defaults = {
	${4:defaultOne:true,
	defaultTwo:false,
	defaultThree:\'yay!\'}
};

})(jQuery);
'
end

 #------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  #代码块 jQuery 常用代码模板--------------------------------------------------------------------------------------------------------------------------------
  #代码块 jQuery 常用代码模板-------------------------------------------------------------------------------------------------------------------------------
  #代码块 jQuery 常用代码模板--------------------------------------------------------------------------------------------------------------------------------
    
    
  #正则表达式 常用下拉
  snippet '$.RegExp_s 正则表达式 常用下拉' do |s|
  s.trigger = '$regexp','$re','正则表达式'
  s.expansion = 'var telMeg =${1:公司常用手机验证\/^0?1[3|4|5|8|7][0-9]\d{8\}\$\//手机验证\/^1[3|4|5|8|7][0-9]\d{8\}\$\/};'
end

  #动画跳转到顶部
  snippet '$.scrollTop 动画跳转到顶部' do |s|
  s.trigger = '$code_scrolltop','$scrolltop','跳转顶部'
  s.expansion = '\$("${1:body,html}").animate({scrollTop:\$("$0").offset().top},500)'
end
  
  #字体轮播上下滚动
  snippet '$.fontCarousel 字体轮播上下滚动' do |s|
  s.trigger = '$code_fontCarousel','$fontCarousel','字体轮播上下滚动'
  s.expansion = 'setInterval(FunFontCarousel, 1000)
function FunFontCarousel() {
    //codeBlockDescribe:添加动画效果
    //codeBlockDescribe:动态移动
    //类名为ul
    \$("$1").animate({
        "margin-top": "-$2px"
    }, function() {
        \$("$3 :eq()").appendTo(\$("$4"))

        \$("$5").css({
            "margin-top": "$6px"
        })
    })
}'
end

  #表单提交默认模板 
  snippet '$.formPost 表单提交默认模板 获取 判断 提交 返回' do |s|
  s.trigger = '$code_formpost','$formpost','表单提交'
  s.expansion = '//codeBlockDescribe:表单提交
function FunFormSubmit(){
    //codeBlockDescribe:获取表格内容
    var city=\$("select[name=diqu]").val();
    var name=\$("input[name=name]").val();
    var iphone=\$("input[name=iphone]").val();
    var xiaoqu=\$("input[name=xiaoqu]").val();
    var styles=\$("select[name=style]").val();
    //codeBlockDescribe:判断是否为空
    if(name.length<1){
       alert("称呼不能为空")
       return ;
    }
    var telMeg = /^0?1[3|4|5|8][0-9]\d{8}\$/;
    if (iphone != "") {
       if (!telMeg.test(iphone)) {
           alert("联系方式格式有误");
           return ;
       }
    } else {
       alert("手机号不能为空");
       return false;
    }
    \$.post("$1",{name:name,$2},function (result) {
       if(result.code == 200){
          
       }else{
           
       }
    })
}'
end

  #定时计算时间差然后改变数字
  snippet '$.timedifference 时间差改变数据' do |s|
  s.trigger = '$timedifference','时间差'
  s.expansion = 'function m5_theNumberOf() {
    //codeBlockDescribe:每日增加的个数
    var day_addnum=50;
    //codeBlockDescribe:时间差，比如每天只有13个小时计算
    var day_timeDif=13;
    //codeBlockDescribe:基数，最少的基数
    var BeginNum=0;
    var m5_newdate= new Date();
    var m5_Hours=m5_newdate.getHours(); //当前小时
    var m5_newday = m5_newdate.getDate(); //当前天
    var m5_newMonth = m5_newdate.getMonth()+1; //当前月
    var m5_time_start = m5_newdate.getTime();
    //设定目标时间，然后计算当前时间到起始时间之间的时间差
    var m5_time_end = new Date("2018/1/13 10:00:00").getTime(); 
    // 计算时间差 
    var m5_time_distance = m5_time_start-m5_time_end;
    // 天
    var int_day = Math.floor(m5_time_distance / 86400000)
    m5_time_distance -= int_day * 86400000;
    // 时
    var int_hour = Math.floor(m5_time_distance / 3600000)
    m5_time_distance -= int_hour * 3600000;
    // 分
    var int_minute = Math.floor(m5_time_distance / 60000)
    m5_time_distance -= int_minute * 60000;
    // 秒 
    var int_second = Math.floor(m5_time_distance / 1000)
    //只在10点到22点之间增加值
    if(m5_Hours>=10&&m5_Hours<=22){
        //计算每天没小时每分钟没秒增加数目
        var numa=Math.floor(Number(int_day*day_addnum)+Number(int_hour*(day_addnum/day_timeDif))+Number(int_minute*(day_addnum/day_timeDif/60))+Number(int_second*(day_addnum/day_timeDif/60/60)));
        console.log(Number(int_day*day_addnum)+Number(int_hour*(day_addnum/day_timeDif))+Number(int_minute*(day_addnum/day_timeDif/60))+Number(int_second*(day_addnum/day_timeDif/60/60)));
        \$("$1").text(numa+BeginNum);
    }
    else if(m5_Hours<10){
        \$("$1").text(Number(int_day)*day_addnum+BeginNum);
    }
    else if(m5_Hours>22){
        \$("$1").text(Number(int_day+1)*day_addnum+BeginNum);
    }
}
setInterval(m5_theNumberOf,1000);'
end

#动态添加客户信息
  snippet '$.dynamicInfo 动态添加客户信息' do |s|
  s.trigger = '$code_info','$info','添加客户信息'
  s.expansion = "XBFunDynamicInfor();
    function XBFunDynamicInfor(){
        //姓氏变量
        var xb_surName='李王张刘陈杨赵黄周吴徐孙胡朱高林何郭马罗梁宋郑谢韩唐冯于董萧程曹袁邓许傅沈曾彭吕苏卢蒋蔡贾丁魏薛叶阎余潘杜戴夏钟汪田任姜范方石姚谭廖邹熊金陆郝孔白崔康毛邱秦江史顾侯邵孟龙万段漕钱汤尹黎易常武乔贺赖龚文';
        //尊称
        var xb_nickName=['先生','女士'];
        //手机号码
        var iphoneNum='34578'
        //随机数 Math.floor(Math.random()*10+1)
        function xbsuiji(num1,num2){return Math.floor(Math.random()*num1+num2);}
        //以下部分为添加html内容
        var xbi=0
        while (xbi<30){
         \\$('$1').append(\"<li><img src='modular_gai/m_xb_img_30.png''alt='' /><span>\"+xb_surName[xbsuiji(100,0)]+\"\"+xb_nickName[xbsuiji(2,0)]+\"成功报价</span><span>1\"+iphoneNum[xbsuiji(5,0)]+\"\"+xbsuiji(10,0)+\"*****\"+xbsuiji(899,100)+\"</span><span>面积\"+xbsuiji(110,80)+\"</span></li>\");
         xbi++;
          }
    }"
end


  

end # source.js
