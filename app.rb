require 'open-uri'

get '/' do
  markdown :index
end

get '/:url' do
  open(params[:url]) do |f|
    content_type f.content_type
    f.read
  end
end
