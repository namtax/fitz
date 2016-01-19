module Venues
  class Index < ::Stache::Mustache::View
    def postcode
      params['postcode'].upcase if params['postcode']
    end
  end
end