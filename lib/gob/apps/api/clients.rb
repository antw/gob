# encoding: utf-8

module Gob::Apps::API
  # Handles the clients REST API. Permits listing all invoices, or
  # displaying, creating, updating, or deleting, individual clients.
  #
  # This application is mounted to /clients.
  class Clients < Base

    # Shows the details for an individual invoice whose ID is :id.
    get '/:id' do |id|
      <<-RESPONSE.gsub(/^      /, '')
        { "ref": "#{API_ROOT}/clients/4c6c3bbbb284e3b847000014",
          "name": "Gob Bluth" }
      RESPONSE
    end

  end # Clients
end # Gob::Apps::API
