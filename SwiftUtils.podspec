Pod::Spec.new do |s|
  s.name   = 'SwiftUtils'
  s.version  = '1.4.0'
  s.license  = 'MIT'
  s.summary  = 'SwiftUtils'
  s.homepage = 'https://github.com/zendobk/SwiftUtils'
  s.authors  = { 'Dao Nguyen' => 'zendobk' }
  s.source   = { :git => 'https://github.com/zendobk/SwiftUtils.git', :tag => s.version}
  s.requires_arc = true
  s.ios.deployment_target = '8.0'  
  s.ios.frameworks = 'Foundation', 'UIKit'
  s.source_files = 'SwiftUtils/Classes/*.swift', 'SwiftUtils/Extensions/*.swift'
end