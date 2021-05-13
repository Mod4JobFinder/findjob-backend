class Api::V1::SessionsController < ApplicationController
  def create
    return invalid_params if !user_params[:email] || !user_params[:password]
    @user = User.find_by(email: params[:email].downcase)
   if @user && @user.authenticate(user_params[:password])
    render json: {data: 'success'}, status: 201
   else 
    render json: {error: 'invalid credentials'}, status: 400
  end 
end 