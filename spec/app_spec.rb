require File.dirname(__FILE__) + '/spec_helper'

describe 'App' do
  include Rack::Test::Methods

  before do
    @url = 'http://example.com/'
    @body = 'this is a body'
    stub_request(:any, @url).
      to_return(:status => ['200', 'OK'],
      :headers => { 'Content-Type' => 'text/xxxx' },
      :body => @body)
  end

  def app
    Sinatra::Application
  end

  describe '/' do
    context 'url is given' do
      it 'should respond to /' do
        get '/http%3A%2F%2Fexample.com%2F'

        last_response.status.should eql(200)
        last_response.body.should eql(@body)
        last_response['content-type'].should eql('text/xxxx;charset=utf-8')
      end
    end

    context 'url is not given' do
      it 'should respond with index' do
        get '/'

        last_response.status.should eql(200)
      end
    end
  end
end
