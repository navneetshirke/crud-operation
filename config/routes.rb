Rails.application.routes.draw do
  namespace :api do
    resources :user do
  end
  get 'users', to: 'users&index', as: 'users'
  get 'typeahead/:input', to: 'users#typeahead', as: 'typeahead'
end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
