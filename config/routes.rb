Rails.application.routes.draw do
  resources :firsts
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'firsts#index'

  get 'first/token', to: 'firsts#token_test', as: 'token'
  get 'first/logout', to: 'firsts#logout', as: 'logout'
end
