class Api::V1::SavedJobsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])
    saved_job = user.saved_jobs.create!(job_params)
    if saved_job.save
      @serial = SavedJobSerializer.new(saved_job)
      render json: @serial
    else 
      invalid_params
    end 
  end 

  def destroy
    return invalid_params if !params[:id]
    SavedJob.find(params[:id]).destroy 
  end 

  private 

  def job_params
    params.permit(:id, :title, :location, :company, :url, :description)
  end
end 