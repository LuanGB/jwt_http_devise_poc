class Jwt::Auth
  def self.call(token:, resource: User)
  	new(token:, resource:).call
  end

  def initialize(token:, resource:)
  	@token, @resource = token, resource
  end

  def call
  	return if deny?
  	
  	payload = Jwt::Decode.call(token: @token)
  	return if expired?(payload)

  	@resource.find_by_jwt_payload(payload)
  end

  private

  def deny?
  	Jwt::DenyList.find_by token: @token
  end

  def expired?(payload)
  	payload[:exp] < Time.now.to_i
  end
end