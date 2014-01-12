$:.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'spree_avalara_calc/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'spree_avalara_calc'
  s.version     = SpreeAvalaraCalc::VERSION
  s.authors     = ['sigurthor']
  s.email       = ['sigurthor.einar@gmail.com']
  s.homepage    = ''
  s.summary     = 'avalara tax caclc'
  s.description = 'avalara tax calc for spree'

  s.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.rdoc']
  s.test_files = Dir['test/**/*']

  s.add_dependency 'rails', '~> 4.0.0'
  s.add_dependency 'hashie', '~> 2.0.0'
  s.add_dependency 'avalara'
  s.add_dependency 'spree'

  s.add_development_dependency 'pg'
end
