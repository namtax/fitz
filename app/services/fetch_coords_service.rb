class FetchCoordsService
  def self.run(postcode)
    response  = connection.get(uri_path % escape(postcode))
    coords    = ::Coords.new(response)
    coords.to_h
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
    "/postcodes?q=%s"
  end

  def self.escape(string)
    URI.escape(string)
  end
end