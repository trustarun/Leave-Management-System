LeaveManagementSystem::Application.routes.draw do
  devise_for :users,  :controllers => { :registrations => "users/Registrations" }
  root :to => "holidays#index"
  resources :holidays
  resources :leaves do
    member do
      get 'leave_history'
      put 'approve_leave'
    end
    get 'leave_to_approve', :on => :collection
  end
end
