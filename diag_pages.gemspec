$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "diag_pages/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "diag_pages"
  s.version     = DiagPages::VERSION
  s.authors     = ["Jeremy Hicks"]
  s.email       = ["jeremy.hicks@pnmac.com"]
  s.homepage    = ""
  s.summary     = "Ping common and custom dependencies."
  s.description = "Show the status of dependencies."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.2.7.1"
  s.add_dependency "httpclient", "~> 2.8"

  s.add_development_dependency "sqlite3"
end
