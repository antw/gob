module Gob::Views
  class Invoice < Mustache
    def ref
      @invoice['ref']
    end

    def identifier
      @invoice['identifier']
    end

    def client_ref
      @invoice['client']['ref']
    end

    def client_name
      @invoice['client']['name']
    end
  end # Invoice
end # Gob::Views
