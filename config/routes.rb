Rails.application.routes.draw do
  resources :users
  resources :shifts
  resources :store_flavors
  resources :flavors
  resources :shift_jobs
  resources :jobs
  resources :assignments
  resources :employees
  resources :stores
  resources :demos, only: [:new, :create, :destroy]
  
  get 'demos/new', to: 'demos#new', as: :login
  get 'demos/destroy', to: 'demos#destroy', as: :logout


  #root 'demos#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root to: 'pages#home', as: :home
  
  get 'active' => 'stores#active', as: :active_stores
  get 'inactive' => 'stores#inactive', as: :inactive_stores
  
  get 'younger' => 'employees#younger', as: :younger_employees
  get 'older' => 'employees#older', as: :older_employees
  get 'active/employees' => 'employees#active', as: :active_employees
  get 'inactive/employees' => 'employees#inactive', as: :inactive_employees
  get 'regulars' => 'employees#regulars', as: :regulars_employees
  get 'managers' => 'employees#managers', as: :managers_employees
  get 'admins' => 'employees#admins', as: :admins_employees
  
  get 'current' => 'assignments#current', as: :current_assignments
  get 'past' => 'assignments#past', as: :past_assignments
  get 'by_store' => 'assignments#by_store', as: :bystore_assignments
  get 'by_employee' => 'assignments#by_employee', as: :byemployee_assignments
  get 'for_store' => 'assignments#for_store', as: :forstore_assignments
  get 'for_employee' => 'assignments#for_employee', as: :foremployee_assignments
  get 'for_paylevel' => 'assignments#for_paylevel', as: :forpaylevel_assignments
  get 'for_role' => 'assignments#for_role', as: :forrole_assignments
  
  
end
