# encoding: utf-8

module Gob::Apps::Web
  # An abstract application from which all front-end web applications
  # should inherit.
  class Base < Gob::Apps::Base
    register Mustache::Sinatra

    set :mustache, {
      :views     => Gob.root + 'views',
      :templates => Gob.root + 'templates',
      :namespace => Gob::Views
    }

    before { content_type 'text/html' }

    private # ================================================================

    # The weird puppet which makes all this work.
    #
    # Franklin builds a second instance of the application; requests are then
    # sent to this second instance asking for JSON.
    #
    class Franklin
      include Rack::Test::Methods

      def self.app
        @app ||=
          Rack::Builder.parse_file((Gob.root + '../../config.ru').to_s).first
      end

      def app
        self.class.app
      end
    end

    # Given a URL relative to the root, retrieves the expected resource(s).
    #
    # TODO Failing to resolve a relationship should not raise a NotFound.
    #
    # @param [String] resource
    #   A URL to the resource, sans the leading /
    #
    # @return [Hash, Array<Hash>]
    #   If a single resource was requested, a Hash will be returned with the
    #   resources attributes. If a resource list was requested, an array of
    #   hashes will instead be returned.
    #
    # @raise [Sinatra::NotFound]
    #   Raised when the requested resources were not present.
    #
    # @example
    #   get_resource("invoice/1")
    #   # => Returns a hash containing the attributes of invoice 1
    #
    def get_resource(ref, options = {})
      franklin = Franklin.new
      franklin.header "Accept", "application/json"
      franklin.get ref

      if franklin.last_response.status == 404
        raise Sinatra::NotFound
      end

      resource = JSON.parse(franklin.last_response.body)

      if options[:resolve] == :all
        resource.each_pair do |attribute, value|
          if value.kind_of?(Hash) and value.has_key?('ref')
            ref = value['ref'][(API_ROOT.length + 1)..-1]
            resource[attribute] = get_resource(ref)
          end
        end
      end

      resource
    end

  end # Base
end # Gob::Apps::Web

