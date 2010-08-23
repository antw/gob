# encoding: utf-8

module Gob::Apps::API
  # Handles the invoices REST API. Permits listing all invoices, or
  # displaying, creating, updating, or deleting, individual invoices.
  #
  # This application is mounted to /invoices.
  class Invoices < Base

    # Shows the details for an individual invoice whose ID is :id.
    get '/:id' do |id|
      client = %[{ "ref": "#{API_ROOT}/clients/4c6c3bbbb284e3b847000014" }]

      <<-RESPONSE.gsub(/^      /, '')
       { "ref":        "#{API_ROOT}/invoices/4c6c0cf7b284e32154000084",
         "identifier": "154",
         "client":     #{client} }
       RESPONSE
    end

  end # Invoices
end # Gob::Apps::API

