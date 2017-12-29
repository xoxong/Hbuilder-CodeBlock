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
  s.trigger = 'plugin'
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

end # source.js
