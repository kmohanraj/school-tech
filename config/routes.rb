Rails.application.routes.draw do

  # get 'assign_marks/index'
  # get 'assign_marks/new'
  resources :students
  # resources :assign_marks, :except => [:new]
  get "/assign_marks/new/:id" => "assign_marks#new", as: :new_assign_mark

  root "staffs#index"
  devise_for :users, skip: [:registration]
  resources :staffs
  get "/staffs/new_mark/:id", to: "staffs#new_mark", as: :new_mark
  post "/staffs/assign_mark/:id", to: "staffs#assign_mark", as: :staff_assign_mark
  put "/staffs/assign_edit/:id", to: "staffs#assign_edit", as: :assign_edit


  match 'staffs/:id' => 'staffs#destroy', :via => :delete, :as => :admin_destroy_user
  get "/subjects/assign/:id", to: "subjects#assign", as: :assign
  post "/subjects/assign_subject/:id", to: "subjects#assign_subject", as: :assign_subject

  resources :subjects
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
