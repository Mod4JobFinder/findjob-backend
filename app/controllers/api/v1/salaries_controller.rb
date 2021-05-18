class Api::V1::SalariesController < ApplicationController
  def index 
    if params[:city]
      @salaries = Salary.where(city: params[:city].downcase)
      @serial = SalarySerializer.new(@salaries)
      
      render json: @serial
    else 
      invalid_params
    end
  end
end
