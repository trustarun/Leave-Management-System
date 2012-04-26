LeaveManagementSystem::Application.routes.draw do
  devise_for :users,  :controllers => { :registrations => "users/Registrations" }
  root :to => "holidays#index"
  resources :holidays
  resources :leaves do
    member do
      put 'approve_leave'
    end
    collection do
      get 'leave_history'
      get 'leave_to_approve'
    end
  end
end
