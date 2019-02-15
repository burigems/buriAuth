$:.push File.expand_path('../lib', __FILE__)

require 'nimble_auth/version'

Gem::Specification.new do |s|
  s.name        = 'nimble-auth'
  s.version     = NimbleAuth::VERSION
  s.authors     = ['Olivier Robert']
  s.email       = ['dev@nimblehq.com']
  s.homepage    = 'https://github.com/nimblehq/nimble-auth'
  s.summary     = 'Re-usable Devise-based authentication mountable engine'
  s.description = s.summary
  s.license     = 'MIT'

  s.files = Dir['{app,config,db,lib}/**/*', 'LICENSE', 'Rakefile', 'README.md']
  s.test_files = Dir['spec/**/*']

  s.add_dependency 'rails', '~> 5.1.4'
  s.add_dependency 'devise'

  # Omniauth gems
  s.add_dependency 'omniauth'
  s.add_dependency 'omniauth-facebook'
  s.add_dependency 'omniauth-google-oauth2'

  # Assets
  s.add_dependency 'sass-rails'
  s.add_dependency 'normalize-rails' # Integrates normalize.css with the asset pipeline

  # Testing
  s.add_development_dependency 'sqlite3'
  s.add_development_dependency 'rspec-rails' # Rails testing engine
  s.add_development_dependency 'shoulda-matchers' # Tests common Rails functionalities
  s.add_development_dependency 'rubocop' # A Ruby static code analyzer, based on the community Ruby style guide
  s.add_development_dependency 'brakeman' # A static analysis security vulnerability scanner for Ruby on Rails applications
  s.add_development_dependency 'rubycritic' # A Ruby code quality reporter
  s.add_development_dependency 'capybara' # Acceptance test framework for web applications
  s.add_development_dependency 'selenium-webdriver' # Ruby bindings for Selenium/WebDriver
  s.add_development_dependency 'ffaker' # A library for generating fake data such as names, addresses, and phone numbers.
  s.add_development_dependency 'fabrication' # Fabrication generates objects in Ruby. Fabricators are schematics for your objects, and can be created as needed anywhere in your app or specs.
  s.add_development_dependency 'rails-controller-testing'
  s.add_development_dependency 'better_errors' # Better error page for Rails and other Rack apps
end
