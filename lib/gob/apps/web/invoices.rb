# encoding utf-8

module Gob::Apps::Web
  # Handles the invoices REST API. Permits listing all invoices, or
  # displaying, creating, updating, or deleting, individual invoices.
  #
  # This application is mounted to /invoices.
  class Invoices < Base

    # Shows the details for an individual invoice whose ID is :id.
    get '/:id' do |id|
      @invoice = get_resource("invoices/#{id}", :resolve => :all)
      mustache :invoice, :layout => false
    end

  end # Invoices
end # Gob::Apps::Web
