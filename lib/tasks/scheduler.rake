desc "This task is called by the Heroku scheduler add-on"
task :update_database => :development do
  puts "destroying job listing"
  JobListing.destroy_all
  puts "done."
end