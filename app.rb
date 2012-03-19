require 'open-uri'

get '/:url' do
  open(params[:url]) do |f|
    content_type f.content_type
    f.read
  end
end
