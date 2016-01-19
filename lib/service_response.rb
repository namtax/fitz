class ServiceResponse
  attr_reader :result, :errors

  def initialize(result: nil, errors: nil)
    @errors  = errors
    @result  = result
  end

  def valid?
    errors.empty?
  end
end