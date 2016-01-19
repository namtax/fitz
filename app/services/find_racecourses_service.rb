module FindRacecoursesService
  extend self

  def run(postcode)
    outcome = FetchCoordsService.run(postcode)
    errors  = []

    if (postcode.empty? || !outcome.valid?)
      errors << 'Please supply a valid postcode'
    else
      response = connection.get(Foursquare.uri_path(outcome.result))
      result   = Venue.create(response.body)
    end

    ServiceResponse.new(result: result, errors: errors)
  end

  def connection
    @connection = Net::HTTP.new(uri.host, uri.port).tap(&method(:use_ssl))
  end

  def uri
    URI(Foursquare.uri_base)
  end

  def use_ssl(http)
    http.use_ssl = true
  end
end
