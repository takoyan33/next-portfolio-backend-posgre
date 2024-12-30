Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
    namespace 'api' do
    namespace 'v1' do
      resources :posts, only: [:index]
      resources :histories, only: [:index]
      resources :jobs, only: [:index]
      resources :licenses, only: [:index]
      resources :portfolios, only: [:show, :index]
      resources :front_skills, only: [:index]
      resources :back_skills, only: [:index]
      resources :infra_skills, only: [:index]
      resources :other_skills, only: [:index]
    end
  end
end
