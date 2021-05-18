class Api::V1::SavedJobsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])
    return invalid_params if user.nil?
    saved_job = user.saved_jobs.create(job_params)
    if saved_job.save
      @serial = SavedJobSerializer.new(saved_job)
      render json: @serial, status: 201
    else 
      invalid_params
    end 
  end 

  def destroy
    return invalid_params if !params[:id]
    saved_job = SavedJob.find(params[:id])
    saved_job.destroy
    render json: {data: 'saved job destroyed'}
  end 

  private 

  def job_params
    params.permit(:id, :title, :location, :company, :url, :description)
  end
end 