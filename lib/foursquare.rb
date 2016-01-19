module Foursquare
  extend self

  SEARCH_QUERY = 'racecourse'
  LIMIT = 5

  def uri_base
    "https://api.foursquare.com"
  end

  def uri_path(coords)
    "/v2/venues/search?#{url_params}&ll=#{coords}"
  end

  def url_params
    Hash[
      [
        [:client_id,  foursquare_client_id],
        [:client_secret, foursquare_client_secret],
        [:v, foursquare_version],
        [:query, SEARCH_QUERY],
        [:limit, LIMIT]
      ]
    ].to_query
  end

  def foursquare_client_id
    Configuration.foursquare_client_id
  end

  def foursquare_client_secret
    Configuration.foursquare_client_secret
  end

  def foursquare_version
    Configuration.foursquare_version
  end
end
