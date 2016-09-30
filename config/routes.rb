Rails.application.routes.draw do
  get '/', to: 'users#index', as: 'index'
  get'/users/show/calendar', to: 'users#calendar', as: 'user_calendar'
  devise_for :users
  get '/users/profile', to: 'users#profile'
  get '/users/show', to: 'users#show', as: 'show_user'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api do
  	namespace :v1 do
  		get 'matches/index_participating', to: 'matches#index_participating'
  		get 'matches/index_all', to: 'matches#index_all' 
  	end
  end
end
