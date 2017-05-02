Pod::Spec.new do |s|
  s.name             = "bannerView"
  s.version          = "0.0.3"
  s.summary          = "A marquee view used on iOS."
  s.description      = <<-DESC
                       It is a marquee view used on iOS, which implement by Objective-C.
                       DESC
  s.homepage         = "https://github.com/smithgoo/bannerView.git"
  # s.screenshots      = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "王朋" => "294336370@qq.com" }
  s.source           = { :git => "https://github.com/smithgoo/bannerView.git", :tag => "0.0.3"  }
  # s.social_media_url = 'https://twitter.com/NAME'

  s.platform     = :ios, '9'
  # s.ios.deployment_target = '5.0'
  # s.osx.deployment_target = '10.7'
  s.requires_arc = true

  s.source_files = './*.{h,m}'
  # s.resources = 'Assets'

  # s.ios.exclude_files = 'Classes/osx'
  # s.osx.exclude_files = 'Classes/ios'
  # s.public_header_files = 'Classes/**/*.h'
  s.frameworks = 'Foundation', 'CoreGraphics', 'UIKit'

end
