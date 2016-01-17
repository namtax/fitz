class Coords
	def initialize(response)
		@body   = parse(response.body)
		@result = fetch_result
	end

	def to_h
		{lat: result['latitude'], long: result['longitude']}
	end

	private
	attr_reader :body, :result

	def parse(body)
		JSON.parse(body)
	end

	def fetch_result
		body['result'].first
	end
end