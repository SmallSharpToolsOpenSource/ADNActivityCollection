Pod::Spec.new do |s|
  s.name         = 'ADNActivityCollection'
  s.version      = '1.0.0'
  s.summary      = 'A collection of activities for App.net'
  s.homepage     = "http://www.smallsharptools.com/"
  s.license      = 'MIT'
  s.author = {
    'Brennan Stehling' => 'brennan@smallsharptools.com'
  }
  s.source = {
    :git => 'https://github.com/brennanMKE/ADNActivityCollection.git',
    :tag => '1.0.0'
  }
  s.social_media_url = 'https://twitter.com/smallsharptools'
  s.platform     = :ios, '7.0'
  s.ios.deployment_target = '7.0'
  s.requires_arc = true
  s.source_files = 'ADNActivities/*.{h,m}'
end
