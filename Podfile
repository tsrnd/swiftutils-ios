source 'https://github.com/CocoaPods/Specs.git'
inhibit_all_warnings!
platform :ios, '8.0'
use_frameworks!

target 'PodTest' do
    pod 'SwiftUtils', :path => './'
end

target 'SwiftUtils' do
    target 'Tests' do
        inherit! :search_paths
    end
end
