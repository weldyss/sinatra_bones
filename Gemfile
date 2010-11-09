source :rubygems

# Application dependencies
gem "sinatra"
gem "cachy"
gem "erubis"
gem "activerecord", :require => "active_record"
gem "mysql2"

# Development-only dependencies
group :development do
  gem "shotgun"
  gem "awesome_print"
  gem "looksee"
  gem "wirble"
  gem "capistrano"
end

# Production-only dependencies
gem "unicorn", :group => :production

# Test-only dependencies
group :test do
  gem "mocha"
  gem "rspec", :require => "spec"
  gem "rack-test", :require => "rack/test"
  gem "database_cleaner"
end
