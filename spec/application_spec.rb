require "spec_helper"

describe 'main application' do
  include Rack::Test::Methods

  def app
    MyApp::Application.new
  end

  specify 'should show the default index page' do
    get '/'
    last_response.should be_ok
  end

  specify 'should have more specs' do
    pending
  end
end