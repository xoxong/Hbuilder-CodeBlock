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
    cmd.trigger = 'divc','dc'        #divc是激活字符，即按下divc后会触发该代码块
    cmd.expansion = "<div class=\"$1\">
	$0
</div>"                         #expansion是代码块的输出内容，其中$0、$1是光标的停留和切换位置。$1是第一个停留光标，$0是最后回车时停留的光标。
													      #如果输出涉及到换行和tab，也需严格在这里使用换行和tab。
													      #输出双引号在前面加\来转义，输出$使用\$(单引号中)或\\$(双引号中)转义
    cmd.needApplyReContentAssist = true  #这句话的意思是输出后同时激活代码助手，即在$1的位置直接拉出样式列表
  end #div_class代码块结束
  
  snippet 'ng-pluralize' do |cmd|
    cmd.trigger = 'ngp'
    cmd.expansion = "<ng-pluralize>$1</ng-pluralize>"
  end
  
  #自定义代码  xmibear
#------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  #注释部分--------------------------------------------------------------------------------------------------------------------------------
  #注释部分--------------------------------------------------------------------------------------------------------------------------------
  #注释部分--------------------------------------------------------------------------------------------------------------------------------
  #表单注释
  snippet 'notes_form #注释：表单注释' do |cmd|
      cmd.trigger='notes_form','nf'
      cmd.expansion="<!--xb:   
    type:表单 form$1   
    describe:$0   
-->"
      cmd.needApplyReContentAssist = true
  end
  #模块注释 简化版 名字
  snippet 'notes_modu_name #注释：模块注释 简化版 名字 ' do |cmd|
      cmd.trigger='notes_modular_name','nmn'
      cmd.expansion="<!--xb: modularName:$1 -->"
      cmd.needApplyReContentAssist = true
  end
   #模块注释 模块类型 模块介绍
  snippet 'notes_modu #注释：模块注释 类型 功能 介绍' do |cmd|
      cmd.trigger='notes_modular','nm'
      cmd.expansion="<!--xb:   
    type:模块 $1
    purpose:$2 
    describe:$0   
-->"
      cmd.needApplyReContentAssist = true
  end
  
  #公司署名注释第一版--------------------------------
  #公司署名注释第一版--------------------------------
  snippet 'notes_company #公司注释 署名 作者 时间  简介 备注  ' do |cmd|
      cmd.trigger='notes_company','nc'
      cmd.expansion="<!--xb:   
    company name:$1
    author      :$2
    time        :$3 
    remarks     :$0   
-->"
      cmd.needApplyReContentAssist = true
  end
  
  #javascript css 版本注释--------------------------------
  snippet 'notes_company2 #版本注释 类型 介绍  ' do |cmd|
      cmd.trigger='notes_import','nimport'
      cmd.expansion="<!--xb:   type:$1  describe:$0   -->"
      cmd.needApplyReContentAssist = true
  end
   #------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  #代码块 手机端头部声明--------------------------------------------------------------------------------------------------------------------------------
  #代码块 手机端头部声明--------------------------------------------------------------------------------------------------------------------------------
  #代码块 手机端头部声明--------------------------------------------------------------------------------------------------------------------------------
  snippet 'code_meta_iphone #手机meta声明 类 ' do |cmd|
      cmd.trigger='code_meta_iphone','cmetai','手机头部声明'
      cmd.expansion='<!--xb:IE=edge告诉IE使用最新的引擎渲染网页，chrome=1则可以激活Chrome Frame -->
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<!--在iPhone的浏览器中页面将以原始大小显示，并不允许缩放。  -->
<meta name="viewport" content="width=device-width,height=device-height,inital-scale=1.0,maximum-scale=1.0,user-scalable=no;">
<!--开启对web app程序的支持 删除默认的苹果工具栏和菜单栏，开启全屏显示-->
<meta name="apple-mobile-web-app-capable" content="yes">
<!--在 web app 应用下状态条（屏幕顶部条）的颜色-->
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<!--忽略页面中的数字,邮箱,地址识别为电话号码-->
<meta name="format-detection" content="telephone=no,email=no,adress=no">'
      cmd.needApplyReContentAssist = true
  end
  
 #------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  #代码块 html 常用标签模板--------------------------------------------------------------------------------------------------------------------------------
  #代码块 html 常用标签模板--------------------------------------------------------------------------------------------------------------------------------
  #代码块 html 常用标签模板--------------------------------------------------------------------------------------------------------------------------------
  snippet 'code_a_windowOpen #常用a标签点击跳转 ' do |cmd|
      cmd.trigger='code_a_window_open','cawo','a跳转'
      cmd.expansion='<a onclick="window.open(\'$1\')">$0</a>'
      cmd.needApplyReContentAssist = true
  end
  
  snippet 'code_button_formsubmit #表单常用按钮submit' do |cmd|
      cmd.trigger='code_button_formsubmit','formsubmit','submit'
      cmd.expansion='<!-- modularName:表单提交按钮 -->
<button class="form_submit" onclick="FunFormSubmit()"></button>
<input type="button" name="submit" id="submit" value="提交" class="form_submit"/>'
      cmd.needApplyReContentAssist = true
  end
  
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
