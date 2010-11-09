require File.join(File.dirname(__FILE__), "config", "boot")

task :environment do
  db_config_file = File.join(APP_ROOT, "config", "database.yml")
  db_config = YAML.load(ERB.new(IO.read(db_config_file)).result).with_indifferent_access
  ActiveRecord::Base.configurations = db_config
  ActiveRecord::Base.establish_connection(RACK_ENV)
  ActiveRecord::Base.logger = Logger.new(File.join(APP_ROOT, "log", "#{RACK_ENV}.log"))
  ActiveRecord::Migration.verbose = true
end

# require task files
task_files = File.join(APP_ROOT, "lib", "tasks", "**", "*.rake")
Dir[task_files].each { |task| load task }

task :default => :test
task :test => :spec