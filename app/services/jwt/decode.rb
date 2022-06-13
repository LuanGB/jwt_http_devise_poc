class Jwt::Decode
  def self.call(token:)
  	new(token:).call
  end

  def initialize(token:)
  	@token = token
  end

  def call
  	decoded = JWT.decode(@token, ENV.fetch('JWT_SECRET_KEY'))[0]
    HashWithIndifferentAccess.new decoded
  end
end