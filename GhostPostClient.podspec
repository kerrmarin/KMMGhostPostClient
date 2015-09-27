#
# Be sure to run `pod lib lint GhostPostClient.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "GhostPostClient"
  s.version          = "0.1.0"
  s.summary          = "A client to retrieve and edit posts from a ghost installation"
  s.description      = <<-DESC
                       A client to retrieve and edit posts from a ghost installation
                       DESC
  s.homepage         = "https://github.com/kerrmarin/GhostPostClient"
  s.license          = 'MIT'
  s.author           = { "Kerr Marin Miller" => "kerr@kerrmarin.com" }
  s.source           = { :git => "https://github.com/kerrmarin/GhostPostClient.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/kerrmarin'

  s.platform     = :ios, '8.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = {
    'GhostPostClient' => ['Pod/Assets/*.png']
  }

  s.dependency 'AFNetworking', '~> 2.6.0'
end
