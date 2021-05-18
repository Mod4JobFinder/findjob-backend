class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound, with: :invalid_params

  def invalid_params
    render json: {error: 'invalid parameters'}, status: 400
  end 

  # def param_missing(returns)
  #   render json: JSON.generate({
  #                                error: returns.map { |field| "#{field} parameter was not included in your request" }
  #                              }), status: 400
  # end

  # def specific_error(model)
  #   render json: {error: model.errors.full_messages}, status: 400
  # end 
end
