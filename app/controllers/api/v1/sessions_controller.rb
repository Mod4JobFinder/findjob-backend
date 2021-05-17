class Api::V1::SessionsController < ApplicationController
  def create
    return invalid_params if !user_params[:email] || !user_params[:password]
    @user = User.find_by(email: params[:email].downcase)
    if @user && @user.authenticate(user_params[:password])
      @serial = UserSerializer.new(@user)
      render json: @serial, status: 201
    else
      invalid_params
    end
  end

  private

  def user_params
    params.permit(:email, :password)
  end 
end 