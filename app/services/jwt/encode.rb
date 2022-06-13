class Jwt::Encode
  def self.call(exp: 24.hours.from_now, payload: {})
  	new(exp:, payload:).call
  end

  def initialize(exp:, payload:)
  	@exp, @payload = exp, payload
  end

  def call
    JWT.encode(@payload.merge(exp: @exp.to_i), ENV.fetch('JWT_SECRET_KEY'))
  end
end