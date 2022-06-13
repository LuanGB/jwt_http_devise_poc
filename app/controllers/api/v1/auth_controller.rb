class Api::V1::AuthController < Api::BaseController
  include JwtAuthable

  # POST /api/v1/auth
  def create
    @user = User.find_by(user_params.slice(:email))

    if @user.valid_password?(user_params[:password])
      response.headers['Authorization'] = "Bearer #{Jwt::Encode.(payload: @user.jwt_payload)}"
      render json: @user, status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/auth
  def destroy
    deny!
  end

  private
    def user_params
      params.require(:auth).permit(:email, :password)
    end
end
