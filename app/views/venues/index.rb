module Venues
  class Index < ::Stache::Mustache::View
    COLOURS = %w{ blue green red purple yellow }
    LABELS  = ('A'..'E').to_a

    def results_title
      return if (search_term.empty? || flash[:alert].present?)
      venues.any? ? "Results for #{postcode}" : 'No results - try again!'
    end

    def postcode
      search_term.upcase if search_term
    end

    def map_src
      escape(google_maps_uri) if valid_search?
    end

    private

    def search_term
      params['postcode'] || ""
    end

    def venues
      [*@venues]
    end

    def escape(uri)
      URI.escape(uri)
    end

    def google_maps_uri
      "https://maps.googleapis.com/maps/api/staticmap?size=600x300&maptype=roadmap#{markers}"
    end

    def markers
      venues.map.with_index do |v, i|
        '&markers=color:' + COLOURS[i] + '|label:' + LABELS[i] + '|' + v.coords
      end.join
    end

    def valid_search?
      search_term.present? && flash[:alert].nil?
    end
  end
end
