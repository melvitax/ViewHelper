Pod::Spec.new do |s|
  s.name     = 'AFViewHelper'
  s.version  = '4.0.1'
  s.platform     = :ios, '8.0'
  s.license  = 'MIT'
  s.summary  = 'Autolayout and Animation UIVIew Extension for Swift 2.0.'
  s.homepage = 'https://github.com/melvitax/AFViewHelper'
  s.author   = { 'Melvin Rivera' => 'melvin@allforces.com' }
  s.source   = { :git => 'https://github.com/melvitax/AFViewHelper.git', :tag => s.version.to_s }
  s.description      = <<-DESC
                        Autolayout and Animation UIVIew Extension for Swift 2.0. Includes InspectableView for setting basic view attributes.
                        DESC
  s.source_files = 'AFViewHelper/*'
# s.social_media_url = 'https://twitter.com/melvitax'
  s.framework    = 'QuartzCore'
  s.requires_arc = true
end