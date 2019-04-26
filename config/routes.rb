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
  

  get 'demos/home', to: 'demos#create', as: :login
  get 'demos/employeedash', to: 'demos#employeedash', as: :employeedash
  get 'demos/managerdash', to: 'demos#managerdash', as: :managerdash
  get 'demos/admindash', to: 'demos#admindash', as: :admindash
  
  get 'demos/destroy', to: 'demos#destroy', as: :logout

  

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  get 'pages/home', to: 'pages#home', as: :homepage
  root to: 'demos#home', as: :home
  
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

  get 'active' => 'flavors#active', as: :active_flavors
  get 'inactive' => 'flavors#inactive', as: :inactive_flavors 
  
  get 'active' => 'jobs#active', as: :active_jobs
  get 'inactive' => 'jobs#inactive', as: :inactive_jobs 
  
  get 'by_store' => 'shifts#by_store', as: :bystore_shifts
  get 'by_employee' => 'shifts#by_employee', as: :byemployee_shifts
  get 'past' => 'shifts#past', as: :past_shifts
  get 'upcoming' => 'shifts#upcoming', as: :upcoming_shifts
  get 'completed' => 'shifts#completed', as: :completed_shifts
  get 'incomplete' => 'shifts#incomplete', as: :incomplete_shifts
  
end
