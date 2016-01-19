class Coords
  def initialize(response)
    @body   = parse(response.body)
    @result = fetch_result
  end

  def to_h
    [latitude, longitude].join(',')
  end

  private
  attr_reader :body, :result

  def parse(body)
    JSON.parse(body)
  end

  def fetch_result
    body['result']
  end

  def latitude
    result['latitude']
  end

  def longitude
    result['longitude']
  end
end