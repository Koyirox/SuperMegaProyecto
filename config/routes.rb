Rails.application.routes.draw do

  

  resources :podcasts do
    resources :comments
  end

  get 'podcasts/new'

  post 'podcasts', to: 'podcasts#create'

  get 'podcast/:id', to: 'podcasts#show'

  get 'podcasts/:id/edit', to: 'podcasts#edit'

  patch 'podcasts/:id', to: 'podcasts#update'

  delete '/podcasts/:id', to: 'podcasts#destroy', as:'delete'

  root 'podcasts#index'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
