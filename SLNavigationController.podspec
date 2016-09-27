
Pod::Spec.new do |s|

  s.name         = "SLNavigationController"
  s.version      = "1.0.0"
  s.summary      = "A custom NavigationController in iOS."

  s.description  = <<-DESC
                    A custom NavigationController for iOS 
                   DESC

  s.homepage     = "https://github.com/supreme0530/SLNavigationController"
  # s.screenshots  = "www.example.com/screenshots_1.gif", "www.example.com/screenshots_2.gif"

  s.license      = "MIT"
  # s.license      = { :type => "MIT", :file => "FILE_LICENSE" }

  s.author             = { "supreme0530" => "liangyz@adnonstop.com" }

  s.source       = { :git => "https://github.com/supreme0530/SLNavigationController.git", :tag => "#{s.version}" }



  s.source_files  = "SLNavigationController", "Classes/*/**/*.{h,m}"




  # ――― Resources ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  A list of resources included with the Pod. These are copied into the
  #  target bundle with a build phase script. Anything else will be cleaned.
  #  You can preserve files from being cleaned, please don't preserve
  #  non-essential files like tests, examples and documentation.
  #

  # s.resource  = "icon.png"
  # s.resources = "Resources/*.png"

  # s.preserve_paths = "FilesToSave", "MoreFilesToSave"


  # ――― Project Linking ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Link your library with frameworks, or libraries. Libraries do not include
  #  the lib prefix of their name.
  #
  s.frameworks = "UIKit", "Foundation","CoreGraphics"

  # s.framework  = "SomeFramework"
  # s.frameworks = "SomeFramework", "AnotherFramework"

  # s.library   = "iconv"
  # s.libraries = "iconv", "xml2"


  s.requires_arc = true

  # s.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
   s.dependency 'Masonry','~> 1.0.1'
   s.dependency 'SDWebImage','~> 3.8.1'
   s.ios.deployment_target = "7.1"

end
