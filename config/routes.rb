LeaveManagementSystem::Application.routes.draw do
  devise_for :users,  :controllers => { :registrations => "users/Registrations" }
  root :to => "holidays#index"
  resources :holidays
  resources :leaves do
    put 'approve_leave', :on => :member
    get 'leave_to_approve', :on => :collection
  end
end
