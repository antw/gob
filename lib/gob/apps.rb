# encoding: utf-8

module Gob::Apps
  # Contains all Sinatra applications which deal with the JSON REST API.
  module API ; end

  # Contains all Sinatra applications which deal with the web front-end.
  module Web ; end

  # This is an abstract application which does the basic setup for both the
  # API and Web applications.
  class Base < Sinatra::Base
    configure do
      set :environment,     Gob.env
      set :raise_errors,    lambda { test? }
      set :show_exceptions, lambda { development? }
      set :dump_errors,     true
      set :static,          true
      set :public,          Gob.root + 'public'
    end

    # The URL at which the REST API can be accessed.
    API_ROOT = 'http://localhost:9292'
  end # Base

end # Gob::Apps

module Gob
  # Holds the Mustache view classes for the web application.
  module Views ; end
end

require 'gob/apps/api/base'
require 'gob/apps/api/invoices'
require 'gob/apps/api/clients'

require 'gob/apps/web/base'
require 'gob/apps/web/invoices'

