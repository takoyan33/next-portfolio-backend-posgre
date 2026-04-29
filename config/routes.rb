Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
    namespace 'api' do
    namespace 'v1' do
      post 'auth/register', to: 'auth#register'
      post 'auth/login', to: 'auth#login'
      get 'auth/validate', to: 'auth#validate'
      resources :posts, only: [:index]
      resources :histories, only: [:show, :index, :create, :update]
      resources :jobs, only: [:show, :index, :create, :update]
      resources :licenses, only: [:show, :index, :create, :update]
      resources :portfolios, only: [:show, :index, :create, :update]
      resources :front_skills, only: [:show, :index, :create, :update]
      resources :back_skills, only: [:show, :index, :create, :update]
      resources :infra_skills, only: [:show, :index, :create, :update]
      resources :other_skills, only: [:show, :index, :create, :update]
      resources :profiles, only: [:show, :index, :create, :update]
    end
  end
  root to: proc { [200, {}, ['OK']] }
end
