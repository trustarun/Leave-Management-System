LeaveManagementSystem::Application.routes.draw do
  devise_for :users,  :controllers => { :registrations => "users/Registrations" }
  root :to => "holidays#index"
  resources :holidays
  resources :leaves
end
