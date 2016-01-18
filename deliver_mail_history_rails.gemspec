$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "deliver_mail_history_rails/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "deliver_mail_history_rails"
  s.version     = DeliverMailHistoryRails::VERSION
  s.authors     = ["Shohei Yamasaki"]
  s.email       = ["s-yamasaki@pepabo.com"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of DeliverMailHistoryRails."
  s.description = "TODO: Description of DeliverMailHistoryRails."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.2.3"

  s.add_development_dependency "sqlite3"
end
