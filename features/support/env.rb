# encoding: utf-8

ENV['RACK_ENV'] = 'test'

# Load Gob.
require File.expand_path(File.dirname(__FILE__) + '/../../lib/gob')

Webrat.configure do |config|
  config.mode = :rack
end

class GobWorld
  def app
    @app = Rack::Builder.parse_file(
      File.expand_path(File.dirname(__FILE__) + '/../../config.ru')).first
  end

  # TODO Is this still needed?
  Webrat::Methods.delegate_to_session(:response_code, :response_body)

  include Rack::Test::Methods
  include Webrat::Methods
  include Webrat::Matchers
end

World do
  GobWorld.new
end

