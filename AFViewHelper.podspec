Pod::Spec.new do |s|
  s.name     = 'AFViewHelper'
  s.version  = '3.0.0'
  s.platform     = :ios, '8.0'
  s.license  = 'MIT'
  s.summary  = 'Convenience extension for UIView in Swift.'
  s.homepage = 'https://github.com/melvitax/AFViewHelper'
  s.author   = { 'Melvin Rivera' => 'melvin@allforces.com' }
  s.source   = { :git => 'https://github.com/melvitax/AFViewHelper.git', :tag => s.version.to_s }
  s.description      = <<-DESC
                        Auto Layout convenience class for UIView in Swift
                        DESC
  s.source_files = 'AFViewHelper/*'
# s.social_media_url = 'https://twitter.com/melvitax'
  s.framework    = 'QuartzCore'
  s.requires_arc = true
end
