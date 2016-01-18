module Configuration
  def self.foursquare_client_id
    ENV['FOURSQUARE_CLIENT_ID']
  end

  def self.foursquare_client_secret
    ENV['FOURSQUARE_CLIENT_SECRET']
  end

  def self.foursquare_version
    ENV['FOURSQUARE_VERSION']
  end
end