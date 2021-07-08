Rails.application.routes.draw do
  get 'trial_status/progress'
  get 'trial_status/show_progress'
  get 'trial_status/mark_complete'
  get 'subjects/index'
  get 'subjects/show'
  get 'subjects/create'
  get 'subject/index'
  get 'subject/show'
  get 'subject/create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  post 'create_study', to: 'studies#create'
  get 'studies', to: 'studies#index'
  patch 'update_study/:id' , to: 'studies#update'

  get 'active_studies' , to: 'studies#active'

  get 'enrollments/index'
  get 'enrollments/new'


  # newly added
  get 'subjects/index'
  get 'subjects/new'
  
  # This is resourceful route
  resources :studies

  #nd
  resources :study_groups
  resources :sites
  resources :enrollments, except:['show','delete']

  #newly added
  resources :subjects, except:['show','delete']


  # If you want to create routes for specific methods then write 
  # resources :studies, only: [:index, :update, :create]
end
