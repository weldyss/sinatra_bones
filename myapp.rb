module MyApp
  # require app files
  app_files = File.join(APP_ROOT, "app", "**", "*.rb")
  Dir[app_files].each {|file| require file}

  class Application < Sinatra::Application
    enable :sessions
    enable :logging
    enable :method_override

    set :views, File.join(APP_ROOT, "app", "views")

    log_path = File.join(APP_ROOT, "log", "#{RACK_ENV}.log")
    use Rack::CommonLogger, File.new(log_path, "a+")
    use Rack::ShowExceptions

    use Rack::Static, :urls => ["favicon.ico", "/stylesheets", "/images"], :root => "public"
    use Rack::ETag

    helpers{ include MyApp::Helpers }
    include MyApp::Handlers

    # set utf-8 for outgoing
    before do
      headers "Content-Type" => "text/html; charset=utf-8"
    end

    def initialize(*params)
      read_config
      setup_db
      super(*params)
    end

    protected
      def read_config
        config_file = File.join(APP_ROOT, "config", "config.yml")
        @app_config = YAML.load(ERB.new(IO.read(config_file)).result)[RACK_ENV]
        @app_config.recursive_symbolize_keys!
      end

      def setup_db
        db_config_file = File.join(APP_ROOT, "config", "database.yml")
        @db_config = YAML.load(ERB.new(IO.read(db_config_file)).result).with_indifferent_access
        ActiveRecord::Base.logger = Logger.new(File.join(APP_ROOT, "log", "#{RACK_ENV}.log"))
        ActiveRecord::Base.configurations = @db_config
        ActiveRecord::Base.establish_connection(RACK_ENV)
      end
  end
end