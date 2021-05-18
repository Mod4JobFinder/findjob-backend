class JobListingSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :title, :company, :url, :description, :location, :categories, :date
end
