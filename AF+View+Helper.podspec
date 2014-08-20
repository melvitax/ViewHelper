Pod::Spec.new do |s|
  s.name     = 'AF+View+Helper'
  s.version  = '1.02'
  s.platform = :ios
  s.license  = 'MIT'
  s.summary  = 'Convenience extension for UIView in Swift.'
  s.homepage = 'https://github.com/melvitax/AFViewHelper'
  s.author   = { 'Melvin Rivera' => 'melvin@allforces.com' }
  s.source   = { :git => 'https://github.com/melvitax/AFViewHelper.git', :tag => s.version.to_s }
  s.description = 'onvenience extension for UIView in Swift for handling frame position, size, borders and shadows.'
  s.source_files = 'AF+View+Helper/*'
  s.framework    = 'QuartzCore'
  s.requires_arc = true
end
