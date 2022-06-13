class Jwt::Deny
  def self.call(token:)
  	new(token:).call
  end

  def initialize(token:)
  	@token = token
  end

  def call
  	Jwt::DenyList.create token: @token
  end
end