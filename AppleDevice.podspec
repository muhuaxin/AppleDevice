Pod::Spec.new do |s|
  s.name     = 'AppleDevice'
  s.version  = '1.0.0'
  s.license  = 'MIT'
  s.summary  = 'Apple Device Information'
  s.homepage = 'https://github.com/muhuaxin/AppleDevice'
  s.author   = { 'Huaxin Mu' => 'bupt.muhuaxin@gmail.com' }
  s.source   = { :git => 'https://github.com/muhuaxin/AppleDevice.git', :tag => s.version.to_s }

  s.description = <<-DESC
    AppleDevice supports iOS, macOS, tvOS and watchOS.
  DESC

  s.source_files = 'AppleDevice/*.{h,m}'
  s.frameworks = 'Foundation'
  s.requires_arc = true
  
  s.ios.deployment_target = '6.0'
  # s.osx.deployment_target = '10.9'
  s.tvos.deployment_target = '9.0'
  s.watchos.deployment_target = '2.0'
  
end