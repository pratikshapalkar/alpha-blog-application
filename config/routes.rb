Rails.application.routes.draw do

  ## Devise authentication routes
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    confirmations: 'users/confirmations'
  }

  root to: 'dashboard#index'

  ## API routes
  scope :module => 'api', defaults: { format: 'json' } do
    scope :module => 'v1', defaults: { format: 'json' } do 
      mount_devise_token_auth_for 'User', as: 'auth', at: 'api/v1/users', controllers: {
        registrations: 'api/v1/override/registrations',
        sessions: 'api/v1/override/sessions'
      }
    end
  end

  namespace :api, defaults: { format: 'json' } do
    namespace :v1, defaults: { format: 'json' } do
      resources :articles
    end
  end

  resources :articles, only: [:index]
end
