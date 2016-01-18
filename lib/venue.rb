class Venue
  def self.create(json)
    venues = parse(json)['response']['venues']
    venues.map(&method(:new))
  end

  def self.parse(json)
    JSON.parse(json)
  end

  def initialize(venue_hash)
    @venue_hash = venue_hash
  end

  def name
    venue_hash['name']
  end

  def address
    location['formattedAddress']
  end

  def lat
    location['lat']
  end

  def long
    location['lng']
  end

  private
  attr_reader :venue_hash

  def location
    venue_hash['location']
  end
end