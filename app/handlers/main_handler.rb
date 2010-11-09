module MyApp
  module Handlers
    get "/" do
      erubis "Hello World - <%= Time.now %>"
    end
  end
end
