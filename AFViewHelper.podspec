Pod::Spec.new do |s|
    s.name     = 'AFViewHelper'
    s.version  = '4.2.4'
    s.license  = 'MIT'
    s.summary  = 'Autolayout and Animation UIVIew Extension for Swift 3.0.'
    s.homepage = 'https://github.com/melvitax/ViewHelper'
    s.author   = { 'Melvin Rivera' => 'melvitax@gmail.com' }
    s.source   = { :git => 'https://github.com/melvitax/ViewHelper.git', :tag => s.version.to_s }
    s.description      = <<-DESC
                    Autolayout and Animation UIVIew Extension for Swift 3.0. Includes InspectableView for setting basic view attributes.
                    DESC
    s.social_media_url = 'https://twitter.com/melvitax'
    s.framework    = 'QuartzCore'

    s.platforms = { :ios => '9.0', :tvos => '9.0' }
    s.ios.deployment_target = "9.0"
    s.tvos.deployment_target = "10.0"

    s.xcconfig = { 'SWIFT_VERSION' => '3.0' }

    s.source_files = "Sources/**/*.{h,swift}"

end
