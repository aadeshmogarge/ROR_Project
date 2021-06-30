Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  post 'create_study', to: 'studies#create'
  get 'studies', to: 'studies#index'
  patch 'update_study/:id' , to: 'studies#update'

  get 'active_studies' , to: 'studies#active'

  get 'enrollments/index'
  get 'enrollments/new'
  
  # This is resourceful route
  resources :studies

  #nd
  resources :study_groups
  resources :sites
  resources :enrollments, except:['show','delete']


  # If you want to create routes for specific methods then write 
  # resources :studies, only: [:index, :update, :create]
end
