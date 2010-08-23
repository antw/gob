module Rack
  class GobDispatcher

    def initialize(app)
      @app = app
    end

    def self.call(env)
      accept = env['HTTP_ACCEPT'] || ''

      application_name = case env['PATH_INFO'].split('/')[1]
        when 'invoices' then 'Invoices'
        when 'clients'  then 'Clients'
        else
          return [404, { 'Content-Length' => '9', 'Content-Type' => '' }, ['Not Found']]
      end

      env['PATH_INFO'].gsub!(/^\/(?:invoices|clients)/, '')

      # If the Accept header contains text/html, or */* and not application/json
      # then we return HTML. Otherwise we go for an API response.
      if accept.include?('text/html') ||
            (accept.include?('*/*') && ! accept.include?('application/json'))
        Gob::Apps::Web.class_eval(application_name).call(env)
      elsif accept.include?('application/json')
        Gob::Apps::API.class_eval(application_name).call(env)
      else
        # No acceptable response can be returned.
        [406, { 'Content-Length' => '0', 'Content-Type' => '' }, ['']]
      end
    end

  end # GobDispatcher
end # Rack

