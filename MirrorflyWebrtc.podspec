Pod::Spec.new do |s|
    s.name              = 'MirrorflyWebrtc'
    s.version           = "1.1.4"
    s.summary           = 'This repo is to access WebRTC framework and methods'
    s.homepage          = 'https://github.com/MirrorFly/MirrorflyWebrtc'
    s.author            = { 'Gowtham' => 'gowtham.a@contus.in','Vanitha' => 'vanitha.g@contus.in', }
    s.license      = { :type => 'Commercial', :file => 'LICENSE' }
    s.platform          = :ios, 12.1
    s.source            = { :git => 'https://github.com/MirrorFly/MirrorflyWebrtc.git', :tag => s.version.to_s }
    s.swift_version = '5.0'
    s.requires_arc = true
    s.ios.deployment_target = '12.1'
    s.ios.vendored_frameworks = "SDK/WebRTC.xcframework"
    s.public_header_files = ["MirrorflyWebrtc/Frameworks/WebRTC/**/**/*.*{swift, h, m}"
    s.documentation_url = 'https://www.mirrorfly.com/docs/chat/ios/v2/quick-start/'
    s.ios.frameworks = ['UIKit']
    s.pod_target_xcconfig = { 'VALID_ARCHS' => 'armv7 arm64 x86_64', 'IPHONEOS_DEPLOYMENT_TARGET' => '12.1',}
end
