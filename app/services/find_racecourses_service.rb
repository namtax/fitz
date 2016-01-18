module FindRacecoursesService
  extend self

  def run(postcode)
    coords   = FetchCoordsService.run(postcode)
    response = connection.get(Foursquare.uri_path(coords))
    Venue.create(response.body)
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
