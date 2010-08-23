# encoding: utf-8

module Gob::Apps::API
  # An abstract application from which all API applications should inherit.
  class Base < Gob::Apps::Base
    # All API controllers set the correct content-type...
    before { content_type 'application/json' }
  end
end
