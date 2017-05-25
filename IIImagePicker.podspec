Pod::Spec.new do |s|

  s.name         = "IIImagePicker"
  s.version      = "0.0.1"
  s.summary      = "Open standurt picker camera or gallery"


  s.description  = <<-DESC
                   DESC

  s.homepage     = "https://github.com/Aligator119/IIImagePicker"

  s.license      = "MIT"

  s.author             = { "Vanja" => "vanja.irchak@gmail.com" }
  s.platform     = :ios, "5.0"

  s.source       = { :git => "https://github.com/Aligator119/IIImagePicker.git", :commit => "56f44724f16d1be2e633fc903ee1d325c2c6d132" }

  s.source_files  = "*.{h,m}"
  s.requires_arc = true

end
