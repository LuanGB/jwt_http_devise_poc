module JwtAuthable
  extend ActiveSupport::Concern

  def auth!
    @current_user = Jwt::Auth.(token: token, resource: resource)

    render json: { error: :unauthorized }, status: :unauthorized unless @current_user
  rescue
    render json: { error: :unauthorized }, status: :unauthorized
  end

  def deny!
    Jwt::Deny.(token: token)

    render json: { message: :signed_out }, status: :ok
  end

  def token
    request.headers['Authorization'].match(/Bearer ([\w-]*\.[\w-]*\.[\w-]*)/)[1]
  end

  def current_user
    @current_user
  end

  def resource
    User
  end
end