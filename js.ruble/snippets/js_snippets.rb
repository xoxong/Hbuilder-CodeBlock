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

with_defaults :scope => "source.js" do #=====扩展定义JS代码块========================
#如下是一个示例代码块，可以复制后再添加新代码块
  snippet 'document.createElement()' do |s|            #document.createElement()是显示名称，代码助手提示列表显示时可见   
    s.trigger = "dc"                                   #dc是激活字符，即按下dc后会触发该代码块 
    s.expansion = "document.createElement(\"$1\")$0"   #expansion是代码块的输出内容，其中$0、$1是光标的停留和切换位置。$1是第一个停留光标，$0是最后回车时停留的光标。                        
                                                       #如果输出涉及到换行和tab，也需严格在这里使用换行和tab。                                                         
                                                       #输出双引号在前面加\来转义，输出$使用\$(单引号中)或\\$(双引号中)转义                                                                
    s.needApplyReContentAssist = true                  #这句话的意思是输出后同时激活代码助手，即在$1的位置直接拉出标签列表
  end
	
	#复制上述代码块，删除备注，在下面即可开始自定义
    
  snippet "return true;" do |s|
  s.trigger = "rtrue"
  s.expansion = "return true;"
  end
  
  snippet "return false;" do |s|
  s.trigger = "rfalse"
  s.expansion = "return false;"
  end
  
  #自定义注释第一版--------------------------------
  
  #代码块介绍 不带参数
  snippet "notes_code_不带参代码块介绍;" do |s|
  s.trigger = "notes_code",'ncode',
  s.expansion = "//codeBlockDescribe:$0"
  end
  #代码块介绍 带参数
  snippet "notes_code_带参代码块介绍;" do |s|
  s.trigger = "notes_code_data",'ncdata',
  s.expansion = "/**   
    codeBlockDescribe:$1
    data:$2  
**/"
  end
  
  
end


with_defaults :scope => "source.js", :input => :none, :output => :insert_as_snippet do |bundle|  #=====无显示名称的快捷命令=======================
=begin 
  command t(:multicomment) do |cmd| #:首先给命令命名,multicomment，该命令的目的是选中多行js后统一注释
    cmd.key_binding = 'M1+M2+/' #这里绑定触发按键，这里是Ctrl+Shift+/
    cmd.input = :selection #输入内容是选中区域的内容
    #以下是输出
    cmd.invoke do |context|
      selection = ENV['TM_SELECTED_TEXT'] || ''
      # 如果选区长度大于0，则输出如下字符。回车符就使用真实回车。如下输出即在选中内容前后加上/* */的注释
      if selection.length > 0
        "/*
${1:#{selection}}
*/"
      end
    end
  end
=end
end