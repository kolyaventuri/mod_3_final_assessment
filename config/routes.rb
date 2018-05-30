Rails.application.routes.draw do
  root "welcome#index"

  post '/word/validate', to: 'word/validate#create', as: 'word_lookup'

  namespace :api do
    namespace :v1 do
      resources :games, only: [:show] do
        resources :plays, only: [:create]
      end
    end
  end
end
