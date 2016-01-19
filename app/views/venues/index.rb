module Venues
  class Index < ::Stache::Mustache::View
    def results_title
      return if (search_term.empty? || flash[:alert].present?)
      venues.any? ? "Results for #{postcode}" : 'No results - try again!'
    end

    def postcode
      search_term.upcase if search_term
    end

    private

    def search_term
      params['postcode'] || ""
    end

    def venues
      [*@venues]
    end
  end
end