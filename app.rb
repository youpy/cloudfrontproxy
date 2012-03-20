require 'open-uri'

set :views, File.dirname(__FILE__)

get '/' do
  markdown :README
end

get '/:url' do
  open(params[:url]) do |f|
    content_type f.content_type
    f.read
  end
end
