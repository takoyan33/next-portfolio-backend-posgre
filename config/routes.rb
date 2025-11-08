Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
    namespace 'api' do
    namespace 'v1' do
      post 'auth/register', to: 'auth#register'
      post 'auth/login', to: 'auth#login'
      resources :posts, only: [:index]
      resources :histories, only: [:show,:index,:edit, :update]
      resources :jobs, only: [:show, :index,:edit, :update]
      resources :licenses, only: [:show, :index,:edit, :update]
      resources :portfolios, only: [:show, :index, :edit, :update]
      resources :front_skills, only: [:show,:index,:edit, :update]
      resources :back_skills, only: [:show,:index,:edit, :update]
      resources :infra_skills, only: [:show,:index,:edit, :update]
      resources :other_skills, only: [:show,:index,:edit, :update]
    end
  end
  root to: proc { [200, {}, ['OK']] }
end
