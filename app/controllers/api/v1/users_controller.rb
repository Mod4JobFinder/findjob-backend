class Api::V1::UsersController < ApplicationController
  def create
    return invalid_params if !user_params[:email]
    params = user_params
    params[:email] = user_params[:email].downcase
    @user = User.create(user_params)
    if @user.save
      render json: {data: 'success'}, status: 201
    else
      invalid_params
    end
  end

  def update
    return invalid_params if !params[:email]
    @user = User.find_by(email: params[:email].downcase)
    return invalid_params if @user.nil?
    @user.update_attributes(user_update_params)
    
    render json: {data: 'user successfully updated'}, status: 200
  end

  private

  def user_params
    params.permit(:first_name, :last_name, :email, :password, :password_confirmation, :city, :state, :zipcode)
  end

  def user_update_params
    params.permit(:first_name, :last_name, :email, :city, :state, :zipcode)
  end
end
