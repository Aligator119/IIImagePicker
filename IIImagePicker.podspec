Pod::Spec.new do |s|

  s.name         = "IIImagePicker"
  s.version      = "0.0.1"
  s.summary      = "Open standurt picker camera or gallery"


#s.description   = "Open Image gallery or camera with standart picker and return result image."

  s.homepage     = "https://github.com/Aligator119/IIImagePicker"

s.license        = { :type => 'MIT'}

  s.author       = { "Vanja" => "vanja.irchak@gmail.com" }
  s.platform     = :ios, "8.0"

  s.source       = { :git => "https://github.com/Aligator119/IIImagePicker.git", :tag => s.version.to_s }

  s.source_files = "*.{h,m}"
  s.requires_arc = true
  s.frameworks   = 'UIKit', 'Foundation'

end
