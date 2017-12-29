=begin 
  本文档是php代码块的编辑文件。
 HBuilder可使用ruby脚本来编辑代码块和增强操作命令。
  编辑代码块：
  如果要新增一个代码块，复制如下一段代码到空白行，然后设定参数。
  'Style'是代码块的显示名字；
  s.trigger = 'style' 是设定激活字符，比如输入style均会在代码提示时显示该代码块；
  s.expansion = '' 是设定该代码块的输出字符，其中$0、$1是光标的停留和切换位置。
  snippet 'Style' do |s|
    s.trigger = 'style'
    s.expansion = '<style type="text/css" media="screen">
  	$0
  </style>'
  end
  以上以HTML代码块做示例，其他代码块类似，使用时注意避免混淆
  
  操作时注意冲突，注意备份，有问题就还原。
  多看看已经写的ruby命令，会发现更多强大技巧。
  修改完毕，无需重启，自动生效。
  玩的愉快，别玩坏！
  
  注：如果1.9版本之前的用户修改过PHP代码块，请打开本文档目录，找之前的snippets.rb.bak文件，把修改过的内容放置进来，
  只需合并一次即可，如有疑问请联系管理员（QQ群：363040810）。
=end

#======begin======扩展定义PHP代码块============
with_defaults :scope => 'source.php' do
=begin   
  示例：
  snippet 'function ...' do |s|
    s.trigger = 'fun'
  s.expansion = '${1:public }function ${2:functionName}(\$${3:value}${4:=\'\'})
{
	${0:// code...}
}'
  end
  snippet 'while ...' do |s|
    s.trigger = 'while'
    s.expansion = 'while (${1:$a <= 10}) {
	${0:// code...}
}'
  end
=end
#从这里开始自定义
  snippet "$GLOBALS['...']" do |s|
    s.trigger = 'globals'
    s.expansion = '\$GLOBALS[\'${1:variable}\']${2: = }${3:something}${4:;}$0'
  end
  
end #======end======扩展定义PHP代码块结束============

#======begin======扩展定义PHP中html代码块============
with_defaults :scope => 'meta.project.com.aptana.editor.php.phpNature meta.project.com.aptana.projects.webnature text.html.basic - source' do
=begin   
  示例：
  snippet '<?php ... ?>' do |s|
    s.trigger = 'php'
    s.expansion = '<?${TM_PHP_OPEN_TAG:php} $0 ?>'
  end
=end
 #从这里开始自定义
 
end #======end======扩展定义PHP中html代码块结束============
