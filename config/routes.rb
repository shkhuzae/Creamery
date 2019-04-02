Rails.application.routes.draw do
  resources :assignments
  resources :employees
  resources :stores
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
  get 'forstore/id' => 'assignments#forstore', as: :forstore_assignments
  get 'foremployee/id' => 'assignments#foremployee', as: :foremployee_assignments

  
  
end
