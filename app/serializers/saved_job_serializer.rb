class SavedJobSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :title, :location, :company, :url, :description
end
