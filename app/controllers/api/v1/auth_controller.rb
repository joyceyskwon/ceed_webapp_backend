class Api::V1::AuthController < ApplicationController
  def login
    @uesr = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      token = encode_token(@user.id)
      render json: UserSerializer.new(@user)
    else
      render json: {errors: "User not found"}
    end
  end

  def get_user_from_token
    if curr_user
      render json: curr_user
    else
      render json: {errors: "No id present on headers"}
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :name)
  end
end
