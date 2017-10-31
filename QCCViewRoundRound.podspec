Pod::Spec.new do |s|
s.name     = 'QCCViewRoundRound'
s.version  = '0.0.1'
s.license  = "MIT"  //开源协议
s.summary  = 'This is a countdown button' //简单的描述
s.homepage = 'https://github.com/qxc122/QCCViewRoundRound' //主页
s.author   = { 'QCC' => 'qxc122@126.com' } //作者
s.source   = { :git => 'https://github.com/qxc122/QCCViewRoundRound.git', :tag => "0.0.1" } //git路径、指定tag号
s.platform = :ios
s.source_files = 'QCCViewRoundRound/*'  //库的源代码文件
s.framework = 'UIKit'  //依赖的framework
s.requires_arc = true
end
