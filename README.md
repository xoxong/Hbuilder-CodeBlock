<<<<<<< HEAD
<<<<<<< HEAD
# Hbuilder-CodeBlock
#Most code snippets are likely to be used, and we should be independent
We can use the extension code blocks of the Hbuilder to store common code blocks



#html.ruble

require 'ruble'
=begin
HBuilder可使用ruby脚本来扩展代码块和增强操作命令。这是极客的神奇玩具。

  本文档用于用户自定义HTML扩展命令，并非HBuilder预置命令的文档，预置的代码块不可改。查阅预置代码块，请在弹出预置代码块界面时点右下角的编辑按钮，比如div代码块。
  本文档修改完毕，保存即可生效。
  玩的愉快，别玩坏！

  脚本开源地址 https://github.com/dcloudio/HBuilderRubyBundle
  可以把你的配置共享到这里，也可以在这里获取其他网友的版本
  
  注：如果1.9版本之前的用户修改过HTML代码块，请点右键打开本文档所在目录，找之前的snippets.rb.bak文件，把修改过的内容放置进来。 
=end

  with_defaults :scope => 'text.html text' do |bundle|  #=====HTML标签代码块================================================================================

#如下是一个示例代码块，可以复制后再添加新代码块

  snippet 'div_class' do |cmd|  #div_class是显示名称，代码助手提示列表显示时可见
    cmd.trigger = 'divc'        #divc是激活字符，即按下divc后会触发该代码块
    cmd.expansion = "<div class=\"$1\">
	$0</div>" #expansion是代码块的输出内容，其中$0、$1是光标的停留和切换位置。$1是第一个停留光标，$0是最后回车时停留的光标。
			  #如果输出涉及到换行和tab，也需严格在这里使用换行和tab。
			  #输出双引号在前面加\来转义，输出$使用\$(单引号中)或\\$(双引号中)转义
    cmd.needApplyReContentAssist = true  #这句话的意思是输出后同时激活代码助手，即在$1的位置直接拉出样式列表

  end #div_class代码块结束
  
  snippet 'ng-pluralize' do |cmd|
    cmd.trigger = 'ngp'
    cmd.expansion = "<ng-pluralize>$1</ng-pluralize>"
  end


  with_defaults :scope => 'text.html entity.other.attribute-name.html' do |bundle|  #=====HTML属性代码块====================================================

#如下是一个示例代码块，可以复制后再添加新代码块

  snippet 'ng-' do |s|   #ng-是显示名称，代码助手提示列表显示时可见
    s.trigger = 'ng-'		 #ng-是激活字符，即按下ng-后会触发该代码块
    s.expansion='ng-${1:app/bind/bind-html/bind-template/blur/change/checked/class/class-even/class-odd/click/cloak/controller/copy/csp/cut/dblclick/disabled/focus/hide/href/if/include/init/keydown/keypress/keyup/list/model/mousedown/mouseenter/mouseleave/mousemove/mouseover/mouseup/ng-non-bindable/open/options/paste/readonly/repeat-start/repeat-end/selected/show/src/srcset/style/submit/swipe-left/swipe-right/switch/switch-default/switch-when/view}="$2"'
		#expansion是代码块的输出内容，其中$0、$1是光标的停留和切换位置。
	   #$1是第一个停留光标，$0是最后回车时停留的光标。
	   #使用{}包围的内容，是提示值域。
	   #如果输出涉及到换行和tab，也需严格在这里使用换行和tab。
	   #输出双引号在前面加\来转义，输出$使用\$(单引号中)或\\$(双引号中)转义
    s.locationType='HTML_ATTRIBUTE'

  end #ng代码块结束

end


with_defaults :scope => 'text.html - source', :input => :none, :output => :insert_as_snippet do |bundle|  #=====无显示名称的快捷命令=======================
=begin

如下示例均为系统已经预置的命令，无需重复制作

示例1 Ctrl+Enter输出<br />

  command t(:quick_br) do |cmd|
    cmd.key_binding = 'M2+ENTER'
    cmd.output = :insert_as_snippet
    cmd.input = :none
    cmd.invoke { "<br />" }
  end

示例2 Ctrl+9为选中文字添加包围标签

  command t(:wrap_selection_in_tag_pair) do |cmd|
    cmd.key_binding = "CONTROL+9"
    cmd.input = :selection
    cmd.invoke do |context|
      selection = ENV['TM_SELECTED_TEXT'] || ''
      if selection.length > 0
        "<${1:p}>#{selection.gsub('/', '\/')}</${1:p}>"
      else
        "<${1:p}>$0</${1:p}>"
      end
    end
  end
=end

#可复制一段命令，在下面开始制作新命令
  
end



#css.ruble

require 'ruble'
=begin 

 HBuilder可使用ruby脚本来扩展代码块和增强操作命令。这是极客的神奇玩具。
  本文档用于用户自定义css扩展命令，并非HBuilder预置命令的文档，预置的代码块不可改。查阅预置代码块，请在弹出预置代码块界面时点右下角的编辑按钮，比如dn代码块。
  本文档修改完毕，保存即可生效。
  玩的愉快，别玩坏！
  
  脚本开源地址 https://github.com/dcloudio/HBuilderRubyBundle
  可以把你的配置共享到这里，也可以在这里获取其他网友的版本
  
  注：如果1.9版本之前的用户修改过HTML代码块，请点右键打开本文档所在目录，找之前的snippets.rb.bak文件，把修改过的内容放置进来。 
=end

with_defaults :scope => "source.css support.type.property-name.css" do    #======扩展CSS属性代码块

  snippet "-webkit-" do |s|             
    s.trigger = "-wk"                   
    s.expansion = '-webkit-$0'                                        
    s.needApplyReContentAssist = true                                                                       
  end

  #引号内为显示名称，代码助手提示列表显示时可见
  #-wk是激活字符，即按下后会触发该代码块
  #expansion是代码块的输出内容，其中$0、$1是光标的停留和切换位置。$1是第一个停留光标，$0是最后回车时停留的光标。
  #输出双引号在前面加\来转义，输出$使用\$(单引号中)或\\$(双引号中)转义
  #如果输出涉及到换行和tab，也需严格在这里使用换行和tab。
  #(s.needApplyReContentAssist = true )这句话的意思是输出后同时激活代码助手，即在$1的位置直接拉出图片列表     
end


with_defaults :scope => "source.css entity.name.tag.css" do   #======扩展CSS选择器代码块
	
	snippet "@media min-max width" do |s|
    s.trigger = "@mediam"
    s.locationType="CSS_OUTRULE"
	s.expansion = '@media only screen and (min-width: ${1:100}px) and (max-width: ${2:640}px) {
	$0
}'
  end
  
end


#js.ruble
require 'ruble'
=begin 

 HBuilder可使用ruby脚本来扩展代码块和增强操作命令。这是极客的神奇玩具。
  本文档用于用户自定义JS扩展命令，并非HBuilder预置命令的文档，预置的代码块不可改。查阅预置代码块，请在弹出预置代码块界面时点右下角的编辑按钮，比如dw代码块。
  本文档修改完毕，保存即可生效。
  玩的愉快，别玩坏！
  
  脚本开源地址 https://github.com/dcloudio/HBuilderRubyBundle
  可以把你的配置共享到这里，也可以在这里获取其他网友的版本
  
  注：如果1.9版本之前的用户修改过代码块，请点右键打开本文档所在目录，找之前的snippets.rb.bak文件，把修改过的内容放置进来。 
=end

with_defaults :scope => "source.js" do #=====扩展定义JS代码块

如下是一个示例代码块，可以复制后再添加新代码块

  snippet 'document.createElement()' do |s|            
    s.trigger = "dc"                                   
    s.expansion = "document.createElement(\"$1\")$0"                                                                                                                                       
    s.needApplyReContentAssist = true                  
  end

  #document.createElement()是显示名称，代码助手提示列表显示时可见   
  #dc是激活字符，即按下dc后会触发该代码块 
  #expansion是代码块的输出内容，其中$0、$1是光标的停留和切换位置。$1是第一个停留光标，$0是最后回车时停留的光标。 
  #如果输出涉及到换行和tab，也需严格在这里使用换行和tab。    
  #输出双引号在前面加\来转义，输出$使用\$(单引号中)或\\$(双引号中)转义  
  #这句话的意思是输出后同时激活代码助手，即在$1的位置直接拉出标签列表 
	
  复制上述代码块，删除备注，在下面即可开始自定义
    
  snippet "return true;" do |s|
  s.trigger = "rtrue"
  s.expansion = "return true;"
  end
  
  snippet "return false;" do |s|
  s.trigger = "rfalse"
  s.expansion = "return false;"
  end

=======
=======

#Hbuilder码块

Most code snippets are likely to be used, and we should be independent
We can use the extension code blocks of the Hbuilder to store common code blocks
