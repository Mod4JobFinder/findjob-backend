class Api::V1::JobListingsController < ApplicationController
  def index 
    return invalid_params if !params[:city]
    jobs = JobListing.where(search_city: params[:city], search_title: params[:title]) if params[:title]
    jobs = JobListing.where(search_city: params[:city]) if !params[:title]

    if jobs.empty? && params[:title]
      jobs = JobFacade.create_job_listings(params[:city], params[:title])
    elsif jobs.empty? && !params[:title]
      jobs = JobFacade.create_job_listings(params[:city])
    end

    @serial = JobListingSerializer.new(jobs)
    render json: @serial
  end
end
