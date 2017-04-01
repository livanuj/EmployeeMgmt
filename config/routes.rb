Rails.application.routes.draw do
	resources :issues, except: [:destroy, :update]
	resources :completed_issues
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
