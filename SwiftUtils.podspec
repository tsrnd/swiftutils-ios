Pod::Spec.new do |s|
  s.name   = 'SwiftUtils'
  s.version  = '2.1.1'
  s.license  = 'MIT'
  s.summary  = 'SwiftUtils'
  s.homepage = 'https://github.com/zendobk/SwiftUtils'
  s.authors  = { 'Dao Nguyen' => 'zendobk' }
  s.source   = { :git => 'https://github.com/zendobk/SwiftUtils.git', :tag => s.version}
  s.requires_arc = true
  s.ios.deployment_target = '8.0'  
  s.ios.frameworks = 'Foundation', 'UIKit'
  s.source_files = 'Sources/Classes/*.swift', 'Sources/Extensions/*.swift'
end
