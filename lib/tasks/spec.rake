require "spec/rake/spectask"

if !defined?(Spec)
  puts "spec targets require RSpec"
else
  desc "Run all examples"
  Spec::Rake::SpecTask.new("spec") do |t|
    t.spec_files = FileList["spec/**/*.rb"]
    t.spec_opts = ["-cfs"]
  end
end