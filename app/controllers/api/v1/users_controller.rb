class Api::V1::UsersController < ApplicationController
  def create
    return param_missing(["email"]) if !user_params[:email]
    params = user_params
    params[:email] = user_params[:email].downcase
    @user = User.create(user_params)
    if @user.save
      render json: {data: 'success'}, status: 201
    else
      specific_error(@user)
    end
  end

  private

  def user_params
    params.permit(:first_name, :last_name, :email, :password, :password_confirmation, :city, :state, :zipcode)
  end 
end
