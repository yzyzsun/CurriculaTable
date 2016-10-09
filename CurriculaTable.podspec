Pod::Spec.new do |s|
  s.name             = 'CurriculaTable'
  s.version          = '0.2.0'
  s.summary          = 'A flexible timetable for curricula written in Swift.'
  s.homepage         = 'https://github.com/yzyzsun/CurriculaTable'
  s.screenshots      = 'https://raw.githubusercontent.com/yzyzsun/CurriculaTable/master/screenshot.png'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Sun Yaozhu' => 'yzyzsun@gmail.com' }
  s.source           = { :git => 'https://github.com/yzyzsun/CurriculaTable.git', :tag => s.version.to_s }
  s.ios.deployment_target = '8.0'
  s.source_files = 'CurriculaTable/*.swift'
  s.requires_arc = true
end
