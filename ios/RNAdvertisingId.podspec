
Pod::Spec.new do |s|
  s.name         = "RNAdvertisingId"
  s.version      = "1.0.0"
  s.summary      = "RNAdvertisingId"
  s.description  = <<-DESC
                  RNAdvertisingId
                   DESC
  s.homepage     = "https://github.com/applike/react-native-advertising-id"
  s.license      = "MIT"
  # s.license      = { :type => "MIT", :file => "FILE_LICENSE" }
  s.author             = { "author" => "author@domain.cn" }
  s.platform     = :ios, "7.0"
  s.source       = { :git => "https://github.com/author/RNAdvertisingId.git", :tag => "master" }
  s.source_files  = "RNAdvertisingId/**/*.{h,m}"
  s.requires_arc = true


  s.dependency "React"
  #s.dependency "others"

end

  
