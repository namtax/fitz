class FetchCoordsService
  def self.run(postcode)
    response = connection.get(uri_path % escape(postcode))
    errors   = []

    if response.code == '200'
      coords = ::Coords.new(response)
      result = coords.to_h
    else
      errors << 'Please supply a valid postcode'
    end

    ServiceResponse.new(result: result, errors: errors)
  end

  def self.connection
    @connection ||= Net::HTTP.new(uri.host, uri.port)
  end

  def self.uri
    URI.parse(uri_base)
  end

  def self.uri_base
    'http://api.postcodes.io'
  end

  def self.uri_path
    "/postcodes/%s"
  end

  def self.escape(string)
    URI.escape(string)
  end
end