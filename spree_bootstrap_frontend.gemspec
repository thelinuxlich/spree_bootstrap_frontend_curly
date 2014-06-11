# encoding: UTF-8
Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'spree_bootstrap_frontend_curly'
  s.version     = '2.2.0'
  s.summary     = 'Switches out Spree’s entire frontend for a bootstrap 3 powered frontend with curly safe templates'
  s.description = s.summary
  s.required_ruby_version = '>= 2.0.0'

  s.author    = 'Alisson Cavalcante Agiani'
  s.email     = 'thelinuxlich@gmail.com'
  s.homepage  = 'http://github.com/thelinuxlich'

  s.files       = `git ls-files`.split("\n")
  s.test_files  = `git ls-files -- spec/*`.split("\n")
  s.require_path = 'lib'
  s.requirements << 'none'

  s.add_runtime_dependency 'bootstrap-sass',      '~> 3.1.0'
  s.add_runtime_dependency 'bootstrap-kaminari-views', '~> 0.0.3'
  s.add_runtime_dependency 'spree_core',          '~> 2.2.0'

  s.add_development_dependency 'email_spec', '~> 1.2.1'
  s.add_development_dependency 'capybara-accessible'
end
