require "rubygems"
require "sinatra"
require "spec"
require "spec/interop/test"
require "rack/test"

ENV["RACK_ENV"] = "test"

# set test environment
Sinatra::Base.set :environment, :test
Sinatra::Base.set :run, false
Sinatra::Base.set :raise_errors, true
Sinatra::Base.set :logging, false

require File.join(File.dirname(__FILE__), "..", "config", "boot")

#require "database_cleaner"
DatabaseCleaner.strategy = :truncation

# Requires supporting files with custom matchers and macros, etc,
# in ./support/ and its subdirectories.
Dir[File.expand_path(File.join(File.dirname(__FILE__), "support", "**", "*.rb"))].each {|f| require f}

Spec::Runner.configure do |config|
  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
end