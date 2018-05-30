Rails.application.routes.draw do
  root "welcome#index"

  post '/word/validate', to: 'word/validate#create', as: 'word_lookup'
end
