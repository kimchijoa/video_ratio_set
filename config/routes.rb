Rails.application.routes.draw do
  resources :save_videos
  resources :firsts
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'firsts#index'

  get 'first/token', to: 'firsts#token_test', as: 'token'
  get 'first/login', to: 'firsts#login', as: 'login'
  get 'first/logout', to: 'firsts#logout', as: 'logout'
  get 'first/content01', to: 'firsts#content01', as: 'content01'
  post 'first/file_save', to: 'firsts#file_save', as: 'file_save'
  get 'first/video_ratio_wait/:id', to: 'firsts#video_ratio_wait', as: 'video_ratio_wait'
  get 'first/start_ratio/:id', to: 'firsts#start_ratio', as: 'start_ratio'

end
