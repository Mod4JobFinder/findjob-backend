Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do 
      post '/users', to: 'users#create'
      post '/sessions', to: 'sessions#create'
      get '/salaries', to: 'salaries#index'
    end
  end
end
