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
  #自定义css属性=================
  #自定义css属性=================
  #自定义css属性=================
  
  #IE兼容css属性=================
  snippet "-IE-filter-自定义IE透明度兼容css" do |s|   
    s.trigger = "iefilter",'filter'         
    s.expansion ='filter:progid:DXImageTransform.Microsoft.gradient(startColorstr=#9F000000,endColorstr=#9F000000);'         
    s.needApplyReContentAssist = true     
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
  
  #手机rem扩展自适应代码块=================
  #手机rem扩展自适应代码块=================
  #手机rem扩展自适应代码块=================
  
  #手机750rem
  snippet "code_iphone_rem750px 手机rem扩展自适应代码块750" do |s|
    s.trigger = "code_iphone_rem750px","cirem750","手机750"
    s.locationType="CSS_OUTRULE"
    s.expansion =
'a,button,input,select{outline:none;-webkit-appearance:none;appearance:none;-moz-appearance:none}*{margin:0;padding:0}a{text-decoration:none}
ul li{list-style-type:none}@media all and (min-width: 320px){html{font-size:42.66667px !important}}@media all and (min-width: 360px){html{font-size:48px !important}}
@media all and (min-width: 375px){html{font-size:50px !important}}@media all and (min-width: 384px){html{font-size:51.2px !important}}
@media all and (min-width: 412px){html{font-size:54.93333px !important}}@media all and (min-width: 414px){html{font-size:55.2px !important}}
@media all and (min-width: 480px){html{font-size:64px !important}}@media all and (min-width: 550px){html{font-size:73.33333px !important}}
@media all and (min-width: 600px){html{font-size:80px !important}}@media all and (min-width: 640px){html{font-size:85.33333px !important}}
@media all and (min-width: 700px){html{font-size:93.33333px !important}}@media all and (min-width: 765px){html{font-size:102px !important}}
@media all and (min-width: 768px){html{font-size:102.4px !important}}@media all and (min-width: 800px){html{font-size:106.66667px !important}}
@media all and (min-width: 850px){html{font-size:113.33333px !important}}@media all and (min-width: 917px){html{font-size:122.26667px !important}}
@media all and (min-width: 1024px){html{font-size:136.53333px !important}}@media all and (min-width: 1080px){html{font-size:144px !important}}
@media all and (min-width: 1152px){html{font-size:153.6px !important}}@media all and (min-width: 1280px){html{font-size:170.66667px !important}}
@media all and (min-width: 1360px){html{font-size:181.33333px !important}}@media all and (min-width: 1366px){html{font-size:182.13333px !important}}
@media all and (min-width: 1440px){html{font-size:192px !important}}@media all and (min-width: 1550px){html{font-size:206.66667px !important}}
@media all and (min-width: 1600px){html{font-size:213.33333px !important}}@media all and (min-width: 1680px){html{font-size:224px !important}}
@media all and (min-width: 1901px){html{font-size:253.46667px !important}}@media all and (min-width: 1920px){html{font-size:256px !important}}}'
  end
  
  #手机640rem
  snippet "code_iphone_rem640px 手机rem扩展自适应代码块640" do |s|
    s.trigger = "code_iphone_rem640px","cirem640","手机640"
    s.locationType="CSS_OUTRULE"
    s.expansion =
'a,button,input,select{outline:none;-webkit-appearance:none;appearance:none;-moz-appearance:none}*{margin:0;padding:0}a{text-decoration:none}ul li{list-style-type:none}@media all and (min-width: 320px){html{font-size:50px !important}}
@media all and (min-width: 360px){html{font-size:56.25px !important}}@media all and (min-width: 375px){html{font-size:58.59375px !important}}
@media all and (min-width: 384px){html{font-size:60px !important}}@media all and (min-width: 412px){html{font-size:64.375px !important}}
@media all and (min-width: 414px){html{font-size:64.6875px !important}}@media all and (min-width: 480px){html{font-size:75px !important}}
@media all and (min-width: 550px){html{font-size:85.9375px !important}}@media all and (min-width: 600px){html{font-size:93.75px !important}}
@media all and (min-width: 640px){html{font-size:100px !important}}@media all and (min-width: 700px){html{font-size:109.375px !important}}
@media all and (min-width: 765px){html{font-size:119.53125px !important}}@media all and (min-width: 768px){html{font-size:120px !important}}
@media all and (min-width: 800px){html{font-size:125px !important}}@media all and (min-width: 850px){html{font-size:132.8125px !important}}
@media all and (min-width: 917px){html{font-size:143.28125px !important}}@media all and (min-width: 1024px){html{font-size:160px !important}}
@media all and (min-width: 1080px){html{font-size:168.75px !important}}@media all and (min-width: 1152px){html{font-size:180px !important}}
@media all and (min-width: 1280px){html{font-size:200px !important}}@media all and (min-width: 1360px){html{font-size:212.5px !important}}
@media all and (min-width: 1366px){html{font-size:213.4375px !important}}@media all and (min-width: 1440px){html{font-size:225px !important}}
@media all and (min-width: 1550px){html{font-size:242.1875px !important}}@media all and (min-width: 1600px){html{font-size:250px !important}}
@media all and (min-width: 1680px){html{font-size:262.5px !important}}@media all and (min-width: 1901px){html{font-size:297.03125px !important}}
@media all and (min-width: 1920px){html{font-size:300px !important}}'
  end
  
  #头部预定义初始化样式=================
  #头部预定义初始化样式=================
  #头部预定义初始化样式=================
  snippet "code_initialization 头部预定义初始化样式" do |s|
    s.trigger = "code_initialization","cinitialization","初始化"
    s.locationType="CSS_OUTRULE"
    s.expansion =
'a,button,input,select{outline:none;-webkit-appearance:none;appearance:none;-moz-appearance:none}
*{margin:0;padding:0}
a{text-decoration:none}
ul li{list-style-type:none}'
  end
  
  #模块代码注释=================
  #模块代码注释=================
  #模块代码注释=================
  
  #模块注释 简化版 名字
  snippet "notes_modu_name 注释：模块注释 简化版 名字 " do |s|
      s.trigger='notes_modular_name','nmn'
      s.locationType="CSS_OUTRULE"
      s.expansion='/*xb: modular name:$1 */'
  end
  
  #模块注释 模块类型 模块介绍
  snippet "notes_modu 注释：模块注释 类型 功能 介绍" do |s|
      s.trigger='notes_modular','nm'
      s.locationType="CSS_OUTRULE"
      s.expansion='/*xb:   
    type:模块 
    purpose: 
    describe:   
*/'
  end
  
  
end