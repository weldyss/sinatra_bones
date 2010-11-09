RACK_ENV = ENV["RACK_ENV"] ||= "development" unless defined?(RACK_ENV)
APP_ROOT = File.expand_path(File.join(File.dirname(__FILE__), '..')) unless defined?(APP_ROOT)

require "rubygems"
require "bundler"
Bundler.setup
Bundler.require(:default, RACK_ENV.to_sym)

require "active_support/all"
require File.join(APP_ROOT, "lib", "core_ext")
require "yaml"

require File.join(APP_ROOT, "myapp")