Rails.application.routes.draw do
  resources :restaurants do
    resources :reviews, only: [:new, :create]
    # # Additonal routes that relate to restaurants go here:
    # collection do
    #   # Custom index
    #   # /restaurants/whatever_word_you_say
    #   get :top
    # end

    # member do
    #   # Custom show
    #   # /restaurant/:id/whatever_word_you_say
    #   get :chef
    # end
  end

  # /reviews/id
  resources :reviews, only: [:destroy]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  # get "/restaurants/top", to: "restaurants#top"
  # get "/restaurants/:id/chef", to: "restaurants#chef"
end
