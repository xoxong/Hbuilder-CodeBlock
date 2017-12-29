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

with_defaults :scope => "source.css support.type.property-name.css" do    #======扩展CSS属性代码块===================================

  snippet "-webkit-" do |s|             #引号内为显示名称，代码助手提示列表显示时可见
    s.trigger = "-wk"                   #-wk是激活字符，即按下后会触发该代码块
    s.expansion = '-webkit-$0'          #expansion是代码块的输出内容，其中$0、$1是光标的停留和切换位置。$1是第一个停留光标，$0是最后回车时停留的光标。
                                        #如果输出涉及到换行和tab，也需严格在这里使用换行和tab。
                                        #输出双引号在前面加\来转义，输出$使用\$(单引号中)或\\$(双引号中)转义
    s.needApplyReContentAssist = true   #这句话的意思是输出后同时激活代码助手，即在$1的位置直接拉出图片列表                                                                         
  end
  
end


with_defaults :scope => "source.css entity.name.tag.css" do   #======扩展CSS选择器代码块===================================
	
	snippet "@media min-max width" do |s|
    s.trigger = "@mediam"
    s.locationType="CSS_OUTRULE"
	s.expansion = '@media only screen and (min-width: ${1:100}px) and (max-width: ${2:640}px) {
	$0
}'
  end
  
end